from pinecone import Pinecone as PineconeClient
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

class Pinecone:
    _instance = None
    # Singleton pattern to ensure only one instance of Pinecone client and index
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Pinecone, cls).__new__(cls)
            # Initialize Pinecone client and index
            api_key = os.getenv("PINECONE_API_KEY")
            if not api_key:
                raise ValueError("Pinecone API key is not set in environment variables")
            cls._instance.client = PineconeClient(api_key=api_key)
            index_name = 'paywithface'
            cls._instance.index = cls._instance.client.Index(index_name)
        return cls._instance

    def upsert(self, vectors, namespace='default-namespace'):
        """
        Upserts a list of vectors to the Pinecone index.
        Each vector in the list should be a dictionary with 'id', 'values', and optionally 'metadata'.
        """
        return self.index.upsert(vectors=vectors, namespace=namespace)
    
    def query(self, query_vector, top_k=1, namespace='default-namespace'):
        """
        Queries the Pinecone index with a vector and returns the top k results.
        """
        return self.index.query(queries=[query_vector], top_k=top_k, namespace=namespace)
