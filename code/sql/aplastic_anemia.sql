create temp table cohort as 
select medical_record_number , min(calendar_date) as min_diag_date
from hai_az_prod.diagnosis_2020july dj 
where context_name ~* 'ICD' and (context_diagnosis_code ~* '^D61\\.?9' or context_diagnosis_code ~* '284\\.?9') and diagnosis_source in ('EPIC Primary', 'Principal', 'Secondary')
group by medical_record_number;
