# Implicit Cursor - Update Customer Phone

## Purpose
Updates a customer's phone number.

## PL/SQL Concepts
- UPDATE statement
- Implicit cursor
- SQL%ROWCOUNT
- COMMIT
## Expected Result
Displays the number of customer records updated.

CREATE OR REPLACE PROCEDURE UPDATE_CUSTOMER_PHONE (
    p_customer_id IN NUMBER,
    p_new_phone IN VARCHAR2
)
AS
BEGIN
    UPDATE CUSTOMERS
    SET phone = p_new_phone
    WHERE customer_id = p_customer_id;

    DBMS_OUTPUT.PUT_LINE(
        'Rows updated: ' || SQL%ROWCOUNT
    );

    COMMIT;
END;
/
