{{config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

SELECT
    customerid as customer_key,
    customerid,
    firstname,
    lastname,
    dob,
    address,
    city,
    state,
    zipcode
from {{ source('insurance_landing', 'customers') }}