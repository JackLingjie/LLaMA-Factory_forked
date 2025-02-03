import json  
import os  
  
# 获取当前脚本文件所在的目录  
current_dir = os.path.dirname(os.path.abspath(__file__))  
  
# 设置工作目录为当前文件所在的目录  
os.chdir(current_dir)  
    
# 加载 JSON 文件  
with open("Web2Code_sharegpt_format.json", "r", encoding='utf-8') as f:  
    data = json.load(f)  
  
# 创建一个新的列表来存储仅包含 messages 的数据  
messages_data = []  
  
# 处理每个 item 中的 messages  
for item in data:  
    new_messages = []  
    for message in item['messages']:  
        if '<image>' in message['content']:  
            # 提取图片路径  
            image_path = item['images'][0] if item['images'] else "default_image_path.png"  
              
            # 新的内容结构  
            new_content = [  
                {  
                    "type": "image",  
                    "image": image_path,  
                },  
                {  
                    "type": "text",  
                    "text": message['content'].replace('<image>', '').strip()  
                }  
            ]  
              
            # 添加到新的消息列表  
            new_messages.append({  
                "role": message['role'],  
                "content": new_content  
            })  
        else:  
            # 如果没有 <image> 标签，则直接添加内容  
            new_messages.append(message)  
      
    # 将处理后的消息添加到 messages_only 列表中  
    messages_data.append(new_messages)  
   
print("Processing completed, messages only retained.")  

import math
import torch
from tqdm import tqdm  # 新增：进度条
from transformers import AutoProcessor
from qwen_vl_utils import process_vision_info
from concurrent.futures import ThreadPoolExecutor, as_completed

model_path = "/mnt/lingjiejiang/textual_aesthetics/model_checkpoint/vlm_checkpoints/Qwen2-VL-7B-Instruct"
processor = AutoProcessor.from_pretrained(model_path)

def process_batch(batch):
    """
    batch 的结构形如：
    [
      (original_index_1, messages_1),
      (original_index_2, messages_2),
      ...
    ]
    """
    # 1) 拆分出索引列表和真正的 messages 列表
    indices = [x[0] for x in batch]
    messages_list = [x[1] for x in batch]

    # 2) 处理文本
    texts = []
    for messages in messages_list:
        text = processor.apply_chat_template(
            messages, tokenize=False, add_generation_prompt=True
        )
        texts.append(text)

    # 3) 处理视觉信息
    image_inputs, video_inputs = process_vision_info(messages_list)

    # 4) 批量传入 processor
    inputs = processor(
        text=texts,
        images=image_inputs,
        videos=video_inputs,
        padding=True,
        return_tensors="pt",
    )

    # 5) 根据 attention_mask 计算真实 token 长度（去除 padding）
    attention_mask = inputs["attention_mask"]  # shape: (batch_size, seq_len)
    lengths = attention_mask.sum(dim=1).tolist()  # 每条消息的实际 token 数

    # 6) 返回 (original_index, length) 列表
    return list(zip(indices, lengths))

def batchify(data, batch_size=32):
    """
    data 应该是一个含有 (original_index, messages) 的列表
    """
    num_batches = math.ceil(len(data) / batch_size)
    for i in range(num_batches):
        yield data[i * batch_size : (i + 1) * batch_size]

# -------------------------------
#          主流程
# -------------------------------
# 假设你已有一个列表 messages_data，其中每个元素是一条消息/对话等
indexed_data = list(enumerate(messages_data))  
# 例如：messages_data = [m0, m1, m2, ...]
#       indexed_data = [(0, m0), (1, m1), (2, m2), ...]

batch_size = 32
batched_data = list(batchify(indexed_data, batch_size=batch_size))

# 用于存放最终长度结果，顺序与 messages_data 相同
results = [None] * len(messages_data)

num_threads = 16
# 创建线程池，并行处理
with ThreadPoolExecutor(max_workers=num_threads) as executor:
    # 提交所有 batch 的任务
    futures = {executor.submit(process_batch, batch): batch for batch in batched_data}

    # 使用 tqdm 监控所有 Future 的完成情况
    for future in tqdm(as_completed(futures), total=len(futures), desc="Processing Batches"):
        # 每个 future 返回的是本批次的 (original_index, length) 列表
        batch_result = future.result()
        for idx, length in batch_result:
            results[idx] = length

# 写入文件并进行统计
output_file = "message_lengths.txt"
with open(output_file, "w") as f:
    for length in results:
        f.write(f"{length}\n")

max_length = max(results)
min_length = min(results)
average_length = sum(results) / len(results)

print(f"Max length: {max_length}")
print(f"Min length: {min_length}")
print(f"Average length: {average_length:.2f}")
