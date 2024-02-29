from pinecone import Pinecone
import os 
from dotenv import load_dotenv

load_dotenv()

pc = Pinecone(api_key=os.getenv("INECONE_API_KEY"))
index = pc.Index("paywithface")