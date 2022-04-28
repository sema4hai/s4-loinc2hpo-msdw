--
-- PostgreSQL database dump
--

-- Dumped from database version 8.0.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- Name: hai_az_prod; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA hai_az_prod;


SET default_tablespace = '';

--
-- Name: diagnosis_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.diagnosis_2020july (
    medical_record_number character varying(50),
    encounter_key integer,
    caregiver_group_key integer,
    diagnosis_group_key integer,
    diagnosis_rank smallint,
    diagnosis_key integer,
    context_name character varying(2000),
    context_diagnosis_code character varying(65535),
    description character varying(65535),
    calendar_date date,
    principal_diagnosis_indicator character varying(9),
    diagnosis_source character varying(16)
);


--
-- Name: dmsdw_race_map; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.dmsdw_race_map (
    race character varying(256),
    mapto character varying(256)
);


--
-- Name: encounter_msdw_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.encounter_msdw_2020july (
    medical_record_number character varying(50),
    encounter_key integer,
    encounter_visit_id character varying(23),
    encounter_sub_visit_id bigint,
    encounter_type character varying(13),
    location character varying(63),
    begin_date_time timestamp without time zone,
    end_date_time timestamp without time zone,
    estimated_length_of_stay integer
);


--
-- Name: fabry_cohort; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.fabry_cohort (
    medical_record_number character varying(256),
    min_dx_date date,
    evidence character varying(14),
    context_name character varying(2000),
    context_diagnosis_code character varying(65535),
    description character varying(65535),
    note_id bigint,
    note_text character varying(65535)
);


--
-- Name: fd_procedure; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.fd_procedure (
    procedure_key integer,
    context_name character varying(65535),
    context_procedure_code character varying(65535),
    procedure_description character varying(65535)
);


--
-- Name: hpo; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.hpo (
    termid character varying(10),
    distancetoroot integer,
    label character varying(256)
);


--
-- Name: hpo_is_a_pairs; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.hpo_is_a_pairs (
    current character varying(10),
    ancestor character varying(10),
    distance integer
);


--
-- Name: lab_scc_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.lab_scc_2020july (
    medical_record_number character varying(50),
    encounter_key integer,
    facility_key integer,
    calendar_date date,
    time_of_day_key smallint,
    procedure_key integer,
    clinical_result_numeric character varying(65535),
    clinical_result_string character varying(65535),
    reference_range character varying(65535),
    abnormal_flag character varying(65535),
    unit_of_measure_numeric character varying(65535),
    unit_of_measure_string character varying(65535),
    unit_of_measure_reference_range character varying(65535)
);


--
-- Name: lab_scc_abnormal_flag_mapping; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.lab_scc_abnormal_flag_mapping (
    abnormal_flag character varying(256),
    mapto character varying(256)
);


--
-- Name: loinc2hpo; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.loinc2hpo (
    loincid character varying(256),
    loincscale character varying(256),
    code_system character varying(256),
    code character varying(256),
    hpotermid character varying(10),
    isnegated boolean
);


--
-- Name: loinc_mapping; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.loinc_mapping (
    source character varying(256),
    code character varying(256),
    test_name character varying(256),
    unit character varying(256),
    loinc character varying(256),
    default_unit character varying(256)
);


--
-- Name: loinc_testable_phenotypes; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.loinc_testable_phenotypes (
    loincid character varying(256),
    termid character varying(10),
    is_tested_directly boolean
);


--
-- Name: medications_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.medications_2020july (
    medical_record_number character varying(50),
    person_key integer,
    encounter_key integer,
    encounter_visit_id character varying(23),
    facility_key integer,
    caregiver_group_key integer,
    operation_key integer,
    calendar_date date,
    time_of_day_key smallint,
    material_group_key integer,
    material_rank smallint,
    material_role character varying(22),
    material_type character varying(65535),
    material_name character varying(65535),
    context_name character varying(2000),
    context_material_code character varying(65535),
    level1_context_name character varying(12),
    level2_event_name character varying(35),
    level3_action_name character varying(56),
    units_per_administration character varying(65535),
    route character varying(65535),
    route_detail character varying(65535),
    site character varying(65535),
    infusion_rate character varying(65535),
    refills character varying(65535),
    dispense character varying(65535),
    start_date character varying(65535),
    end_date character varying(65535),
    note character varying(65535),
    source character varying(14)
);


--
-- Name: person_msdw_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.person_msdw_2020july (
    medical_record_number character varying(50),
    date_of_birth date,
    gender character varying(13),
    race character varying(256)
);


--
-- Name: procedure_dmsdw_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.procedure_dmsdw_2020july (
    medical_record_number character varying(50),
    encounter_key integer,
    caregiver_group_key integer,
    procedure_group_key integer,
    procedure_key integer,
    procedure_rank smallint,
    context_name character varying(65535),
    context_procedure_code character varying(65535),
    procedure_description character varying(65535),
    calendar_date date
);


--
-- Name: rxnorm_map; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.rxnorm_map (
    context_name character varying(256),
    context_material_code character varying(256),
    n integer,
    material_name character varying(256),
    querytext character varying(256),
    rxnorm character varying(256)
);


--
-- Name: scc_and_epic_lab_after_loinc2hpo_2020july; Type: TABLE; Schema: hai_az_prod; Owner: -
--

CREATE TABLE hai_az_prod.scc_and_epic_lab_after_loinc2hpo_2020july (
    medical_record_number character varying(50),
    lab_date date,
    lab_time character varying(22),
    context_name character varying(65535),
    local_test_code character varying(65535),
    loinc character varying(256),
    lab_result_numeric_value character varying(65535),
    unit_of_measure character varying(65535),
    normal_range character varying(65535),
    interpretation character varying(256),
    hpotermid character varying(10),
    isnegated boolean
);

--
-- PostgreSQL database dump complete
--

