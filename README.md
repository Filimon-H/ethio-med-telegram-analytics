# ETHIO-MED-TELEGRAM-ANALYTICS 📦🇪🇹

A containerized, end-to-end data analytics platform that ingests, stores, transforms, and prepares Ethiopian medical Telegram data (messages and media) for downstream NLP and CV tasks including Named Entity Recognition (NER) and YOLOv8 image detection.

---

## 🧠 Project Overview

This project builds a robust **ELT data pipeline** using open-source tools like Docker, PostgreSQL, dbt, and Dagster. It scrapes Amharic Telegram messages from Ethiopian medical channels and processes them for use in:

- Named Entity Recognition (NER) on Amharic text
- YOLOv8-based medical object detection on images
- Business-focused analytics API powered by FastAPI

---

## 🔧 Tech Stack

| Layer             | Tool                          |
|------------------|-------------------------------|
| 🐘 Database       | PostgreSQL 14 + pgAdmin       |
| 🧱 Transformations | dbt (Data Build Tool)         |
| 📤 Ingestion      | Telethon + Custom Python      |
| 🔍 Analysis API   | FastAPI + Pydantic            |
| 🧠 CV/NLP         | YOLOv8, HuggingFace Transformers |
| ⚙️ Orchestration  | Dagster                       |
| 🐳 Infrastructure | Docker + Docker Compose       |

---

## 📁 Directory Structure

├── data/ # Telegram raw and processed data
│ ├── raw/ # Raw Telegram JSONs
│ └── preprocessed/ # Cleaned CSV/JSON
├── ethio_api/ # FastAPI application
├── ethio_pipeline/ # Dagster jobs and repository
├── telegram_dbt_project/ # dbt models and configs
├── scripts/ # Data scraping and loading scripts
├── notebooks/ # EDA and ML experiments
├── .env # Environment secrets (excluded)
├── docker-compose.yml # Multi-container setup
├── requirements.txt # Project dependencies
└── README.md # You are here



---

## 🚀 Quickstart Guide

### 1. Clone and Configure

```bash
git clone https://github.com/filimon-hailemariam/ETHIO-MED-TELEGRAM-ANALYTICS.git
cd ETHIO-MED-TELEGRAM-ANALYTICS
cp .env.example .env
📝 Edit .env with your PostgreSQL and Telegram credentials.

2. Start Dockerized Environment
bash
Copy
Edit
docker compose up --build
3. Scrape Telegram Messages
bash
Copy
Edit
python scripts/scrape_telegram.py --channel @cheMed123 --limit 1000
4. Load Raw JSON into PostgreSQL
bash
Copy
Edit
python scripts/load_raw_json.py --input data/raw/telegram_messages/YYYY-MM-DD/
5. Run dbt Transformations
bash
Copy
Edit
docker exec -w /app/telegram_dbt_project -it telegram_app dbt build
6. Serve dbt Documentation (Optional)
bash
Copy
Edit
docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs generate
docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs serve
7. Run FastAPI Server
bash
Copy
Edit
uvicorn ethio_api.main:app --reload
8. Launch Dagster UI for Orchestration
bash
Copy
Edit
dagster dev -f ethio_pipeline/repository.py
🧱 dbt Data Warehouse Design
Schema	Table/View	Purpose
raw	telegram_messages	Raw ingested JSON
analytics	stg_telegram_messages	Cleaned message view
analytics	dim_channels	Channel dimension
analytics	dim_dates	Date dimension
analytics	fct_messages	Fact table with metrics

✅ Tests: not_null, unique, custom
✅ Documentation: auto-generated via dbt docs

✅ Completed Tasks
Task 1: Ingestion
 Telethon-based Telegram message scraper

Task 2: Data Loading & Modeling
 Raw loader into PostgreSQL

 dbt project setup and staging

 Star schema: fct_messages, dim_channels, dim_dates

 dbt testing and documentation

Task 3: Image Enrichment (YOLOv8)
 YOLOv8 integration with media files

 Object annotation and metadata storage

Task 4: Analytical API (FastAPI)
 /api/reports/top-products

 /api/channels/{channel_name}/activity

 /api/search/messages?query=keyword

 Pydantic schemas for response validation

Task 5: Orchestration (Dagster)
 Dagster pipeline setup for ELT orchestration

 Schedule + retry logic

 Local dev server with dagster dev

📌 Next Steps
 Automate Telegram scraping on schedule

 Model fine-tuning for NER + YOLO

 Model-serving APIs for ML outputs

 Cloud deployment (GCP/AWS)


📜 License
MIT License 

👨‍💻 Author
Filimon Hailemariam
📍 Addis Ababa, Ethiopia
🔗 GitHub | LinkedIn

