-- models/marts/dim_channels.sql

{{ config(materialized='table') }}

SELECT
    DISTINCT channel_name
FROM {{ ref('stg_telegram_messages') }}
WHERE channel_name IS NOT NULL
