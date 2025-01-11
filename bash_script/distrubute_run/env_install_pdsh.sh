#!bin/bash

pdsh -w ^nodes.txt 'bash -c "  
cd /tmp && \  
git clone https://github.com/JackLingjie/LLaMA-Factory_forked.git && \  
cd LLaMA-Factory_forked && \  
git checkout -b dev origin/dev && \  
pip install deepspeed==0.14.4 && \  
pip install -U flash-attn==2.6.3 --no-build-isolation && \  
pip install tensorboard && \  
pip install -e \".[torch,metrics]\"  
"'  