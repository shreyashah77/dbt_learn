with cte_hosts as  (
    select id, name,is_superhost,created_at, updated_at
    from airbnb.raw.raw_hosts

)

select *
from cte_hosts