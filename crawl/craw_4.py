import os  
import json  
import requests  
from concurrent.futures import ThreadPoolExecutor, as_completed  
from tqdm import tqdm  
import random  
import time  
from fake_useragent import UserAgent  
import re  
  
# 直接在代码中指定机器ID  
MACHINE_ID = 4  # 修改此处以设置不同机器的ID  
  
def load_image_urls(file_path):  
    with open(file_path, 'r') as file:  
        return json.load(file)  
  
def load_existing_images(output_folder):  
    """加载已经存在的图片文件名并还原其索引"""  
    existing_images = {}  
    pattern = re.compile(rf"machine_{MACHINE_ID}_image_(\d+)\.jpg")  
    for file_name in os.listdir(output_folder):  
        match = pattern.match(file_name)  
        if match:  
            index = int(match.group(1))  
            existing_images[index] = file_name  
    return existing_images  
  
def load_existing_mapping(mapping_file, image_urls, existing_images):  
    """尝试加载已有的 URL 到文件名的映射，利用现有的图片文件名还原"""  
    if os.path.exists(mapping_file):  
        with open(mapping_file, 'r') as file:  
            return json.load(file)  
      
    # 如果映射文件不存在，通过现有图片文件名还原  
    url_to_filename = {}  
    for index, file_name in existing_images.items():  
        if index < len(image_urls):  
            url_to_filename[image_urls[index]] = file_name  
    return url_to_filename  
  
def download_image(url, index, output_folder, url_to_filename, existing_images):  
    file_name = f"machine_{MACHINE_ID}_image_{index}.jpg"  
    file_path = os.path.join(output_folder, file_name)  
  
    # 检查文件是否已存在  
    if index in existing_images:  
        # 如果文件已经存在，返回信息并更新映射  
        url_to_filename[url] = file_name  
        return f"Skipped (already exists): {file_name}"  
  
    ua = UserAgent()  
    headers = {'User-Agent': ua.random}  
  
    # 尝试最多5次下载  
    for attempt in range(10):  
        try:  
            response = requests.get(url, headers=headers, timeout=10)  
            response.raise_for_status()  
  
            with open(file_path, 'wb') as file:  
                file.write(response.content)  
  
            # 更新全局的 URL 到文件名的映射  
            url_to_filename[url] = file_name  
            return f"Downloaded: {file_name}"  
  
        except requests.RequestException as e:  
            print(f"Attempt {attempt+1} failed for {url}: {e}")  
            delay = random.uniform(0.1, 1)  # 增加等待时间，避免过于频繁请求  
            time.sleep(delay)  
  
    return f"Failed to download after 5 attempts: {url}"  
  
def save_url_to_filename_mapping(mapping, mapping_file):  
    """保存 URL 到文件名的映射"""  
    os.makedirs(os.path.dirname(mapping_file), exist_ok=True)  # 确保文件夹存在  
    with open(mapping_file, 'w') as file:  
        json.dump(mapping, file)  
  
def main():  
    output_folder = f'/mnt/lingjiejiang/multimodal_code/data/stack_supply/m{MACHINE_ID}'  
    os.makedirs(output_folder, exist_ok=True)  
  
    json_file_path = f'crawl/unmapped_urls_part_{MACHINE_ID}.json'  
    image_urls = load_image_urls(json_file_path)  
  
    # 预加载已存在的图片并还原索引  
    existing_images = load_existing_images(output_folder)  
  
    # 设置映射文件路径  
    mapping_file = f'/mnt/lingjiejiang/multimodal_code/data/stack_supply/url_to_filename/url_to_filename_machine_{MACHINE_ID}_rerun.json'  
  
    # 加载已有的 URL 到文件名的映射  
    url_to_filename = load_existing_mapping(mapping_file, image_urls, existing_images)  
  
    with ThreadPoolExecutor(max_workers=20) as executor:  
        futures = {executor.submit(download_image, url, index, output_folder, url_to_filename, existing_images): url for index, url in enumerate(image_urls)}  
  
        for future in tqdm(as_completed(futures), total=len(image_urls)):  
            result = future.result()  
            if result.startswith("Failed"):  
                print(result)  
            else:  
                print(result)  
  
    # 在所有下载完成后，保存更新后的 URL 到文件名的映射  
    save_url_to_filename_mapping(url_to_filename, mapping_file)  
  
if __name__ == '__main__':  
    main()  