# Calculate Reservation Cost Function

## Purpose
Calculates the total accommodation cost of a reservation.

## Parameter
- p_reservation_id: Reservation identification number.

## PL/SQL Concepts
- Stored function
- SELECT INTO
- JOIN operations
- RETURN statement
- NO_DATA_FOUND exception

CREATE OR REPLACE FUNCTION CALCULATE_RESERVATION_COST (
    p_reservation_id IN NUMBER
)
RETURN NUMBER
AS
    v_total_cost NUMBER(10,2);
BEGIN
    SELECT
        (r.check_out_date - r.check_in_date)
        * rt.price_per_night
    INTO v_total_cost
    FROM RESERVATIONS r
    JOIN ROOMS rm
        ON r.room_id = rm.room_id
    JOIN ROOM_TYPES rt
        ON rm.room_type_id = rt.room_type_id
    WHERE r.reservation_id = p_reservation_id;

    RETURN v_total_cost;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/
