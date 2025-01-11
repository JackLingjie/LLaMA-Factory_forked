#!/bin/bash

# 定义节点配置文件的路径
NODES_FILE="bash_script/distrubute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
kill $(pgrep -f run_gpu)
sudo apt-get install lsof
# 查找并杀死占用指定端口的进程
PID=\$(lsof -t -i:$PORT)
kill -9 \$PID

EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"