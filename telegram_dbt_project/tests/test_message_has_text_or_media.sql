-- tests/test_message_has_text_or_media.sql

SELECT *
FROM {{ ref('fct_messages') }}
WHERE message_text IS NULL AND media_type IS NULL
