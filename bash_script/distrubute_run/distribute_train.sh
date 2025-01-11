#!/bin/bash
set -x
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

# 逐个节点运行命令
for (( i=0; i<NNODES; i++ )); do
    NODE_RANK=$i
    NODE=${NODES[$i]}

    # 使用pdsh执行命令
    pdsh -R ssh -w $NODE "export NCCL_NET=IB; \
                          export FORCE_TORCHRUN=1; \
                          export NNODES=$NNODES; \
                          export NODE_RANK=$NODE_RANK; \
                          export MASTER_ADDR=$MASTER_ADDR; \
                          export MASTER_PORT=$MASTER_PORT; \
                          llamafactory-cli train bash_script/stage15_3000_llm_2nodes_1e5_web2code.yaml" &
done

# 等待所有 pdsh 命令完成
wait