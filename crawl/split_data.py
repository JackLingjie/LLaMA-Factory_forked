import json  
import os  
  
# 读取完整的URL列表  
def load_image_urls(file_path):  
    with open(file_path, 'r') as file:  
        return json.load(file)  
  
# 将URL列表分成n份，并打印每份的索引范围  
def split_urls(image_urls, n=7):  
    chunk_size = len(image_urls) // n  
    url_chunks = []  
      
    for i in range(n):  
        start_index = i * chunk_size  
        # 确保最后一个chunk包含所有剩余元素  
        if i == n - 1:  
            end_index = len(image_urls)  
        else:  
            end_index = (i + 1) * chunk_size  
          
        # 打印索引范围  
        print(f"Chunk {i + 1}: {start_index} to {end_index - 1}")  
          
        # 添加当前chunk到列表  
        url_chunks.append(image_urls[start_index:end_index])  
      
    return url_chunks  
  
# 保存分割后的URL列表到不同的文件  
def save_split_urls(url_chunks):  
    for i, chunk in enumerate(url_chunks):  
        with open(f'crawl/unmapped_urls_part_{i + 1}.json', 'w') as file:  
            json.dump(chunk, file, indent=4)  
  
def main():  
    # 加载完整的URL列表  
    full_json_file_path = 'data_process/stack_over_flow/unmapped_urls.json'  
    image_urls = load_image_urls(full_json_file_path)  
  
    # 将URL列表分割成5份  
    url_chunks = split_urls(image_urls, n=7)  
  
    # 保存每一份到单独的文件  
    save_split_urls(url_chunks)  
  
if __name__ == '__main__':  
    main()  