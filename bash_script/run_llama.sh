llamafactory-cli train bash_script/qwen2vl_lora_sft.yaml
llamafactory-cli train bash_script/qwen2vl_lora_sft.yaml
FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_job.yaml


llamafactory-cli train bash_script/qwen2vl_preprocess.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_preprocess.yaml


llamafactory-cli train bash_script/qwen2vl_preprocess_val.yaml

llamafactory-cli train examples/train_lora/llama3_preprocess.yaml

llamafactory-cli train bash_script/qwen2vl_preprocess_val.yaml


FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_preprocess.yaml

llamafactory-cli train bash_script/qwen2vl_lora_sft_job_preprocessing.yaml

llamafactory-cli train bash_script/qwen2vl_preprocess_val.yaml

llamafactory-cli train bash_script/qwen2vl_lora_sft_amd_test.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_tokenized_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_tokenized_job_zero.yaml

llamafactory-cli export bash_script/merge/qwen2vl_sft_web2code_merge.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_job.yaml

llamafactory-cli export bash_script/merge/qwen2vl_sft_mmcode_merge.yaml

llamafactory-cli train bash_script/qwen2vl_coder_lora_sft_test.yaml

llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_preprocess.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job.yaml


llamafactory-cli train bash_script/qwen2vl_coder_lora_sft_test_all.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_lora_sft_test_all.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_all_part_test.yaml
llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_preprocess.yaml
llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_test_job_preprocess.yaml


llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_llm_merger_job_1nodes_1e4_web2code.yaml
export OMP_NUM_THREADS=8
export NCCL_IB_DISABLE=0
export NCCL_IB_GID_INDEX=3
export NCCL_SOCKET_IFNAME=eth0
export NCCL_DEBUG=INFO




FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes.yaml
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes.yaml

FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e4.yaml
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e4.yaml


FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e4_web2code.yaml
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e4_web2code.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_lenqi_job_2nodes_1e4.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_lenqi_job_2nodes_1e4.yaml


llamafactory-cli export bash_script/merge/qwen2vl_coder_mm_pretrained_web2code_merge.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e5_web2code.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e5_web2code.yaml
llamafactory-cli train bash_script/qwen2vl_coder_pretrain_sft_test_job_2nodes_1e5_web2code_debug.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_test_job_2nodes_1e3_preprocess.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_job_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_job_2nodes_1e5_web2code.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_merger_job_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_merger_job_2nodes_1e5_web2code.yaml

