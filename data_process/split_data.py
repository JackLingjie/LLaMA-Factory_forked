import json
import os
from concurrent.futures import ThreadPoolExecutor, as_completed
from tqdm import tqdm  # 进度条库

# 输入文件路径
input_file = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter.json"

# 打开并加载原始数据
with open(input_file, 'r') as f:
    web2code_all_data = json.load(f)

# 过滤出只有两个消息的项
one_turn = [item for item in web2code_all_data if len(item["messages"]) == 2]

# 将数据分成 6 份
num_splits = 6
split_size = len(one_turn) // num_splits
splits = [one_turn[i * split_size:(i + 1) * split_size] for i in range(num_splits - 1)]
splits.append(one_turn[(num_splits - 1) * split_size:])  # 剩余的数据放入最后一份

# 输出路径模板
output_dir = "/mnt/lingjiejiang/multimodal_code/data/Web2Code"
os.makedirs(output_dir, exist_ok=True)

# 保存每一份数据到文件
for i, split in enumerate(splits):
    output_file = os.path.join(output_dir, f"Web2Code_split_{i + 1}.json")
    with open(output_file, 'w') as f:
        json.dump(split, f, indent=4, ensure_ascii=False)

print("数据分割并保存完成！")
