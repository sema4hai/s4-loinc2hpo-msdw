-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

select distinct lab.medical_record_number , lab.lab_date , lab.loinc, lab.local_test_code , lab.lab_result_numeric_value , lab.unit_of_measure , lab.normal_range , lab.interpretation , lab.hpotermid , lab.isnegated , cohort.min_diag_date,
lab.lab_date - cohort.min_diag_date as rel_date
from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
join cohort using (medical_record_number)
where lab.loinc in ('6690-2', '789-8', '718-7', '4544-3', '787-2', '785-6', '786-4', '21000-5', '788-0', '777-3', '32207-3', '32623-1')
