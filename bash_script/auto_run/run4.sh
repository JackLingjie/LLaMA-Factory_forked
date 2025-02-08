#!/bin/bash
set -x

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chartbench_images_46k_raw_answer.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_qwen72b_47k_job.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_html_chart_code_data_v2_code_190k.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_origin_image_7b_32k_score70.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_origin_chart_24k_html_mix52k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_html_chart_code_data_v2_code_190k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_text_2_5_500k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart32k_html_60k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_chart_html_origin_95k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_qwen2vl_v1_raw_190k_origin_chart_24k_html_mix52k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_mix190k_html_chart_code37_origin_89k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_qwen2_text2.5_500k_html_chart_code_data_v2_code_190k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_html_code_chart_stack_256k.yaml

yaml_files=(
    "bash_script/dpo_qwentext25_html_chart_code37_origin_89k_epoch1.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_127k_html_code37_origin_64k.yaml"
    # "bash_script/dpo_qwentext25_html_chart_code37_origin_89k.yaml"
    # "bash_script/dpo_qwen2vl_v1_code_190k_html_origin_image_7b_27k.yaml"
    # "bash_script/qwen2vl_html_code_chart_stack_256k.yaml"
    # "bash_script/dpo_qwen2vl_v3_html_chart_code37_origin_89k.yaml"
    # "bash_script/dpo_mix190k_origin_image_45k_chart_bench.yaml"
    # "bash_script/dpo_qwen2vl_v1_code_190k_html_chart_code37_origin_89k.yaml"

)

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"



python run_gpu.py