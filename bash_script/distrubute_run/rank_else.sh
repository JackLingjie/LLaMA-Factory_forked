#!/bin/bash

# 定义变量
NNODES=2
MASTER_ADDR="node-0"
MASTER_PORT=12335
NODES_FILE="bash_script/distrubute_run/node_config/nodes.txt"

# 读取节点列表
NODES=($(cat $NODES_FILE))

# 确保节点数量匹配
if [ "${#NODES[@]}" -ne "$NNODES" ]; then
    echo "Error: Number of nodes in file does not match NNODES ($NNODES)."
    exit 1
fi

# 定义要在远程节点上运行的脚本
script=$(cat << 'EOF'
cd /tmp/LLaMA-Factory_forked
# 更新代码
git pull
# 设置环境变量并运行训练命令
export NCCL_NET=IB
export FORCE_TORCHRUN=1
export NNODES=$NNODES
export NODE_RANK=$NODE_RANK
export MASTER_ADDR=$MASTER_ADDR
export MASTER_PORT=$MASTER_PORT

llamafactory-cli train bash_script/qwen2vl_lora_sft.yaml
EOF
)

# 逐个节点运行命令，但跳过第一个节点（NODE_RANK=0）
for (( i=1; i<NNODES; i++ )); do
    NODE_RANK=$i
    NODE=${NODES[$i]}

    # 使用pdsh执行命令，输出重定向到 /dev/null
    pdsh -R ssh -w $NODE "
        export NODE_RANK=$NODE_RANK;
        export NNODES=$NNODES;
        export MASTER_ADDR=$MASTER_ADDR;
        export MASTER_PORT=$MASTER_PORT;
        bash -c '$script'" > /dev/null 2>&1 &
done

# 等待所有 pdsh 命令完成
wait