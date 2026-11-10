
CREATE OR REPLACE VIEW VW_RESERVATION_DETAILS AS
SELECT
    r.reservation_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    rm.room_number,
    rt.type_name AS room_type,
    rt.price_per_night,
    r.check_in_date,
    r.check_out_date,
    r.reservation_status,
    r.number_of_guests
FROM RESERVATIONS r
JOIN CUSTOMERS c
    ON r.customer_id = c.customer_id
JOIN ROOMS rm
    ON r.room_id = rm.room_id
JOIN ROOM_TYPES rt
    ON rm.room_type_id = rt.room_type_id;
