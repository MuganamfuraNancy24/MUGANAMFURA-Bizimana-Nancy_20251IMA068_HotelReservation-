# Customer Records

## Purpose
Demonstrates how PL/SQL records store related customer information.

## PL/SQL Concepts
- User-defined RECORD
- CUSTOMERS%ROWTYPE
- SELECT INTO
- DBMS_OUTPUT.PUT_LINE


CREATE OR REPLACE PROCEDURE DISPLAY_CUSTOMER_RECORDS
AS
    -- User-defined record
    TYPE customer_record_type IS RECORD (
        customer_name VARCHAR2(100),
        customer_email VARCHAR2(100)
    );

    v_customer customer_record_type;

    -- Table-based record
    v_full_customer CUSTOMERS%ROWTYPE;
BEGIN
    -- Populate user-defined record
    SELECT first_name || ' ' || last_name, email
    INTO v_customer
    FROM CUSTOMERS
    WHERE customer_id = 1;

    DBMS_OUTPUT.PUT_LINE('USER-DEFINED RECORD');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer.customer_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_customer.customer_email);

    -- Populate %ROWTYPE record
    SELECT *
    INTO v_full_customer
    FROM CUSTOMERS
    WHERE customer_id = 1;

    DBMS_OUTPUT.PUT_LINE('TABLE-BASED RECORD (%ROWTYPE)');
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_full_customer.customer_id);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_full_customer.first_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_full_customer.last_name);
END;
/
