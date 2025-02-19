{{config(materialized = 'table') }}

with cte_curated_listing as (
    select  id as listing_id,
            name as listing_name,
            listing_url,
            room_type,
            minimum_nights,
            host_id,
            price,
            created_at,
            updated_at
    from 
        {{ref ('src_listing')}}
)

select *
from cte_curated_listing