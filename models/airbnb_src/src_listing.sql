with
    cte_listing as (

        select
            id,
            listing_url,
            name,
            room_type,
            minimum_nights,
            host_id,
            price,
            created_at,
            updated_at
        from {{ source('airbnb', 'LISTINGS') }}

    )

select *
from cte_listing
