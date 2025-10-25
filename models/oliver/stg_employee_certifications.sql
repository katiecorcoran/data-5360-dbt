{{config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    employee_id,
    first_name,
    last_name,
    PARSE_JSON(certification_json):certification_name::string as certification_name,
    PARSE_JSON(certification_json):certification_cost::float as certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::datetime as certification_date,
    certification_completion_id,
    email
from {{ source('oliver_landing', 'employee_certifications') }}