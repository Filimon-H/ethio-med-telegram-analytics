# ETHIO-MED-TELEGRAM-ANALYTICS

A containerized, end-to-end data pipeline and analytics solution designed to ingest, store, transform, and prepare Telegram data (messages and media) for downstream Natural Language Processing (NER) and image-based object detection (YOLOv8) tasks.

---

## 🧠 Project Overview

This project scrapes Amharic Telegram messages from Ethiopian health-related channels and builds a scalable **ELT (Extract, Load, Transform)** pipeline using Docker, PostgreSQL, and **dbt**. It prepares clean, structured data for downstream machine learning tasks including:

- Named Entity Recognition (NER)
- YOLOv8-based image object detection

---

## 🗂️ Project Structure

```
├── data/                      # Telegram JSON and media files
│   ├── raw/                  # Raw Telegram message files
│   └── preprocessed/        # Cleaned data (JSON/CSV)
├── telegram_dbt_project/     # dbt models and configurations
├── scripts/                  # Python scripts for data loading
├── notebooks/                # EDA and analysis notebooks
├── .env                      # Environment variables (excluded from Git)
├── docker-compose.yml        # Multi-container Docker setup
├── requirements.txt          # Python dependencies
└── README.md                 # Project overview and usage
```

---

## ⚙️ Technologies Used

- Python 3.10
- PostgreSQL 14
- Docker & Docker Compose
- **dbt (Data Build Tool)**
- pgAdmin 4
- Telethon (Telegram scraping)
- YOLOv8 (image classification — upcoming)

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/ETHIO-MED-TELEGRAM-ANALYTICS.git
cd ETHIO-MED-TELEGRAM-ANALYTICS
```

### 2. Configure Environment Variables

```bash
cp .env.example .env
# Edit the .env file to match your local DB credentials
```

### 3. Start Docker Containers

```bash
docker compose up --build
```

### 4. Scrape Telegram Data (Example)

```bash
python scripts/scrape_telegram.py --channel @cheMed123 --limit 1000
```

### 5. Load Raw Data into PostgreSQL

```bash
python scripts/load_raw_json.py --input data/raw/telegram_messages/YYYY-MM-DD/
```

---

## 🔄 dbt Implementation Overview

This project includes a fully functional **dbt transformation layer**, configured and run inside Docker to convert raw Telegram data into a structured, analytics-ready star schema.

### ✅ dbt Features Implemented

- **Initialized** with `dbt init telegram_dbt_project`
- **Profile** connected to Docker-based PostgreSQL
- **Staging models**: `stg_telegram_messages` (cleaned raw data)
- **Mart models**:
  - `dim_channels`: unique channels
  - `dim_dates`: calendar dates
  - `fct_messages`: message-level metrics
- **Materialization strategy**:
  - Views for staging models
  - Tables for marts
- **Generic tests**: `not_null`, `unique`
- **Custom test**: `test_message_has_text_or_media.sql`
- **Documentation**: `dbt docs generate && dbt docs serve`

📌 Run dbt inside Docker:

```bash
docker exec -w /app/telegram_dbt_project -it telegram_app dbt build
```

📌 Launch dbt Docs:

```bash
docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs generate
docker exec -w /app/telegram_dbt_project -it telegram_app dbt docs serve
```

---

## ✅ Completed Tasks

- [x] Dockerized PostgreSQL + pgAdmin + Python app
- [x] Telegram message scraping via Telethon
- [x] Raw JSON loader to PostgreSQL (`raw.telegram_messages`)
- [x] dbt transformations:
  - `stg_telegram_messages` (View)
  - `dim_channels`, `dim_dates`, `fct_messages` (Tables)
- [x] dbt tests: `unique`, `not_null`, custom business rule
- [x] dbt docs with DAG and model definitions

---

## 📦 Data Warehouse Design

- **Schema: raw** – Ingested raw Telegram messages
- **Schema: analytics** – Star schema:

  - `stg_telegram_messages` (View)
  - `dim_channels`, `dim_dates`, `fct_messages` (Tables)

---

## 🧪 Testing & Quality Checks

- ✅ Generic tests: `not_null`, `unique`
- ✅ Custom test: `test_message_has_text_or_media`
- ✅ Docs: auto-generated lineage with `dbt docs generate`

---

## 🧠 Engineering Decisions

- Followed **ELT** pattern: raw → staging → marts
- Used **dbt** for modular, testable SQL pipelines
- Used **views** for staging to optimize storage
- Used **tables** for marts to enable faster joins

---

## 📌 Next Steps

- [ ] Task 3: YOLOv8 Image Enrichment
- [ ] Task 4: FastAPI analytics API
- [ ] Task 5: Orchestrate with Dagster

---

## 👤 Author

**Filimon Hailemariam**  
📧 [LinkedIn](https://linkedin.com/in/filimon-hailemariam) • [GitHub](https://github.com/filimon-hailemariam)

---

## 🗒️ License

MIT License (optional)
