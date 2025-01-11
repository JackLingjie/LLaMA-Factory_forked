#!/bin/bash
set -x
# 定义节点配置文件的路径
NODES_FILE="bash_script/distrubute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
kill $(pgrep -f run_gpu)
EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"