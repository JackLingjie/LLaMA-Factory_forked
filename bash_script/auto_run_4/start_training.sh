#!/bin/bash
set -x  # 开启调试模式，显示命令执行细节

# 定义所有节点
NODES=("node-0" "node-1" "node-2" "node-3")

# 训练 YAML 配置文件（假设 YAML 已经在 `/tmp/Qwen-sft/`）
yaml_files=(
    "bash_script/model_1074k_redstone_mcq_gpqaStyle_10k_correct_train_processed_dedup_5k.yaml"
    # "bash_script/think_gen_base_deepscaler_rej_tinkgen_v2_correct_17k.yaml"
    # "bash_script/think_gen_base_deepscaler_rej_tinkgen_v2_all_dedup_20k.yaml"
    # "bash_script/aba_openr1_synthetic_openthought_aime_kodcode_aops_taco_cf_filter_output_docs_1018k.yaml"
    # "bash_script/model_928k_redstone_code_hard_21k_0314_en_chat_18k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_cf_data_937k.yaml"
    # "bash_script/qwen_math_add_synthetic_openr1_openthought_aime_rej_kodcode_taco_cf_data_937k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_aops_cf_1075k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_aops_1066k_resume.yaml"
    # "bash_script/deepscaler_basic_filter_v1_1.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_aops_cf_1075k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_cf_data_937k.yaml"
    # "bash_script/think_gen_base_deepscaler_basic_filter_thinkgen_v1_1.yaml"
    # "bash_script/code_910k_cf_data_filter_8k.yaml"
    # "bash_script/dedup_889k_openr1_openthought_aime_rej_kodcode_910k_dedup_0.9_815k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_aops_1066k.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aime_rej_kodcode_taco_928k.yaml"
    # "bash_script/think_gen_base_deepscaler_rej_21k.yaml"
    # "bash_script/think_gen_base_deepscaler_basic_filter_33k.yaml"
    # "bash_script/think_gen_base_deepscaler_rej_thinkgen_v1.yaml"
    # "bash_script/think_gen_base_deepscaler_basic_filter_thinkgen_v1.yaml"
    # "bash_script/think_1k_3k_889k_openr1_openthought_627k_24k_dedup_think_cnt.yaml"
    # "bash_script/ds_deepscaler_rej_thinkgen_v1_bsz128_lr1e4.yaml"
    # "bash_script/ds_deepscaler_basic_filter_thinkgen_v1_bsz128_lr1e4.yaml"
    # "bash_script/think_1k_4k_890k_openr1_983k_aime_rej_dedup_583k_without_sys.yaml"
    # "bash_script/think_1k_3k_890k_openr1_983k_aime_rej_dedup_583k_without_sys.yaml"
    # "bash_script/add_synthetic_openr1_openthought_aimerej_kodcode_aosp_instruct_1011k.yaml"
    # "bash_script/add_synthetic_openr1_aimerej_kodcode_aosp_instruct_931k.yaml"
    # "bash_script/add_890k_openr1_983k_aime_rej_dedup_AoPS_Instruct_685k.yaml"
    # "bash_script/code_890k_openr1_983k_aime_rej_dedup_kodcode_829k.yaml"
    # "bash_script/code_889k_openr1_openthought_aime_rej_kodcode_910k.yaml"
    # "bash_script/think_890k_openr1_983k_aime_rej_dedup_583k_bsz128_lr1e4.yaml"
    # "bash_script/think_890k_openr1_983k_aime_rej_dedup_583k_bsz128_lr1e4_with_sys.yaml"

)

YAML_FILE="${yaml_files[0]}"


# 训练任务所在目录
WORK_DIR="/tmp/Qwen-sft"

# 存储所有进程的 PID
PIDS=()

# 启动训练任务
for i in {0..3}; do
    NODE_RANK=$i
    NODE=${NODES[$i]}
    
    CMD="
        cd $WORK_DIR &&  # 进入工作目录
        export PATH=\$PATH:/home/aiscuser/.local/bin;  # 确保 llamafactory-cli 在 PATH 中
        export NCCL_NET=IB;
        export FORCE_TORCHRUN=1;
        export NNODES=4;
        export NODE_RANK=$NODE_RANK;
        export MASTER_ADDR=node-0;
        export MASTER_PORT=12335;
        llamafactory-cli train \"$YAML_FILE\";
        echo \"Training completed on $NODE, running run_gpu.py...\";
        python run_gpu.py  # 训练结束后执行 run_gpu.py
    "

    if [ "$NODE" == "node-0" ]; then
        echo "Starting training on $NODE (local)..."
        eval "$CMD" &  # 在本机后台运行
        PIDS+=($!)  # 记录进程 ID
    else
        echo "Starting training on $NODE (remote via SSH)..."
        ssh "$NODE" "$CMD" &  # 远程 SSH 运行
        PIDS+=($!)  # 记录进程 ID
    fi
done

# 等待所有训练任务和 run_gpu.py 任务完成
for PID in "${PIDS[@]}"; do
    wait "$PID"
done

echo "All training processes and run_gpu.py executions completed!"
