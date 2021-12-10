with cohort as (
	select medical_record_number from control_cohort order by random() limit 20282
)
select *
from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab
join cohort using (medical_record_number) 
where lab.loinc in ('6690-2', '789-8', '718-7', '4544-3', '787-2', '785-6', '786-4', '21000-5', '788-0', '777-3', '32207-3', '32623-1');
