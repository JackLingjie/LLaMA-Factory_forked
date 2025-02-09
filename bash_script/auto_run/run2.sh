#!/bin/bash
set -x

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chartbench_images_46k_raw_answer.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_qwen72b_47k_job.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_html_chartbench_mix_v3_127k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_dpo_4o_image_7b_32k_score70.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_bsz128_1e5_html_chart_stack_data_193k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_stage2_job_2nodes_1e3_500k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_stage2data_sft_mm_proj_text2.5_1m.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_html_origin_41k_72b.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_chart_html_code_4o_95k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_4o_code_score80_42k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_qwen2vl_v1_code_190k_origin_chart_24k_html_mix52k.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_mix190k_html_chart_code37_4oimg_89k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_mix190k_dpo_code37k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_qwen2_text2.5_1M_html_chart_code_data_v2_code_190k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_qwencoder2.5_500k_html_chart_code_data_v2_code_190k.yaml
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
    # "bash_script/qwen72b_html_chart_code_data_v2_code_190k.yaml"
    # "bash_script/qwen2vl_html_chart_stack_data_193k.yaml"
    # "bash_script/dpo_qwentext25_html_7b_27k.yaml"
    # "bash_script/dpo_qwen2vl_mix_v3_chart_dpo_v1_origin_img_24k.yaml"
    "bash_script/dpo_html_chart_stack_data_193k_html_chart_code37_origin_89k.yamls"

)

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"

python run_gpu.py