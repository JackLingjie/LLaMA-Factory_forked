import os  
from PIL import Image  
  
def convert_jpg_to_png(jpg_path, png_path):  
    try:  
        with Image.open(jpg_path) as img:  
            # 检查图像模式，如果是 CMYK，转换为 RGB  
            if img.mode == 'CMYK':  
                img = img.convert('RGB')  
            img.save(png_path, 'PNG')  
        return True  
    except Exception as e:  
        print(f"Error processing {jpg_path}: {e}")  
        return False 
  
def retry_errors(error_file_path, target_base_dir):  
    # 读取错误文件列表  
    with open(error_file_path, 'r') as f:  
        error_files = f.read().splitlines()  
  
    retried_errors = []  
  
    for error_file in error_files:  
        # 去掉文件路径中的换行符  
        error_file = error_file.strip()  
        # 生成目标路径  
        subfolder = os.path.basename(os.path.dirname(error_file))  
        target_directory = os.path.join(target_base_dir, subfolder)  
        os.makedirs(target_directory, exist_ok=True)  
        png_path = os.path.join(target_directory, os.path.basename(error_file)[:-4] + '.png')  
  
        # 尝试转换  
        if not convert_jpg_to_png(error_file, png_path):  
            retried_errors.append(error_file)  
  
    # 记录仍然无法处理的文件  
    if retried_errors:  
        with open('retried_error_files.txt', 'w') as f:  
            for error_file in retried_errors:  
                f.write(f"{error_file}\n")  
        print("Some files could not be processed. See retried_error_files.txt for details.")  
    else:  
        print("All previously failed files were successfully processed.")  
  
# 调用函数重试错误文件  
error_file_path = '/mnt/lingjiejiang/multimodal_code/data/stack_supply/url_to_filename/error_files.txt'  
target_base_dir = '/mnt/lingjiejiang/multimodal_code/data/supply_images'  
retry_errors(error_file_path, target_base_dir)  