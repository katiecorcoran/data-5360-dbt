{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

select
    p.policy_key,
    cu.customer_key,
    a.agent_key,
    d.date_key,
    c.claimamount
from {{ source('insurance_landing', 'claims') }} as c
inner join {{ source('insurance_landing', 'policies') }} as pd
    on pd.policyid = c.policyid
inner join {{ ref('dim_policy') }} as p
    on pd.policyid = p.policyid
inner join {{ ref('dim_customer') }} as cu 
    on pd.customerid = cu.customerid
inner join {{ ref('dim_agent') }} as a 
    on pd.agentid = a.agentid
inner join {{ ref('dim_date') }} as d 
    on c.claimdate = d.date_day