FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2200_job.yaml
FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2500_job.yaml
FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2200_2epoch_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_lora_sft_mmcode_2500_gpt4o_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_llm_merger_test.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_coder_llm_merger_test_2b.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_test_job_preprocess_1M_sampled.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_test_job_2nodes_1e3_preprocess_test.yaml

unset NCCL_NET; unset FORCE_TORCHRUN; unset NNODES; unset NODE_RANK; unset MASTER_ADDR; unset MASTER_PORT; llamafactory-cli train bash_script/pretrain_ocr_code_v2_mm_proj_job_2nodes_1e3_preprocess.yaml
llamafactory-cli train bash_script/pretrain_ocr_code_v2_mm_proj_job_2nodes_1e3_preprocess.yaml

unset NCCL_NET; unset FORCE_TORCHRUN; unset NNODES; unset NODE_RANK; unset MASTER_ADDR; unset MASTER_PORT; llamafactory-cli train bash_script/pretrain_ocr_code_v3_mm_proj_job_2nodes_1e3_preprocess.yaml

unset NCCL_NET; unset FORCE_TORCHRUN; unset NNODES; unset NODE_RANK; unset MASTER_ADDR; unset MASTER_PORT; llamafactory-cli train bash_script/pretrain_ocr_code_v4_mm_proj_job_2nodes_1e3_preprocess.yaml

llamafactory-cli train bash_script/pretrain_web2code_669k_new_img_mm_proj_job_2nodes_1e3_preprocess.yaml

llamafactory-cli train bash_script/pretrain_web2code_670k_mm_proj_job_2nodes_1e3_preprocess.yaml


llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v1_760k_preprocess.yaml

llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v2_760k_preprocess.yaml

llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v3_503k_preprocess.yaml


llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_750k_v1_preprocess.yaml


llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_html_tag_750k_v2_process.yaml

llamafactory-cli train bash_script/qwen2vl_text_img_exp.yaml

llamafactory-cli train bash_script/qwen2vl_text_img_exp.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/chart_dpo_4o_qwen72b_47k_test.yaml

llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_bsz128_1e5_stack_html_147k_process.yaml

llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_stage2_job_2nodes_1e3_500k_process.yaml