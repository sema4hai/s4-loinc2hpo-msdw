-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

select distinct lab.medical_record_number , lab.lab_date , lab.loinc, lab.local_test_code , lab.lab_result_numeric_value , lab.unit_of_measure , lab.normal_range , lab.interpretation , lab.hpotermid , lab.isnegated , cohort.min_diag_date,
lab.lab_date - cohort.min_diag_date as rel_date
from hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july lab 
join cohort using (medical_record_number)
where loinc in ('1742-6', '1920-8', '6768-6', '2324-2', '1968-7', '1975-2', '1751-7', '2885-2', '2532-0', '14805-6', '5902-2');
