{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    c.customer_key,
    d.date_key,
    s.store_key,
    p.product_key,
    e.employee_key,
    ol.quantity,
    ol.unit_price,
    o.total_amount as dollars_sold
from {{ source('oliver_landing', 'orders') }} as o
inner join {{ source('oliver_landing', 'orderline') }} as ol
    on o.order_id = ol.order_id
inner join {{ ref('oliver_dim_customer') }} as c
    on o.customer_id = c.customer_id
inner join {{ ref('oliver_dim_store') }} as s
    on o.store_id = s.store_id
inner join {{ ref('oliver_dim_employee') }} as e
    on o.employee_id = e.employee_id
inner join {{ ref('oliver_dim_date') }} as d 
    on o.order_date = d.date_day
inner join {{ ref('oliver_dim_product') }} p
    on ol.product_id = p.product_id