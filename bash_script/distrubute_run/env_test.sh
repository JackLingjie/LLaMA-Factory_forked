#!/bin/bash

pdsh -R ssh -w ^bash_script/distrubute_run/node_config/nodes.txt 'bash -c "
cd /tmp && \
git clone https://github.com/JackLingjie/LLaMA-Factory_forked.git && \
cd LLaMA-Factory_forked && \
"'