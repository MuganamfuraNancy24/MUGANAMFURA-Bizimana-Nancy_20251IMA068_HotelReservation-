# Explicit Cursor - Display Customers

## Purpose
Retrieves and displays customer records from the CUSTOMERS table.

## PL/SQL Concepts
- Explicit cursor declaration
- OPEN
- FETCH
- CLOSE
- %NOTFOUND
- DBMS_OUTPUT.PUT_LINE


CREATE OR REPLACE PROCEDURE DISPLAY_CUSTOMERS
AS
    CURSOR customer_cursor IS
        SELECT customer_id, first_name, last_name, email
        FROM CUSTOMERS
        ORDER BY customer_id;

    v_customer_id NUMBER;
    v_first_name VARCHAR2(50);
    v_last_name VARCHAR2(50);
    v_email VARCHAR2(100);
BEGIN
    OPEN customer_cursor;

    LOOP
        FETCH customer_cursor
        INTO v_customer_id, v_first_name,
             v_last_name, v_email;

        EXIT WHEN customer_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || v_customer_id ||
            ' | Name: ' || v_first_name || ' ' ||
            v_last_name ||
            ' | Email: ' || v_email
        );
    END LOOP;

    CLOSE customer_cursor;
END;
/
