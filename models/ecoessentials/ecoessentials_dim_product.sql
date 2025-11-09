{{config(
    materialized = 'table',
    database = 'group2project',
    schema = 'dw_ecoessentials'
)}}

select
    product_id as product_key,
    product_id,
    product_name,
    product_type,
    price
from {{ source('ecoessentials_landing', 'product') }}