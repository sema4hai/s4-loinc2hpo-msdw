create temp table control_cohort as 
with patients_having_blood_work as (
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '6690-2'
	intersect 
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '789-8'
	intersect 
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '718-7'
	intersect 
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '4544-3'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '787-2'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '785-6'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '786-4'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '788-0'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '777-3'
	intersect
	select medical_record_number
	from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
	where lab.loinc = '32623-1'
),
patients_having_cancer as (
	select distinct medical_record_number
	from hai_az_prod.diagnosis_2020july dj 
	where context_name ~* 'ICD' and (context_diagnosis_code ~* '(^140)|(^172)|(^174)|(^209)|(^173)|(^225)|(^227)|(^228)|(^230)|(^234)|(^237)|(^238)|(^239)|(^273)|(^277)' or 
	context_diagnosis_code ~* '(^C00)|(^C43)|(^C4A)|(^C45)|(^C48)|(^C49)|(^C96)|(^C44)|(^D00)|(^D09)|(^D18)|(^D32)|(^D33)|(^D35)|(^D42)|(^D43)|(^D44)|(^D45)|(^D46)|(^D47)|(^D49)|(^D85)|(^D87)')
),
control_patient_mrns as (
select medical_record_number
from patients_having_blood_work 
where medical_record_number not in (select medical_record_number from patients_having_cancer where medical_record_number is not null)
)
select *
from hai_az_prod.person_msdw_2020july people
join control_patient_mrns using (medical_record_number);
