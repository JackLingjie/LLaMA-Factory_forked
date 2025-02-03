import json  
import random  
  
# 输入文件路径  
input_file = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter.json"  
# 输出文件路径  
output_file = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter_pretrain_100k.json"  
  
# 打开并加载原始数据  
with open(input_file, 'r') as f:  
    web2code_all_data = json.load(f)  
  
# 获取数据总长度  
total_length = len(web2code_all_data)  
print(f"Total data length: {total_length}")  
  
# 检查数据长度是否足够  
if total_length < 100000:  
    raise ValueError("The dataset contains fewer than 100,000 entries. Sampling is not possible.")  
  
# 随机采样100,000条数据  
sampled_data = random.sample(web2code_all_data, 100000)  
  
# 将采样的数据存储到新文件中  
with open(output_file, 'w') as f:  
    json.dump(sampled_data, f, indent=0)  
  
print("Sampled data saved successfully.")  