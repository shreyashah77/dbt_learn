with cte_review as (
    select listing_id, date, reviewer_name, comments, sentiment
   from {{ source('airbnb', 'REVIEWS') }}

)

select *
from cte_review