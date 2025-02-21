#!/bin/bash

# 定义节点配置文件的路径
NODES_FILE="bash_script/distribute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
kill -9 $(pgrep -f LLaMA)
EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"