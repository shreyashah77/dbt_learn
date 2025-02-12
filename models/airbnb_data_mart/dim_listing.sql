{{ config(materialized="table") }}

with
    cte_dim_listing as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        'listing_id',
                        'listing_name',
                        'listing_url',
                        'room_type',
                        'minimum_nights',
                        'host_id',
                        'price',
                        "created_at",
                        "updated_at"
                    ]
                )
            }} as listing_key,
            listing_id,
            listing_name,
            listing_url,
            room_type,
            minimum_nights,
            host_id,
            price,
            created_at,
            updated_at
        from {{ref ('stg_listings')}}
    )

   select *
   from cte_dim_listing 
