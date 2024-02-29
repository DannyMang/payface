import requests, os
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
from PIL import Image

load_dotenv()

save_dir = 'faces'

model = SentenceTransformer('clip-ViT-B-32') 

def encode():
	for image in os.listdir(save_dir):
		valid_extensions = ('.png', '.jpg', '.jpeg')
		if not image.lower().endswith(valid_extensions):
			continue
			
		img_path = f"{save_dir}/{image}"
		img = Image.open(img_path)
		embedding = model.encode([img])  
		embedding_str = ",".join([str(x) for x in embedding[0]]) 

		print(embedding_str)

encode()