{{ config(materialized='view', schema='analytics') }}

with source as (
    select
        id as raw_id,
        channel_name,
        message_json
    from raw.telegram_messages
),

parsed as (
    select
        raw_id,
        channel_name,
        (message_json ->> 'id')::int as message_id,
        (message_json ->> 'date')::timestamp as message_date,
        (message_json ->> 'message') as message_text,
        (message_json ->> 'media_type') as media_type,
        (message_json ->> 'price')::numeric as price,
        (message_json ->> 'location') as location,
        (message_json ->> 'contact') as contact
    from source
)

select * from parsed
