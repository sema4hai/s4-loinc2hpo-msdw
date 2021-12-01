-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

select distinct lab.medical_record_number , lab.lab_date , lab.loinc, lab.local_test_code , lab.lab_result_numeric_value , lab.unit_of_measure , lab.normal_range , lab.interpretation , lab.hpotermid , lab.isnegated , cohort.min_diag_date,
lab.lab_date - cohort.min_diag_date as rel_date
from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
join cohort using (medical_record_number)
where lab.loinc in ('2160-0', '3094-0', '6299-2', '2823-3', '5804-0', '2889-4', '2888-6')
