CUDA_DEVICE_VISIVLE=0 llamafactory-cli train bash_script/llama3_full_sft_debug.yaml


FORCE_TORCHRUN=1 NNODES=1 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/math1.5b_data_v1_lora.yaml


FORCE_TORCHRUN=1 llamafactory-cli train bash_script/math1.5b_data_v1_lora.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/math1.5b_data_v1_1node_bsz128.yaml