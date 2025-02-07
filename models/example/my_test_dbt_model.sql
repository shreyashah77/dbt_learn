{{ config(materialized ='table')}}

with test as (

    select 1 as id, 'shreya' as name
    union all
    select 2 as id, 'Athrav' as name
    )

select *
from test