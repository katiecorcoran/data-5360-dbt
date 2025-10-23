
{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
    c.first_name as customer_first_name,
    c.last_name as customer_last_name,
    d.date_day,
    s.store_name,
    e.first_name as employee_first_name,
    e.last_name as employee_last_name,
    p.product_name,
    f.quantity,
    f.unit_price,
    f.dollars_sold as order_total
from {{ ref('fact_sales') }} f
join {{ ref('oliver_dim_customer') }} c
    on f.customer_key = c.customer_key
join {{ ref('oliver_dim_date') }} d
    on f.date_key = d.date_key
join {{ ref('oliver_dim_store') }} s
    on f.store_key = s.store_key
join {{ ref('oliver_dim_employee') }} e
    on f.employee_key = e.employee_key
join {{ ref('oliver_dim_product') }} p
    on f.product_key = p.product_key
