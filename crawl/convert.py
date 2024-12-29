import os  
from PIL import Image  
from concurrent.futures import ThreadPoolExecutor  
from tqdm import tqdm  
  
def convert_and_save(jpg_path, png_path):  
    try:  
        with Image.open(jpg_path) as img:  
            img.save(png_path, 'PNG')  
    except Exception as e:  
        print(f"Error processing {jpg_path}: {e}")   
  
def process_directory(source_directory, target_directory):  
    # Create the target directory if it doesn't exist  
    os.makedirs(target_directory, exist_ok=True)  
      
    jpg_files = [f for f in os.listdir(source_directory) if f.endswith('.jpg')]  
    total_files = len(jpg_files)  
    print_interval = 100  # 每5万次打印一次  
      
    with ThreadPoolExecutor() as executor:  
        # Create a list of tasks  
        tasks = [  
            executor.submit(  
                convert_and_save,  
                os.path.join(source_directory, filename),  
                os.path.join(target_directory, filename[:-4] + '.png')  
            )  
            for filename in jpg_files  
        ]  
          
        # Use tqdm to show progress  
        completed = 0  
        for task in tqdm(tasks, desc=f"Processing {source_directory}", unit="file", total=total_files):  
            task.result()  # Wait for the task to complete  
            completed += 1  
              
            # Print every 50000 files  
            if completed % print_interval == 0:  
                print(f"{completed} files processed.")  
  
# Define the source base directory and target base directory  
source_base_dir = '/mnt/lingjiejiang/multimodal_code/data/stack_supply'  
target_base_dir = '/mnt/lingjiejiang/multimodal_code/data/supply_images'  
subfolders = ['m1', 'm2', 'm3', 'm4', 'm5', 'm6', 'm7']  
  
# Process images in each subfolder  
for subfolder in subfolders:  
    source_directory = os.path.join(source_base_dir, subfolder)  
    target_directory = os.path.join(target_base_dir, subfolder)  
    process_directory(source_directory, target_directory)  