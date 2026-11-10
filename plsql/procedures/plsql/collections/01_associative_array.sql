# Associative Array

## Purpose
Stores customer names in an indexed collection.

## PL/SQL Concepts
- Associative arrays
- INDEX BY PLS_INTEGER
- Collection indexing
- LOOP


CREATE OR REPLACE PROCEDURE DISPLAY_CUSTOMER_ARRAY
AS
    TYPE customer_array_type IS TABLE OF VARCHAR2(100)
        INDEX BY PLS_INTEGER;

    v_customers customer_array_type;
    v_index PLS_INTEGER := 0;
BEGIN
    FOR rec IN (
        SELECT first_name, last_name
        FROM CUSTOMERS
        ORDER BY customer_id
    )
    LOOP
        v_index := v_index + 1;

        v_customers(v_index) :=
            rec.first_name || ' ' || rec.last_name;
    END LOOP;

    FOR i IN 1..v_index
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Customer ' || i || ': ' || v_customers(i)
        );
    END LOOP;
END;
/
