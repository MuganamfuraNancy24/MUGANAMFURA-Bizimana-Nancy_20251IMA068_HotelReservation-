# Add Reservation Procedure
## Purpose
Creates a new hotel reservation for a customer.

## Parameters
- p_customer_id: Customer identification number.
- p_room_id: Room identification number.
- p_check_in: Check-in date.
- p_check_out: Check-out date.
- p_guests: Number of guests.

## PL/SQL Concepts
- Stored procedures
- INSERT statement
- Exception handling
- COMMIT and ROLLBACK


CREATE OR REPLACE PROCEDURE ADD_RESERVATION (
    p_customer_id IN NUMBER,
    p_room_id IN NUMBER,
    p_check_in IN DATE,
    p_check_out IN DATE,
    p_guests IN NUMBER
)
AS
BEGIN
    INSERT INTO RESERVATIONS (
        customer_id,
        room_id,
        check_in_date,
        check_out_date,
        reservation_status,
        number_of_guests
    )
    VALUES (
        p_customer_id,
        p_room_id,
        p_check_in,
        p_check_out,
        'PENDING',
        p_guests
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Reservation added successfully!'
    );

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/
