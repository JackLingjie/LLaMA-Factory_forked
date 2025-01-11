#!bin/bash

pdsh -w ^nodes.txt 'bash -c "  
cd /tmp && \  
git clone https://github.com/JackLingjie/LLaMA-Factory_forked.git && \  
cd LLaMA-Factory_forked && \  
"'  