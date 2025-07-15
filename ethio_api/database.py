from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os

# Load .env file
load_dotenv()

# Read from environment
DATABASE_URL = os.getenv("DATABASE_URL")
print("📦 Loaded DB URL:", DATABASE_URL)

# Create engine
engine = create_engine(DATABASE_URL)

# ✅ THIS must be defined with the exact name:
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
