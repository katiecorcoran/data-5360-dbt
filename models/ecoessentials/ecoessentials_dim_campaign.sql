{{config(
    materialized = 'table',
    database = 'group2project',
    schema = 'dw_ecoessentials'
)}}

select
    campaign_id as campaign_key,
    campaign_id,
    campaign_name,
    campaign_discount
from {{ source('ecoessentials_landing', 'promotional_campaign') }}