with cte_review as (
    select listing_id, date, reviewer_name, comments, sentiment
    from airbnb.raw.raw_reviews

)

select *
from cte_review