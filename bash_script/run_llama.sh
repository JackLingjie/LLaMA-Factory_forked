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

bash_script/qwen2vl_lora_sft_preprocess.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_tokenized_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_tokenized_job_zero.yaml