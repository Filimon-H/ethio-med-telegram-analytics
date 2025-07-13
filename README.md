# ETHIO-MED-TELEGRAM-ANALYTICS

A containerized, end-to-end data pipeline and analytics solution designed to ingest, store, transform, and prepare Telegram data (messages and media) for downstream Natural Language Processing (NER) and image-based object detection (YOLOv8) tasks.

---

## 🧠 Overview

This project focuses on scraping Amharic Telegram messages from medical-related channels, loading them into a PostgreSQL database, transforming the data using dbt into a clean and analytics-ready star schema, and preparing it for downstream machine learning and computer vision tasks.

---

## 🗂️ Project Structure

```
├── data/                        # Raw and preprocessed data (JSON, media)
│   ├── raw/                    # Source files from Telegram
│   └── preprocessed/          # Cleaned CSV/JSON
├── dbt_project/                # DBT models and configs
├── scripts/                    # Python scripts for ETL
├── notebooks/                  # EDA and debugging notebooks
├── .env                        # Environment variables
├── docker-compose.yml          # Multi-container setup
├── requirements.txt            # Python dependencies
└── README.md                   # Project description (this file)
```

---

## ⚙️ Technologies Used

* **Python 3.10**
* **PostgreSQL 14**
* **Docker & Docker Compose**
* **DBT (Data Build Tool)**
* **pgAdmin 4**
* **Telethon** – Telegram scraping
* **YOLOv8** – Image classification (upcoming)

---

## 🚀 Setup Instructions

```bash
# 1. Clone the repository
$ git clone https://github.com/yourusername/ETHIO-MED-TELEGRAM-ANALYTICS.git
$ cd ETHIO-MED-TELEGRAM-ANALYTICS

# 2. Add environment variables
$ cp .env.example .env

# 3. Build and run containers
$ docker compose up --build

# 4. Load raw messages into PostgreSQL
$ python scripts/load_raw_json.py

# 5. Initialize and run DBT transformations
$ docker exec -w /app/telegram_dbt_project -it telegram_app dbt build

# 6. Generate DBT docs
$ docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs generate
$ docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs serve
```

---

## ✅ Features Completed

* ✅ Telegram message scraping with Telethon
* ✅ PostgreSQL + pgAdmin in Docker
* ✅ Raw data loader to PostgreSQL
* ✅ dbt staging and data mart models (star schema)
* ✅ dbt tests (not\_null, unique, custom)
* ✅ dbt documentation
* 🚧 Task 3: NER & YOLOv8 processing pipeline (ongoing)

---

## 🔍 Data Warehouse Design

* **Schema: raw** – Loaded JSON messages
* **Schema: analytics** – Star schema models

  * `stg_telegram_messages` (view)
  * `dim_channels`, `dim_dates`, `fct_messages` (tables)

---

## 🧪 Testing & Documentation

* Built-in DBT tests for primary keys and nulls
* One custom test: `test_message_has_text_or_media`
* Auto-generated documentation with `dbt docs`

---

## 👤 Author

**Filimon Hailemariam**
📧 LinkedIn | GitHub | Portfolio

---

## 🗒️ License

MIT License (optional if public)

---


