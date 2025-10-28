{{ config(
    materialized='table',
    database='group2project',
    schema='dw_ecoessentials'
) }}

select
    c.customer_key,
    p.product_key,
    d.date_key,
    cm.campaign_key,
    ol.quantity,
    ol.discount,
    ol.price_after_discount
from {{ source('ecoessentials_landing', 'orders') }} o
inner join {{ source('ecoessentials_landing', 'order_line') }} ol 
    on o.order_id = ol.order_id
inner join {{ ref('ecoessentials_dim_customer') }} c
    on c.customer_id = o.customer_id
inner join {{ ref('ecoessentials_dim_date') }} d 
    on d.date_day = CAST(o.order_timestamp AS DATE)
inner join {{ ref('ecoessentials_dim_campaign') }} cm
    on cm.campaign_id = ol.campaign_id
inner join {{ ref('ecoessentials_dim_product') }} p
    on p.product_id = ol.product_id
