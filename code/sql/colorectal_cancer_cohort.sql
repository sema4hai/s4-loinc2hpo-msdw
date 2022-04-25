create temp table cohort as 
select medical_record_number , min(calendar_date) as min_diag_date
from hai_az_prod.diagnosis_2020july dj 
where context_name ~* 'ICD' and (context_diagnosis_code ~* '^C18(\\.\\d)?' or 
context_diagnosis_code in ('C19', 'C20') or 
context_diagnosis_code ~* '^153(\\.\\d)?' or 
context_diagnosis_code ~* '^154\\.[018]') and 
diagnosis_source in ('EPIC Primary', 'Principal')
group by medical_record_number;
