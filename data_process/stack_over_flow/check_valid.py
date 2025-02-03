import os  
import csv  
from concurrent.futures import ThreadPoolExecutor  
from tqdm import tqdm  
  
# 定义文件路径  
csv_file_path = 'data_process/stack_over_flow/mapping_valid.csv'  
image_base_path = '/mnt/lingjiejiang/multimodal_code/data/stack_images_2/save_images'  
output_file_path = 'missing_images.csv'  
  
# 检查单个文件是否存在  
def check_image_existence(row):  
    image_url, image_filename = row  
    image_path = os.path.join(image_base_path, image_filename)  
    if not os.path.exists(image_path):  
        return (image_url, image_filename)  
    return None  
  
def main():  
    # 读取CSV文件到内存  
    with open(csv_file_path, mode='r', newline='', encoding='utf-8') as file:  
        reader = csv.reader(file)  
        # 跳过标题行，如果有的话，使用 next(reader)  
        next(reader)  # 如果CSV文件有标题行，取消注释这一行  
        data = list(reader)  
  
    missing_images = []  
  
    # 使用线程池加速文件检查  
    with ThreadPoolExecutor() as executor:  
        # 使用tqdm显示进度条  
        results = executor.map(check_image_existence, data)  
        # 收集不存在的文件信息，并显示进度  
        for result in tqdm(results, total=len(data), desc='Checking files'):  
            if result is not None: 
                print(result) 
                missing_images.append(result)  
  
    # 将结果写入输出文件  
    with open(output_file_path, mode='w', newline='', encoding='utf-8') as output_file:  
        writer = csv.writer(output_file)  
        # 写入标题行  
        writer.writerow(['image_url', 'image_filename'])  
        # 写入缺失文件信息  
        writer.writerows(missing_images)  
  
    print(f"缺失的文件信息已经写入到 {output_file_path}")  
  
if __name__ == '__main__':  
    main()  