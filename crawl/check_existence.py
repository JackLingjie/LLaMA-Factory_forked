import json  
import os  
from tqdm import tqdm  
  
# 读取 JSON 文件  
v
  
# 定义基础目录  
base_directory = "/mnt/lingjiejiang/multimodal_code/data/supply_images"  
  
# 列表存储不存在的文件信息  
missing_files = []  
  
# 使用 tqdm 包装迭代器以显示进度  
for url, relative_filename in tqdm(url_to_filename.items(), desc="Checking files"):  
    # 生成完整的文件路径  
    full_file_path = os.path.join(base_directory, relative_filename)  
  
    # 检查文件是否存在  
    if not os.path.exists(full_file_path):  
        # 如果文件不存在，将 URL 和路径加入列表  
        missing_files.append({'url': url, 'path': full_file_path})  
        print(f"url: {url}, path: {full_file_path}")
# 将不存在的文件信息写入文件  
missing_files_output_path = "/mnt/lingjiejiang/multimodal_code/data/stack_supply/url_to_filename/missing_files.json"  
with open(missing_files_output_path, "w") as f:  
    json.dump(missing_files, f, indent=4)  
  
print("Missing files have been recorded in missing_files.json.")  