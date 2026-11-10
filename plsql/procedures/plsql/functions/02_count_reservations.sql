# Count Reservations Function

## Purpose
Counts the total number of reservations stored in the hotel database.

## PL/SQL Concepts
- Stored function
- SELECT INTO statement
- COUNT aggregate function
- RETURN statement

## Expected Result
Returns the total number of reservation records.

  
CREATE OR REPLACE FUNCTION COUNT_RESERVATIONS
RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM RESERVATIONS;

    RETURN v_total;
END;
/
