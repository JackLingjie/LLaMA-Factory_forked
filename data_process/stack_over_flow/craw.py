import os  
import json  
import requests  
from concurrent.futures import ThreadPoolExecutor, as_completed  
from urllib.parse import urlsplit  
from tqdm import tqdm  
import random  
import time  
from fake_useragent import UserAgent  
  
# 创建存储图片的文件夹  
output_folder = 'data_process/stack_over_flow/supply_images'  
os.makedirs(output_folder, exist_ok=True)  
  
# 从 JSON 文件中读取 URL 列表  
def load_image_urls(file_path):  
    with open(file_path, 'r') as file:  
        return json.load(file)  
  
# 存储 URL 和文件名的映射关系  
url_to_filename = {}  
  
def download_image(url, index):  
    try:  
        # 随机化请求头  
        ua = UserAgent()  
        headers = {'User-Agent': ua.random}  
  
        # 获取图片数据  
        response = requests.get(url, headers=headers, timeout=10)  
        response.raise_for_status()  # 检查请求是否成功  
  
        # 使用索引作为文件名  
        file_name = f"image_{index}.jpg"  
  
        # 保存图片到指定文件夹  
        file_path = os.path.join(output_folder, file_name)  
        with open(file_path, 'wb') as file:  
            file.write(response.content)  
  
        # 记录 URL 和文件名的映射  
        url_to_filename[url] = file_name  
  
        return file_name  
  
    except requests.RequestException as e:  
        # 在请求失败的情况下，随机延迟一段时间再返回错误信息  
        delay = random.uniform(0, 0.1)  
        time.sleep(delay)  
        return f"Failed to download {url}: {e}"  
  
def save_url_to_filename_mapping(mapping, filename='url_to_filename.json'):  
    # 将 URL 和文件名的映射保存到 JSON 文件中  
    with open(filename, 'w') as file:  
        json.dump(mapping, file, indent=4)  
  
def main():  
    # 加载 URL 列表  
    json_file_path = 'data_process/stack_over_flow/unmapped_urls.json'  
    image_urls = load_image_urls(json_file_path)  
  
    # 使用 ThreadPoolExecutor 进行多线程下载，并结合 tqdm 进行进度跟踪  
    with ThreadPoolExecutor(max_workers=20) as executor:  
        # 提交任务，加入索引  
        futures = {executor.submit(download_image, url, index): url for index, url in enumerate(image_urls)}  
  
        # 使用 tqdm 显示进度条  
        for future in tqdm(as_completed(futures), total=len(image_urls)):  
            result = future.result()  
            if result.startswith("Failed"):  
                print(result)  
            else:  
                print(f"Downloaded: {result}")  
  
    # 保存 URL 和文件名的映射关系  
    save_url_to_filename_mapping(url_to_filename)  
  
if __name__ == '__main__':  
    main()  