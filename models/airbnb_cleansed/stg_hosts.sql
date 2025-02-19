{{ config(materialized ='table')}}
with cte_curated_hosts as (

    select id as host_id, name as host_name,is_superhost,created_at,updated_at
    from {{ ref('src_hosts') }}
)

select *
from cte_curated_hosts