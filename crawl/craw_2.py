import os  
import json  
import requests  
from concurrent.futures import ThreadPoolExecutor, as_completed  
from tqdm import tqdm  
import random  
import time  
from fake_useragent import UserAgent  
  
# 直接在代码中指定机器ID  
MACHINE_ID = 2  # 修改此处以设置不同机器的ID  
  
def load_image_urls(file_path):  
    with open(file_path, 'r') as file:  
        return json.load(file)  
  
def download_image(url, index, output_folder, url_to_filename):  
    try:  
        ua = UserAgent()  
        headers = {'User-Agent': ua.random}  
  
        response = requests.get(url, headers=headers, timeout=10)  
        response.raise_for_status()  
  
        file_name = f"machine_{MACHINE_ID}_image_{index}.jpg"  
        file_path = os.path.join(output_folder, file_name)  
          
        with open(file_path, 'wb') as file:  
            file.write(response.content)  
  
        # 更新全局的 URL 到文件名的映射  
        url_to_filename[url] = file_name  
        return file_name  
  
    except requests.RequestException as e:  
        delay = random.uniform(0, 0.1)  
        time.sleep(delay)  
        return f"Failed to download {url}: {e}"  
  
def save_url_to_filename_mapping(mapping):  
    # 设置映射文件存储路径  
    mapping_folder = '/mnt/lingjiejiang/multimodal_code/data/stack_supply/url_to_filename'  
    os.makedirs(mapping_folder, exist_ok=True)  # 确保文件夹存在  
  
    filename = os.path.join(mapping_folder, f'url_to_filename_machine_{MACHINE_ID}.json')  
    with open(filename, 'w') as file:  
        json.dump(mapping, file)  
  
def main():  
    output_folder = f'/mnt/lingjiejiang/multimodal_code/data/stack_supply/m{MACHINE_ID}'  
    os.makedirs(output_folder, exist_ok=True)  
  
    json_file_path = f'crawl/unmapped_urls_part_{MACHINE_ID}.json'  
    image_urls = load_image_urls(json_file_path)  
  
    # 初始化 URL 到文件名的映射  
    url_to_filename = {}  
  
    with ThreadPoolExecutor(max_workers=20) as executor:  
        futures = {executor.submit(download_image, url, index, output_folder, url_to_filename): url for index, url in enumerate(image_urls)}  
  
        for future in tqdm(as_completed(futures), total=len(image_urls)):  
            result = future.result()  
            if result.startswith("Failed"):  
                print(result)  
            else:  
                print(f"Downloaded: {result}")  
  
    save_url_to_filename_mapping(url_to_filename)  
  
if __name__ == '__main__':  
    main()  