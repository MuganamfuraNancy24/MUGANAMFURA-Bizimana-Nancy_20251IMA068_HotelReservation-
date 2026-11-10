# Update Reservation Status Procedure

## Purpose
Updates the status of an existing hotel reservation.

## Parameters
- p_reservation_id: Reservation identification number.
- p_new_status: New reservation status.

## PL/SQL Concepts
- UPDATE statement
- IF condition
- Implicit cursor (SQL%ROWCOUNT)
- Exception handling
- COMMIT and ROLLBACK

CREATE OR REPLACE PROCEDURE UPDATE_RESERVATION_STATUS (
    p_reservation_id IN NUMBER,
    p_new_status IN VARCHAR2
)
AS
BEGIN
    UPDATE RESERVATIONS
    SET reservation_status = UPPER(p_new_status)
    WHERE reservation_id = p_reservation_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Reservation not found.'
        );
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(
            'Reservation status updated successfully.'
        );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/
