#!/bin/bash
set -x

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_qwen72b_47k_job.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_html_chartbench_mix_v3_127k.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chartbench_images_46k_raw_answer.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_dpo_4o_image_7b_32k_score70.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_bsz128_1e5_html_chart_stack_data_193k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_html_chart_code_data_v1_raw_190k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_stage2_job_2nodes_1e3_500k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_stage2data_sft_mm_proj_text2.5_1m.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_html_origin_41k_72b.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_chart_html_code_4o_95k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_html_chart_mix_v3_4o_code_score80_42k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_qwen2vl_v1_code_190k_origin_chart_24k_html_mix52k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_mix190k_html_chart_code37_4oimg_89k.yaml

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_mix190k_dpo_code37k.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_qwen2_text2.5_1M_html_chart_code_data_v2_code_190k.yaml


# bash_script/stage2_qwencoder2.5_500k_html_chart_code_data_v2_code_190k.yaml
python run_gpu.py
