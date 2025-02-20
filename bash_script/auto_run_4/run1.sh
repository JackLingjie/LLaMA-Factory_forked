#!/bin/bash
set -x

yaml_files=(
    "bash_script/math1.5b_data_v1.yaml"
    
)

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=4 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"

python run_gpu.py
