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
llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_stage2_job_2nodes_1e3_preprocess.yaml
llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_stage2_job_2nodes_1e3_preprocess.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_job_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_job_2nodes_1e5_web2code.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_merger_job_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_mid_sft_llm_merger_job_2nodes_1e5_web2code.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_test_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_mid_sft_mm_proj_test_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_code_sft_llm_job_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_pretrain_code_sft_llm_job_2nodes_1e5_web2code.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_stage2data_sft_mm_proj_test_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/qwen2vl_coder_stage2data_sft_mm_proj_test_job_2nodes_1e3.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage15_3000_llm_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage15_3000_llm_2nodes_1e5_web2code.yaml

llamafactory-cli train bash_script/pretrain_ocr_code_v1_mm_proj_job_2nodes_1e3_preprocess.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v4_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v4_mm_proj_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v3_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v3_mm_proj_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-6 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v2_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-6 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_ocr_code_v2_mm_proj_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/mixv1_llm_2nodes_1e5_web2code.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/mixv1_llm_2nodes_1e5_web2code.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_code_111k_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_code_111k_mm_proj_job_2nodes_1e3.yaml

llamafactory-cli train bash_script/pretrain_web2code_670k_mm_proj_job_2nodes_1e3_preprocess.yaml

llamafactory-cli train bash_script/pretrain_web2code_all_mm_proj_job_2nodes_1e3_preprocess.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_web2code_670k_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_web2code_670k_mm_proj_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_web2code_all_mm_proj_job_2nodes_1e3.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/pretrain_web2code_all_mm_proj_job_2nodes_1e3.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_filter.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-4 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_filter.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-6 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_fix.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-6 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_fix.yaml

llamafactory-cli train bash_script/pretrain_web2code_670k_mm_proj_job_2nodes_1e3_preprocess.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_filter_re_img.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_filter_re_img.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_2500_gpt4o_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_gpt4o_right_860_gpt4o_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_related_right_797_gpt4o_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_gpt4o330_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_gpt4o_right_860_gpt4o_670k_job.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/staged2_sft_mmcode_gpt4o_right_860_gpt4o_pretrain_llm.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v1_760k.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v1_760k.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v2_760k.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_v2_760k.yaml



bash_script/stage2_llm_2nodes_1e5_web2code_rick_v2_760k.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_img_revised_80k_v1.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_img_revised_80k_v1.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_img_revised_html_tag_80k_v2.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_img_revised_html_tag_80k_v2.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_revised_81k_v2.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_revised_81k_v2.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chart_exp.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_chart_exp.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_750k_v1.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_750k_v1.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_html_tag_750k_v2.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_web2code_rick_revised_html_tag_750k_v2.yaml


export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_code_data_mix_20k_purify.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-0 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_code_data_mix_20k_purify.yaml

export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=0 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_code21_html80_mix_100k.yaml
export NCCL_NET=IB
FORCE_TORCHRUN=1 NNODES=2 NODE_RANK=1 MASTER_ADDR=node-2 MASTER_PORT=12335 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_code21_html80_mix_100k.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/stage2_llm_2nodes_1e5_code_data_mix_20k_purify.yaml

FORCE_TORCHRUN=1 llamafactory-cli train bash_script/qwen2vl_text_img_exp.yaml