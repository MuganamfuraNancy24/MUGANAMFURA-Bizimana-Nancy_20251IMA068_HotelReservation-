# Display Reservations Procedure

## Purpose
Displays all hotel reservations together with customer names, room numbers, check-in dates, check-out dates, and reservation statuses.

## PL/SQL Concepts
- Stored procedures
- Cursor FOR LOOP
- SQL JOIN operations
- DBMS_OUTPUT.PUT_LINE

## Expected Result
Displays reservation information from the RESERVATIONS, CUSTOMERS, and ROOMS tables.


  
CREATE OR REPLACE PROCEDURE DISPLAY_RESERVATIONS
AS
BEGIN
    FOR rec IN (
        SELECT
            r.reservation_id,
            c.first_name || ' ' || c.last_name AS customer_name,
            rm.room_number,
            r.check_in_date,
            r.check_out_date,
            r.reservation_status
        FROM RESERVATIONS r
        JOIN CUSTOMERS c
            ON r.customer_id = c.customer_id
        JOIN ROOMS rm
            ON r.room_id = rm.room_id
        ORDER BY r.reservation_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reservation ID: ' || rec.reservation_id ||
            ' | Customer: ' || rec.customer_name ||
            ' | Room: ' || rec.room_number ||
            ' | Status: ' || rec.reservation_status
        );
    END LOOP;
END;
/
