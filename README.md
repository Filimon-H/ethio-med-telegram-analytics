
# 🌐 Ethio-Med Telegram Analytics

A fully containerized ELT data pipeline that scrapes Telegram messages from Ethiopian health-related channels, loads them into PostgreSQL, transforms the raw data into a star schema using dbt, and prepares it for downstream media enrichment and analytics.

---

## ✨ Features

* ✈ Automated data scraping with Telethon
* 📂 PostgreSQL for raw and transformed data storage
* 🌐 dbt for transformation and star schema modeling
* 🏃 Dockerized for reproducibility and ease of setup
* 🔍 Supports YOLOv8 image enrichment (future step)

---

## 🔧 Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/yourusername/ethio-med-telegram-analytics.git
cd ethio-med-telegram-analytics
```

### 2. Define Environment Variables

Create a `.env` file in the root directory:

```ini
PGUSER=
PGPASSWORD=
PGDATABASE=
PGHOST=
PGPORT=
```

> ⚠️ `.env` is in `.gitignore`. Copy the template `.env.example` if needed.

### 3. Build and Start Containers

```bash
docker-compose up --build
```

This sets up:

* `telegram_db`: PostgreSQL container
* `telegram_app`: Python + dbt container (idle for script execution)

---

## 🚀 Data Scraping (Task 1)

1. Activate virtual environment (for local testing):

```bash
python -m venv .venv
source .venv/bin/activate  # or .venv\Scripts\activate on Windows
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Run scraper:

```bash
python scripts/scrape_telegram.py
```

This saves raw messages as JSON to:

```plaintext
data/raw/telegram_messages/YYYY-MM-DD/*.json
```

4. Load into PostgreSQL:

```bash
python scripts/load_raw_to_postgres.py
```

This loads messages into the `raw.telegram_messages` table.

---

## 📊 DBT Transformation (Task 2)

### 1. Initialize and Configure dbt (already done)

Check `telegram_dbt_project` for DBT project files.

### 2. Run Transformations

From the Docker container:

```bash
docker exec -w /app/telegram_dbt_project -it telegram_app dbt build
```

This builds:

* `stg_telegram_messages` (view)
* `dim_channels`, `dim_dates`, `fct_messages` (tables)

### 3. Run Custom Tests

```bash
dbt test
```

Includes:

* Built-in tests (`not_null`, `unique`)
* Custom test: `test_message_has_text_or_media.sql`

### 4. View Documentation

```bash
dbt docs generate
```

Then serve locally:

```bash
dbt docs serve
```

---

## 📚 Project Structure

```bash
ethio-med-telegram-analytics/
├── data/
│   └── raw/telegram_messages/YYYY-MM-DD/*.json
├── scripts/
│   ├── scrape_telegram.py
│   └── load_raw_to_postgres.py
├── telegram_dbt_project/
│   ├── models/staging/
│   ├── models/marts/
│   └── dbt_project.yml
├── docker-compose.yml
├── Dockerfile
├── requirements.txt
├── .env
└── README.md
```

---

## 🚀 Next Steps

* 🚀 Task 3: Use YOLOv8 to enrich images with object detection
* ⚙️ Task 4: Build a FastAPI service to query enriched data
* ⏳ Task 5: Orchestrate with Dagster for full automation

---


