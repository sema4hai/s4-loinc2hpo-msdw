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
-- Name: hai_az_test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA hai_az_test;


SET default_tablespace = '';

--
-- Name: cohort_has_lab_test; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.cohort_has_lab_test (
    medical_record_number character varying(50)
);


--
-- Name: cohort_lsd_note_list; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.cohort_lsd_note_list (
    note_id bigint,
    person_id bigint,
    medical_record_number character varying(50),
    batch_number integer,
    created_at timestamp with time zone
);


--
-- Name: epic_lab_code_and_name; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.epic_lab_code_and_name (
    test_code integer,
    test_name character varying(60)
);


--
-- Name: fact; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.fact (
    fact_key bigint,
    person_key integer,
    accounting_group_key integer,
    encounter_key integer,
    caregiver_group_key integer,
    facility_key integer,
    procedure_group_key integer,
    diagnosis_group_key integer,
    material_group_key integer,
    organization_group_key integer,
    payor_group_key integer,
    operation_key integer,
    keyword_group_key smallint,
    calendar_key smallint,
    time_of_day_key smallint,
    meta_data_key smallint,
    uom_key smallint,
    data_feed_key integer,
    data_quality_key smallint,
    data_state_key smallint,
    audit_key bigint,
    value character varying(4000)
);


--
-- Name: fact_lab; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.fact_lab (
    fact_key bigint,
    person_key integer,
    accounting_group_key smallint,
    encounter_key integer,
    caregiver_group_key integer,
    facility_key integer,
    procedure_group_key integer,
    diagnosis_group_key integer,
    material_group_key smallint,
    organization_group_key integer,
    payor_group_key smallint,
    operation_key integer,
    keyword_group_key smallint,
    calendar_key smallint,
    time_of_day_key smallint,
    meta_data_key smallint,
    uom_key smallint,
    data_feed_key integer,
    data_quality_key smallint,
    data_state_key smallint,
    audit_key bigint,
    value character varying(4000)
);


--
-- Name: lab_epic_2020july; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.lab_epic_2020july (
    mrn character varying(50),
    order_date date,
    lab_time character varying(8),
    test_code integer,
    test_result_value character varying(300),
    unit_of_measurement character varying(18),
    reference_range character varying(60),
    test_result_value_final real,
    range_low_final real,
    range_hi_final real
);


--
-- Name: lab_testset; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.lab_testset (
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
-- Name: mps2_notes; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.mps2_notes (
    note_id bigint,
    person_id bigint,
    note_event_id bigint,
    note_event_field_concept_id integer,
    note_date date,
    note_datetime timestamp without time zone,
    note_type_concept_id integer,
    note_class_concept_id integer,
    note_title character varying(250),
    note_text character varying(65535),
    encoding_concept_id integer,
    language_concept_id integer,
    provider_id bigint,
    visit_occurrence_id bigint,
    visit_detail_id bigint,
    note_source_value character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    person_source_value character varying(1000)
);


--
-- Name: person_keys; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.person_keys (
    person_key integer,
    person_type character varying(7),
    medical_record_number character varying(50),
    mother_account_number character varying(13),
    gender character varying(13),
    race character varying(27),
    citizenship character varying(25),
    language character varying(19),
    marital_status_code character varying(30),
    marital_status_legal_ind character varying(17),
    marital_status_social_ind character varying(17),
    marital_status_reason character varying(30),
    religion character varying(21),
    address_city character varying(31),
    address_state character varying(26),
    address_zip character varying(16),
    address_country character varying(30),
    address_type character varying(13),
    cerner_pcp_id character varying(13),
    date_of_birth timestamp without time zone,
    date_of_death timestamp without time zone,
    deceased_indicator character varying(13),
    living_will_indicator character varying(13),
    active_indicator character varying(13),
    effective_start_date_time timestamp without time zone,
    effective_end_date_time timestamp without time zone,
    active_flag character varying(1),
    orphan_flag character varying(1),
    valid_flag character varying(1),
    source_name character varying(54),
    person_control_key integer,
    patient_ethnic_group character varying(12),
    interpreter_required character varying(3),
    interpreter_type character varying(15),
    mrn character varying(50),
    dx_date date
);


--
-- Name: severe_asthma_notes; Type: TABLE; Schema: hai_az_test; Owner: -
--

CREATE TABLE hai_az_test.severe_asthma_notes (
    person_id bigint,
    note_date date,
    note_title character varying(250),
    note_id bigint,
    note_text character varying(65535)
);

--
-- PostgreSQL database dump complete
--

