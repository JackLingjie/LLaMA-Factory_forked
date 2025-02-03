import json  
import random  
  
# Path to your original JSON file  
web2code_job_path = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter.json"  
  
# Paths for the output files  
output_50k_path = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter_pretrain_500k.json"  
output_rest_path = "/mnt/lingjiejiang/multimodal_code/data/Web2Code/Web2Code_sharegpt_format_abspath_filter_pretrain_rest.json"  
  
# Load the data  
with open(web2code_job_path, "r") as f:  
    web2code_job = json.load(f)  
  
# Shuffle the data to ensure randomness  
random.shuffle(web2code_job)  
  
# Split the data  
sample_size = 500000  
web2code_job_50k = web2code_job[:sample_size]  
web2code_job_rest = web2code_job[sample_size:]  
  
# Save the 50k sample  
with open(output_50k_path, "w") as f:  
    json.dump(web2code_job_50k, f, indent=0)  
  
# Save the rest  
with open(output_rest_path, "w") as f:  
    json.dump(web2code_job_rest, f, indent=0)  
  
print(f"Sample of 50k saved to {output_50k_path}")  
print(f"Rest of the data saved to {output_rest_path}")  