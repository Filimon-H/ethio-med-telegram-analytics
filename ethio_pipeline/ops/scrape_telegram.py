from dagster import op
import subprocess

@op
#def scrape_telegram_data():
 #   subprocess.run(["python", "../../scripts/telegram_scraper.py"], check=True)

#import subprocess

def scrape_telegram_data():
    try:
        result = subprocess.run(
            ["python", "../../scripts/telegram_scraper.py"],
            check=True,
            capture_output=True,
            text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Error running telegram_scraper.py:")
        print(e.stderr)
        raise
