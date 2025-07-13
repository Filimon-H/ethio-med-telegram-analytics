-- models/marts/dim_dates.sql

{{ config(materialized='table') }}

WITH date_series AS (
    SELECT
        generate_series(
            (SELECT MIN(message_date) FROM {{ ref('stg_telegram_messages') }}),
            (SELECT MAX(message_date) FROM {{ ref('stg_telegram_messages') }}),
            interval '1 day'
        )::date AS calendar_date
)

SELECT
    calendar_date,
    EXTRACT(year FROM calendar_date) AS year,
    EXTRACT(month FROM calendar_date) AS month,
    EXTRACT(day FROM calendar_date) AS day,
    TO_CHAR(calendar_date, 'Day') AS day_name,
    TO_CHAR(calendar_date, 'Month') AS month_name
FROM date_series
