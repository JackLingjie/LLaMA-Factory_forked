import torch
import os
from datasets import load_dataset
from transformers import AutoProcessor
from qwen_vl_utils import process_vision_info

# 设置默认模型路径
MODEL_PATH = "Qwen/Qwen2.5-VL-3B-Instruct"

# 加载 Processor
processor = AutoProcessor.from_pretrained(MODEL_PATH)


def convert_to_messages(item):
    """将 Web2Code 数据转换为 Qwen2.5-VL 的 messages 格式"""
    messages = []
    user_content = []

    # 确保 item 包含 messages 字段
    if not isinstance(item, dict) or "messages" not in item:
        print(f"Skipping invalid item: {item}")
        return []

    # 添加图片输入
    if "images" in item and isinstance(item["images"], list):
        user_content.extend([{"type": "image", "image": img_path} for img_path in item["images"]])

    # 处理文本输入
    for msg in item["messages"]:
        role = msg.get("role", "")
        content = msg.get("content", "")

        if role == "user":
            user_content.append({"type": "text", "text": content})
        elif role == "assistant":
            messages.append({"role": "assistant", "content": [{"type": "text", "text": content}]})

    # 只添加一次 user 输入
    if user_content:
        messages.insert(0, {"role": "user", "content": user_content})

    return messages


def tokenize_and_count(batch):
    """计算每个 batch 的 token 数量"""

    # **计算 batch_size**
    batch_size = len(batch["messages"]) if "messages" in batch else 0

    # **转换数据格式**
    messages_batch = [
        convert_to_messages({
            "messages": batch["messages"][i],
            "images": batch.get("images", [])[i] if "images" in batch else []
        })
        for i in range(batch_size)
    ]

    # 过滤掉空的 messages
    messages_batch = [m for m in messages_batch if m]
    if not messages_batch:
        return {"token_count": []}

    # 处理文本
    texts = [
        processor.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
        for messages in messages_batch
    ]

    # 处理视觉信息
    image_inputs, video_inputs = process_vision_info(messages_batch)

    # **必须使用 padding=True**
    inputs = processor(
        text=texts,
        images=image_inputs,
        videos=video_inputs,
        padding=True,  # **确保 batch 可以处理**
        return_tensors="pt",
    )

    # **使用 attention_mask 计算真实 token 数**
    token_counts = inputs["attention_mask"].sum(dim=1).tolist()

    return {"token_count": token_counts}


def compute_and_save_token_counts(data_path):
    """
    从 JSONL 读取数据 -> 计算 token 数量 -> 保存为 `_tokenized.jsonl`
    """
    print(f"Loading data from {data_path}...")

    # **加载数据**
    dataset = load_dataset("json", data_files=data_path, split="train")

    # **计算 token 数**
    print("Computing token counts...")
    dataset = dataset.map(tokenize_and_count, batched=True, batch_size=2000, num_proc=18)

    # **自动生成 `_tokenized.jsonl` 文件名**
    output_path = os.path.splitext(data_path)[0] + "_tokenized.jsonl"

    # **保存结果**
    dataset.to_json(output_path)
    print(f"Token counts saved to {output_path}")


# **批量处理多个数据集**
file_paths = [
    # "data_process/web2code/web2code_tokenized.jsonl"
    "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter.json"
]

for path in file_paths:
    compute_and_save_token_counts(path)
