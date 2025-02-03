import os
import base64
import csv
from concurrent.futures import ThreadPoolExecutor, as_completed

def process_line_task(global_index, image_url, b64_str, save_dir):
    """
    多线程任务：处理单行数据
      - global_index: 该行在整个数据集中的全局索引(决定图片命名)
      - image_url:    当前行的 URL
      - b64_str:      Base64 字符串(可能为 "None" 或有效值)
      - save_dir:     图片存储路径

    返回一个 dict，包含处理结果，用于后续写CSV:
      {
        "global_index": global_index,
        "status": "valid" | "none" | "error",
        "image_url": image_url,
        "image_filename": "xxx.png" or None,
        "raw_line": None或原始行(若需要存)
      }
    """
    if b64_str == "None":
        # 不解码
        return {
            "global_index": global_index,
            "status": "none",
            "image_url": image_url,
            "image_filename": f"{global_index}.png"
        }
    else:
        # 尝试Base64解码
        try:
            img_data = base64.b64decode(b64_str)
            image_filename = f"{global_index}.png"
            # 保存图片
            with open(os.path.join(save_dir, image_filename), 'wb') as f:
                f.write(img_data)
            return {
                "global_index": global_index,
                "status": "valid",
                "image_url": image_url,
                "image_filename": image_filename
            }
        except Exception as e:
            return {
                "global_index": global_index,
                "status": "error",
                "image_url": image_url,
                "image_filename": f"{global_index}.png"
            }

def main():
    # 将你的实际文件夹路径改到这里
    data_dir = 'data_process/stack_over_flow/stack/filtered_v1.img'
    save_dir = 'data_process/stack_over_flow/save_images'
    os.makedirs(save_dir, exist_ok=True)

    # 输出 CSV
    csv_valid       = 'mapping_valid.csv'
    csv_none        = 'mapping_none.csv'
    csv_error       = 'mapping_error.csv'
    csv_bad_format  = 'mapping_bad_format.csv'

    # 用字典来保存所有处理结果，key = global_index
    results = {}

    max_workers = 8  # 根据实际CPU核/IO情况调整
    global_index = 0

    future_to_index = {}

    # 只遍历一次，边读边提交任务
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        # 外层：遍历 0.txt ~ 499.txt
        for i in range(500):
            file_path = os.path.join(data_dir, f"{i}.txt")
            if not os.path.isfile(file_path):
                continue

            with open(file_path, 'r', encoding='utf-8') as f:
                for line in f:
                    line_stripped = line.strip()
                    columns = line_stripped.split('\t')

                    # 列数不对
                    if len(columns) != 2:
                        results[global_index] = {
                            "global_index": global_index,
                            "status": "bad_format",
                            "image_url": None,
                            "image_filename": None,
                            "raw_line": line_stripped
                        }
                        global_index += 1

                        # 每隔10000行打印一次
                        if global_index % 100000 == 0:
                            print(f"[Info] 已处理 {global_index} 行(含坏行) ...")
                        continue

                    # 正常列，提交多线程处理
                    image_url, b64_str = columns
                    future = executor.submit(
                        process_line_task, 
                        global_index,
                        image_url,
                        b64_str,
                        save_dir
                    )
                    future_to_index[future] = global_index
                    global_index += 1

                    # 每隔10000行打印一次
                    if global_index % 100000 == 0:
                        print(f"[Info] 已处理 {global_index} 行 ...")
        
        # 所有行都提交后，收集线程结果
        print("[Info] 正在等待所有线程完成解码写图 ...")
        for future in as_completed(future_to_index):
            idx = future_to_index[future]
            try:
                ret = future.result()
                results[idx] = ret
            except Exception as e:
                # 若真有异常就标记
                results[idx] = {
                    "global_index": idx,
                    "status": "error",
                    "image_url": None,
                    "image_filename": None
                }

    # 处理全部完成
    print(f"[Info] 全部处理完成，共 {global_index} 行数据。")

    # 将结果分类写出CSV
    valid_list = []
    none_list  = []
    error_list = []
    bad_list   = []

    for idx in range(global_index):
        item = results[idx]
        st = item["status"]
        if st == "valid":
            valid_list.append((item["image_url"], item["image_filename"]))
        elif st == "none":
            none_list.append((item["image_url"], item["image_filename"]))
        elif st == "error":
            error_list.append((item["image_url"], item["image_filename"]))
        elif st == "bad_format":
            bad_list.append([item["raw_line"]])
        else:
            pass

    # 写出 CSV
    with open(csv_valid, 'w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(["image_url", "image_filename"])
        w.writerows(valid_list)

    with open(csv_none, 'w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(["image_url", "image_filename"])
        w.writerows(none_list)

    with open(csv_error, 'w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(["image_url", "image_filename"])
        w.writerows(error_list)

    with open(csv_bad_format, 'w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(["raw_line"])
        w.writerows(bad_list)

    print("[Info] CSV 写出完成。")
    print(f"  valid: {len(valid_list)}")
    print(f"  none:  {len(none_list)}")
    print(f"  error: {len(error_list)}")
    print(f"  bad_format: {len(bad_list)}")
    print(f"图片目录: {save_dir}")

if __name__ == "__main__":
    main()
