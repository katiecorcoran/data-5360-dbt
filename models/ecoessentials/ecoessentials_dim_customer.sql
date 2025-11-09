{{config(
    materialized = 'table',
    database = 'group2project',
    schema = 'dw_ecoessentials'
)}}

select
    customer_id as customer_key,
    customer_id,
    customer_first_name as first_name,
    customer_last_name as last_name,
    customer_phone as phone,
    customer_address as address,
    customer_city as city,
    customer_state as state,
    customer_zip as zip,
    customer_country as country
from {{ source('ecoessentials_landing', 'customer') }}