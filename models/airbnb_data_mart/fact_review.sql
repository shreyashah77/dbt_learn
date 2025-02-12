{{ config(materialized="table") }}

with
    cte_fact_review as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        "listing_key",
                        "host_key",
                        "review_date",
                        "reviewer_name",
                        "review_text",
                        "review_sentiment",
                    ]
                )
            }} as review_key,

            listing_key,
            host_key,
            review_date,
            reviewer_name,
            review_text,
            review_sentiment
        from {{ ref("stg_reviews") }} as rev
        inner join {{ ref("dim_listing") }} as list on rev.listing_id = list.listing_id
        inner join {{ ref("dim_hosts") }} as host on list.host_id = host.host_id
    )
select *
from cte_fact_review
