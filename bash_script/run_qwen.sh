FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2200_job.yaml
FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2500_job.yaml
FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2200_2epoch_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2500_gpt4o_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_llm_merger_test.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_llm_merger_test_2b.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_test_job_preprocess_1M_sampled.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_test_job_2nodes_1e3_preprocess_test.yaml