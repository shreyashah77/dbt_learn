{{ config(materialized="table") }}

with
    cte_dim_hosts as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ['host_id', 'host_name']
                )
            }} as host_key, host_id, host_name, is_superhost, created_at, updated_at
        from {{ ref("stg_hosts") }}
    )
   select *
   from cte_dim_hosts 
