#!/bin/bash
set -x


yaml_files=(
    # "bash_script/dpo_qwen2vl_mix_v3_127k_fixed_html_code37_origin_64k_epoch1.yaml"
    # "bash_script/dpo_qwentext25_html_chart_code37_origin_89k_epoch1.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_127k_html_code37_origin_64k.yaml"
    # "bash_script/dpo_qwentext25_html_chart_code37_origin_89k.yaml"
    # "bash_script/dpo_qwen2vl_v1_code_190k_html_origin_image_7b_27k.yaml"
    # "bash_script/qwen2vl_html_code_chart_stack_256k.yaml"
    # "bash_script/dpo_qwen2vl_v3_html_chart_code37_origin_89k.yaml"
    # "bash_script/dpo_mix190k_origin_image_45k_chart_bench.yaml"
    # "bash_script/dpo_qwen2vl_v1_code_190k_html_chart_code37_origin_89k.yaml"
    # "bash_script/qwen72b_html_chart_code_data_v2_code_190k.yaml"
    # "bash_script/qwen72b_html_chartbench_mix_v3_127k.yaml"
    "bash_script/qwen72b_html_code_chart_stack_256k.yaml"
)

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=4 NODE_RANK=3 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"



python run_gpu.py