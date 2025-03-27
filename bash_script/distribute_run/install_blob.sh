#!/bin/bash

# 定义节点配置文件的路径
NODES_FILE="bash_script/distribute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
cd /tmp/Qwen-sft/blob
bash myblob.sh
EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"