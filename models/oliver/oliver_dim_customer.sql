{{config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

SELECT
    customer_id as customer_key,
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    state
from {{ source('oliver_landing', 'customer') }}