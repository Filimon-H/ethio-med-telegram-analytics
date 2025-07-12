-- models/marts/fct_messages.sql

{{ config(materialized='table') }}

SELECT
    raw_id,
    channel_name,
    message_id,
    message_date,
    LENGTH(message_text) AS message_length,
    media_type,
    price,
    location,
    contact
FROM {{ ref('stg_telegram_messages') }}
