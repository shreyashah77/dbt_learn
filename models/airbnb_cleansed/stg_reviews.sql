{{config(materialized = 'table') }}

with
    cte_curated_reviews as (
        select
            listing_id,
            date as review_date,
            case
                when reviewer_name is null then 'anonymous' else reviewer_name
            end as reviewer_name,
            comments as review_text,
            sentiment as review_sentiment
        from {{ ref("src_review") }}

    )

    select *
    from cte_curated_reviews
