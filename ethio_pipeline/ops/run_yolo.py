from dagster import op
import subprocess

@op
def run_yolo_enrichment():
    subprocess.run(["python", "../../scripts/YOLO_V2.py"], check=True)
