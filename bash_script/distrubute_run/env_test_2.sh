#!/bin/bash

script=$(cat << 'EOF'
cd /tmp
git clone https://github.com/JackLingjie/LLaMA-Factory_forked.git
cd LLaMA-Factory_forked
# 在这里添加更多命令
echo "Repository cloned and directory changed"
EOF
)

pdsh -R ssh -w ^bash_script/distrubute_run/node_config/nodes.txt "bash -c '$script'"