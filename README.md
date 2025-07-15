# 🏥 ETHIO-MED-TELEGRAM-ANALYTICS

**Containerized analytics platform** for Ethiopian medical Telegram data 📦🇪🇹  
End-to-end pipeline for NLP/CV tasks: Named Entity Recognition (NER) & YOLOv8 image detection

---

## 🧠 Project Overview
Robust **ELT pipeline** ingesting Amharic Telegram messages from Ethiopian medical channels. Processes data for:
- 🧠 Amharic NER (Named Entity Recognition)
- 👁️ YOLOv8 medical object detection
- 📊 Business analytics API

---

## 🔧 Tech Stack

| Layer             | Tool                          |
|-------------------|-------------------------------|
| 🐘 **Database**   | PostgreSQL 14 + pgAdmin       |
| 🧱 **Transform**  | dbt (Data Build Tool)         |
| 📤 **Ingestion**  | Telethon + Custom Python     |
| 🔍 **API**        | FastAPI + Pydantic           |
| 🤖 **ML Models**  | YOLOv8, HuggingFace Transformers |
| ⚙️ **Orchestration** | Dagster                     |
| 🐳 **Infra**      | Docker + Docker Compose      |

---

## 📂 Directory Structure
├── data/ # Telegram data
│ ├── raw/ # Raw JSONs
│ └── preprocessed/ # Cleaned data
├── ethio_api/ # FastAPI app
├── ethio_pipeline/ # Dagster jobs
├── telegram_dbt_project/ # dbt models
├── scripts/ # Data scripts
├── notebooks/ # EDA/ML experiments
├── .env # Environment secrets
├── docker-compose.yml # Multi-container setup
├── requirements.txt # Dependencies
└── README.md


## 🚀 Quickstart Guide

### 1. Clone & Configure
```bash
git clone https://github.com/filimon-hailemariam/ETHIO-MED-TELEGRAM-ANALYTICS.git
cd ETHIO-MED-TELEGRAM-ANALYTICS
cp .env.example .env
📝 Edit .env with PostgreSQL and Telegram credentials

2. Launch Containers

docker compose up --build
3. Scrape Messages

python scripts/scrape_telegram.py --channel @cheMed123 --limit 1000
4. Load Raw Data

python scripts/load_raw_json.py --input data/raw/telegram_messages/YYYY-MM-DD/
5. Run dBT Transformations

docker exec -w /app/telegram_dbt_project -it telegram_app dbt build
6. Serve Documentation (Optional)

docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs generate
docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs serve
7. Start API Server

uvicorn ethio_api.main:app --reload
8. Launch Dagster UI

dagster dev -f ethio_pipeline/repository.py
🧱 Data Warehouse Design
Schema	Object	Purpose
raw	telegram_messages	Raw ingested JSON
analytics	stg_telegram_messages	Cleaned message view
analytics	dim_channels	Channel dimension
analytics	dim_dates	Date dimension
analytics	fct_messages	Message metrics fact table
✅ Data Quality: not_null, unique, custom tests
📚 Docs: Auto-generated documentation

✅ Completed Features
Ingestion

Telethon-based message scraper

Data Modeling

Raw JSON loader

dBT staging models

Star schema implementation

Image Processing

YOLOv8 media annotation

Metadata storage

Analytics API

/api/reports/top-products

/api/channels/{channel_name}/activity

/api/search/messages?query=keyword

Orchestration

Dagster pipelines with retry logic

Scheduled workflows



📜 License
MIT License