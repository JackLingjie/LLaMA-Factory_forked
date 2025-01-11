#!/bin/bash

# 定义节点配置文件的路径
NODES_FILE="bash_script/distrubute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
sudo kill $(pgrep -f run_gpu)
if ! command -v lsof &> /dev/null; then
    echo 'Installing lsof on $NODE...'
    sudo apt-get install -y lsof
fi

# 查找并杀死占用指定端口的进程
PID=\$(lsof -t -i:$PORT)
if [ -n \"\$PID\" ]; then
    echo 'Killing process on port $PORT on $NODE...'
    kill -9 \$PID
else
    echo 'No process found on port $PORT on $NODE.'
fi
EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"