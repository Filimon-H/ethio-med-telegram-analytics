from dagster import ScheduleDefinition
from ethio_pipeline.jobs.etl_job import etl_pipeline_job

daily_etl_schedule = ScheduleDefinition(
    job=etl_pipeline_job,
    cron_schedule="0 3 * * *",  # Every day at 3 AM
    name="daily_etl_schedule"
)
