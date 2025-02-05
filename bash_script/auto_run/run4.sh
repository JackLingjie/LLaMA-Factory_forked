#!/bin/bash
set -x

# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chartbench_images_46k_raw_answer.yaml
# export NCCL_NET=IB
# FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/dpo_chart_qwen72b_47k_job.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_html_chart_code_data_v2_code_190k.yaml


python run_gpu.py