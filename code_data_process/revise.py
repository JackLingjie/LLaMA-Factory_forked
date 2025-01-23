import json  
import os  
import re  
from concurrent.futures import ThreadPoolExecutor, as_completed  
from tqdm import tqdm  
from gpt4o import Openai, API_INFOS  

prompt_template = \
"""  
Below is the code solution to an algorithm problem. Please help me rewrite this code according to standard coding conventions. The input and output requirements of the problem are as follows:  
  
1. Please enclose your code within a ```python``` block.  
2. Do not write a main() function.  
3. The modified code should use the same output format as the original code. If the original code uses print, then the modified code should also use print. If the original code uses return, then the modified code should also use return.
4. Directly output the modified code without adding any additional content. 
  
Here is the code that needs to be revised:  
  
# Original code that needs revision  

{RAW_CODE}  
  
Please provide the revised, well-structured code according to these instructions. 
"""  
# 读取 JSON 数据  
def load_data(file_path):  
    try:  
        with open(file_path, 'r') as f:  
            return json.load(f)  
    except Exception as e:  
        print(f"Error loading data from {file_path}: {e}")  
        return []  
  
# 调用 GPT API 并解析响应  
def get_revised_text(client, raw_code, prompt_template, max_tokens=2048):  
    content = prompt_template.format(RAW_CODE=raw_code)  
    with open("code_data_process/debug.txt", 'w') as f:
        f.write(content)
    # print(content)
    try:  
        gpt_answer = client.get_response(content=content, max_tokens=max_tokens)  
    except Exception as e:  
        print(f"Error calling GPT API: {e}")  
        return ""  
  
    # 使用正则表达式提取代码块  
    match = re.search(r"```python(.*?)```", gpt_answer, re.DOTALL)  
    if match:  
        return match.group(1).strip()  
    return ""  
  
# 处理单行数据  
def process_row(index, client, row, prompt_template, max_tokens=2048):  
    raw_code = row.get('answer', '').strip()  
    revised_code = get_revised_text(client, raw_code, prompt_template, max_tokens=max_tokens)  

    with open("code_data_process/debug_revised.txt", 'w') as f:
        f.write(revised_code)
    result = {  
        'index': index,  
        'revised_code': revised_code,  
    }  
    result.update(row)  
    return result  
  
def main():  
    save_path = "/mnt/lingjiejiang/multimodal_code/data/code_contest/taco_filtered_20k.json"  
    output_dir = '/mnt/lingjiejiang/multimodal_code/data/code_contest/'  
    # output_dir = "code_data_process/revised_code_output"
    os.makedirs(output_dir, exist_ok=True)  
  
    data = load_data(save_path)  
    
    # data = data[:1]

    clients = [Openai(apis=[API_INFOS[i]]) for i in range(len(API_INFOS))]  
    print(f"len(clients): {len(clients)}")  
    max_tokens = 2048  
    batch_size = 5000  
    revised_data = []  
  
  
    with ThreadPoolExecutor(max_workers=len(clients)) as executor:  
        futures = [  
            executor.submit(  
                process_row, i, clients[i % len(clients)], row, prompt_template, max_tokens  
            ) for i, row in enumerate(data)  
        ]  
  
        for i, future in enumerate(tqdm(as_completed(futures), total=len(futures))):  
            revised_data.append(future.result())  
            if (i + 1) % batch_size == 0:  
                batch_number = (i + 1) // batch_size  
                intermediate_file = os.path.join(output_dir, f"intermediate_batch_{batch_number}.json")  
                with open(intermediate_file, 'w') as f:  
                    json.dump(revised_data, f, indent=2)  
  
    # 最后保存完整结果  
    final_file = os.path.join(output_dir, "final_output.json")  
    with open(final_file, 'w') as f:  
        json.dump(revised_data, f, indent=2)  
  
if __name__ == "__main__":  
    main()  