with cte_hosts as  (
    select id, name,is_superhost,created_at, updated_at
    from {{ source('airbnb', 'HOSTS') }}

)

select *
from cte_hosts