{{ config(materialized='table') }}

SELECT
    raw_id,
    channel_name,
    message_id,
    message_date,
    message_text AS message,  
    LENGTH(message_text) AS message_length,
    media_type,
    price,
    location,
    contact,

    -- Extract product name from message using basic keyword match
    CASE
        WHEN message_text ILIKE '%paracetamol%' THEN 'paracetamol'
        WHEN message_text ILIKE '%amoxicillin%' THEN 'amoxicillin'
        WHEN message_text ILIKE '%ibuprofen%' THEN 'ibuprofen'
        -- Add more patterns below as needed
        ELSE 'unknown'
    END AS product_name

FROM {{ ref('stg_telegram_messages') }}
