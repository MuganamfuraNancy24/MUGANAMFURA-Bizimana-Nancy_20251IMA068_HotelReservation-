# Reservation Exception Handling

## Purpose
Checks whether a reservation exists and displays its status.

## PL/SQL Concepts
- Exception handling
- NO_DATA_FOUND
- WHEN OTHERS
- SQLERRM
- SELECT INTO


CREATE OR REPLACE PROCEDURE CHECK_RESERVATION (
    p_reservation_id IN NUMBER
)
AS
    v_status RESERVATIONS.reservation_status%TYPE;
BEGIN
    SELECT reservation_status
    INTO v_status
    FROM RESERVATIONS
    WHERE reservation_id = p_reservation_id;

    DBMS_OUTPUT.PUT_LINE(
        'Reservation status: ' || v_status
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Reservation not found.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Unexpected error: ' || SQLERRM
        );
END;
/
