with cte_doctor as (

    select *
    from dbt_raw_data.pharma.doctor

)

select SSN,
    NAME,
    case 
        when speciality ='General Phy'then 'General Physician'
        else speciality
    end as speciality,
    year_experience  
from cte_doctor