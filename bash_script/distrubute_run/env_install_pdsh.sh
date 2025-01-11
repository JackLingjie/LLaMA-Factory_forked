#!/bin/bash

# 定义节点配置文件的路径
NODES_FILE="bash_script/distrubute_run/node_config/nodes.txt"

script=$(cat << 'EOF'
cd /tmp

# 检查目录是否存在
if [ -d "LLaMA-Factory_forked" ]; then
    cd LLaMA-Factory_forked
    git fetch origin
else
    git clone https://github.com/JackLingjie/LLaMA-Factory_forked.git
    cd LLaMA-Factory_forked
fi

# 检查并切换到dev分支
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" != "dev" ]; then
    git checkout -b dev origin/dev || git checkout dev
fi

# 安装所需的Python包
pip install deepspeed==0.14.4
pip install -U flash-attn==2.6.3 --no-build-isolation
pip install tensorboard
pip install -e ".[torch,metrics]"
EOF
)

pdsh -R ssh -w ^$NODES_FILE "bash -c '$script'"