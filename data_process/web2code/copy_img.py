import json  
import os  
import shutil  
  
# 输入 JSON 文件路径  
# json_file_path = "data_process/Web2Code/sampled_data_cate.json"  
json_file_path = "data_process/Web2Code/sampled_data_cate_reimage.json"
# 图片目标目录  
img_preview_dir = "img_preview"  
  
# 确保目标目录存在  
os.makedirs(img_preview_dir, exist_ok=True)  
  
# 打开并加载 JSON 数据  
with open(json_file_path, 'r') as f:  
    data = json.load(f)  
  
# 遍历每个项目，复制图片到目标目录  
for item in data:  
    # 获取图片路径列表  
    image_paths = item.get('images', [])  
      
    for image_path in image_paths:  
        # 确保图片文件存在  
        if os.path.isfile(image_path):  
            # 复制图片到目标目录  
            shutil.copy(image_path, img_preview_dir)  
            print(f"Copied {image_path} to {img_preview_dir}")  
        else:  
            print(f"Image not found: {image_path}")  
  
print("Image copying completed.")  