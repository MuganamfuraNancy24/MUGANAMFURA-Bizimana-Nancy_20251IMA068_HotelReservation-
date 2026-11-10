
CREATE OR REPLACE TRIGGER TRG_PREVENT_ROOM_OVERLAP
BEFORE INSERT OR UPDATE OF room_id, check_in_date, check_out_date
ON RESERVATIONS
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM RESERVATIONS
    WHERE room_id = :NEW.room_id
      AND reservation_status IN ('PENDING', 'CONFIRMED')
      AND reservation_id <> NVL(:NEW.reservation_id, -1)
      AND check_in_date < :NEW.check_out_date
      AND check_out_date > :NEW.check_in_date;

    IF :NEW.reservation_status IN ('PENDING', 'CONFIRMED')
       AND v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'This room is already reserved for the selected dates.'
        );
    END IF;
END;
/
