{{ config( materialized='incremental') }}

with
    cte_dim_hosts as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ['host_id', 'host_name']
                )
            }} as host_key, host_id, host_name, is_superhost, created_at, updated_at, current_timestamp() as loaded_at
        from {{ ref("stg_hosts") }}
    )
   select *
   from cte_dim_hosts 

   {% if is_incremental() %}
where coalesce(updated_at, CREATED_AT) >= (select coalesce(max(loaded_at),'1900-01-01') from {{ this }} )
{% endif %}


