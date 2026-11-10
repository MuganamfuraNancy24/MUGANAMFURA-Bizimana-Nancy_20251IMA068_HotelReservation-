# VARRAY Collection

## Purpose
Stores hotel service names in a collection with a maximum capacity of five elements.

## PL/SQL Concepts
- VARRAY
- Collection initialization
- BULK COLLECT
- Collection COUNT


CREATE OR REPLACE PROCEDURE DISPLAY_SERVICE_VARRAY
AS
    TYPE service_array_type IS VARRAY(5)
        OF VARCHAR2(100);

    v_services service_array_type :=
        service_array_type();
BEGIN
    SELECT service_name
    BULK COLLECT INTO v_services
    FROM SERVICES
    ORDER BY service_id;

    FOR i IN 1..v_services.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Service ' || i || ': ' || v_services(i)
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total services: ' || v_services.COUNT
    );
END;
/
