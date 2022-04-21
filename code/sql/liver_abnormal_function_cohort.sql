-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

create temp table cohort as 
select medical_record_number , min(calendar_date) as min_diag_date
from hai_az_prod.diagnosis_2020july dj 
where context_diagnosis_code ~* '^R94\\.5|^794\\.8'
group by medical_record_number;