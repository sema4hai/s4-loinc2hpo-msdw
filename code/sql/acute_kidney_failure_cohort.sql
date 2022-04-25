create temp table cohort as 
select medical_record_number , min(calendar_date) as min_diag_date
from hai_az_prod.diagnosis_2020july dj 
where context_diagnosis_code ~* '^N17$|^N17.[01289]' and diagnosis_source in ('EPIC Primary', 'Principal')
group by medical_record_number;
