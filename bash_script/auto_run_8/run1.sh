#!/bin/bash
set -x

source bash_script/auto_run_4/yaml_files.sh  # 加载 YAML 配置

YAML_FILE="${yaml_files[0]}"

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=8 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train "$YAML_FILE"

python run_gpu.py
