
CREATE OR REPLACE PACKAGE BODY PKG_HOTEL_MANAGEMENT AS

    PROCEDURE DISPLAY_RESERVATIONS IS
    BEGIN
        FOR r IN (
            SELECT reservation_id,
                   customer_id,
                   room_id,
                   check_in_date,
                   check_out_date,
                   reservation_status
            FROM RESERVATIONS
            ORDER BY reservation_id
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Reservation: ' || r.reservation_id ||
                ' | Customer: ' || r.customer_id ||
                ' | Room: ' || r.room_id ||
                ' | Status: ' || r.reservation_status
            );
        END LOOP;
    END DISPLAY_RESERVATIONS;


    FUNCTION COUNT_RESERVATIONS
    RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_total
        FROM RESERVATIONS;

        RETURN v_total;
    END COUNT_RESERVATIONS;


    FUNCTION CALCULATE_RESERVATION_COST(
        p_reservation_id IN NUMBER
    )
    RETURN NUMBER IS
        v_cost NUMBER;
    BEGIN
        SELECT (r.check_out_date - r.check_in_date)
               * rt.price_per_night
        INTO v_cost
        FROM RESERVATIONS r
        JOIN ROOMS rm
            ON r.room_id = rm.room_id
        JOIN ROOM_TYPES rt
            ON rm.room_type_id = rt.room_type_id
        WHERE r.reservation_id = p_reservation_id;

        RETURN v_cost;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END CALCULATE_RESERVATION_COST;

END PKG_HOTEL_MANAGEMENT;
/
