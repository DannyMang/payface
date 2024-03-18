import requests, os
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
from PIL import Image
from pineconedb import Pinecone

load_dotenv()

pc = Pinecone()

save_dir = 'faces'

print(pc)

model = SentenceTransformer('clip-ViT-B-32') 

def encode():
	for image in os.listdir(save_dir):
		valid_extensions = ('.png', '.jpg', '.jpeg')
		if not image.lower().endswith(valid_extensions):
			continue

		img_path = os.path.join(save_dir, image)
		img = Image.open(img_path).convert('RGB')
		embedding = model.encode([img])[0]  # Get the embedding as a 1D array

		# Prepare the vector for upserting
		vector_data = {
			'id': image,  # Use the image filename as a unique ID
			'values': embedding.tolist(),  # Convert the embedding to a list
			'metadata': {'filename': image}  # Include any additional metadata
		}

		# Upsert the vector into Pinecone
		response = pc.upsert(vectors=[vector_data])
		print(f"Upserted {image}: {response}")
		
encode()
