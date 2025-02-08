#!/bin/bash
set -x


yaml_files=(
    # "bash_script/stage2_llm_2nodes_1e5_html_chart_stack_data_170k.yaml"
    # "bash_script/dpo_qwen2vl_v1_code_190k_chart_html_origin_95k.yaml"
    # "bash_script/dpo_mix190k_origin_image_7b_32k_score80.yaml"
    # "bash_script/dpo_mix190k_origin_image_7b_18k_chart_bench_score80.yaml"
    # "bash_script/qwen2vl_html_chart_data.yaml"
    # "bash_script/dpo_qwen2vl_v3_cchart_html_origin_95k.yaml"
    # "bash_script/dpo_qwen2vl_v3_chart_html_origin_52k.yaml"
    # "bash_script/stage2_qwen2_text2.5_1M_html_code_chart_stack_256k.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_127k_html_origin_7b_27k.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_html_chart_code37_origin_89k.yaml"
    # "bash_script/dpo_qwentext25_html_origin_image_7b_27k.yaml"
    # "bash_script/dpo_mix190k_v2_html_code37_origin_64k.yaml"
    # "bash_script/dpo_qwentext25_html_code37_origin_64k.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_html_chart_code37_origin_89k_epoch1.yaml"
    # "bash_script/dpo_mix190k_v2_html_code37_origin_64k_epoch1.yaml"
    # "bash_script/dpo_qwentext25_html_code37_origin_64k_epoch1.yaml"
    "bash_script/qwen72b_html_chart_code_data_v2_code_190k.yaml"

)

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"

python run_gpu.py