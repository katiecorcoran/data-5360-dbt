{{config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    e.employee_key,
    d.date_key,
    ec.certification_name,
    ec.certification_cost
from {{ ref('stg_employee_certifications') }} ec
inner join {{ ref('oliver_dim_employee') }} e
    on ec.employee_id = e.employee_id
inner join {{ ref('oliver_dim_date') }} d
    on d.date_key = ec.certification_date