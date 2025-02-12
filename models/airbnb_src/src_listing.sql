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
        from airbnb.raw.raw_listings

    )

select *
from cte_listing
