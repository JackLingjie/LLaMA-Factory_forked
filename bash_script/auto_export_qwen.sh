#!/bin/bash  

set -x

# 定义模型名称的数组  
model_names=(
    # "ta_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "qwen2_vl-7b_3072_bsz8_mmcode_single_right_2200"
    # "qwen2_vl-7b_3072_bsz8_mmcode_single_right_2500"
    "qwen2_vl-7b_3072_bsz8_mmcode_single_right_2200_2epoch"
)  # 替换成你的模型名称列表  
  
# 定义YAML文件路径  
yaml_file="bash_script/export_model/merge_default_template_sft.yaml"  
  
# 临时文件路径，用于保存修改后的 YAML 文件  
# temp_yaml_file="bash_script/export_model/temp_auto_merge_dpo.yaml"  
  
# 循环处理每个模型名称  
for model_name in "${model_names[@]}"; do  
    temp_yaml_file="bash_script/export_model/temp_auto_merge_sft_${model_name}.yaml"  
    # 替换 YAML 文件中的占位符，并写入临时 YAML 文件  
    echo $model_name
    sed "s|{{model_name}}|$model_name|g" "$yaml_file" > "$temp_yaml_file"  
  
    # 执行命令  
    llamafactory-cli export "$temp_yaml_file"  
done  

echo "Finish all merge jobs"
# 删除临时文件  
# rm "$temp_yaml_file"  