CREATE OR REPLACE TRIGGER TRG_RESERVATION_AUDIT
AFTER UPDATE OF reservation_status
ON RESERVATIONS
FOR EACH ROW
WHEN (OLD.reservation_status <> NEW.reservation_status)
BEGIN
    INSERT INTO RESERVATION_AUDIT (
        reservation_id,
        old_status,
        new_status,
        changed_by,
        change_date
    )
    VALUES (
        :OLD.reservation_id,
        :OLD.reservation_status,
        :NEW.reservation_status,
        USER,
        SYSDATE
    );
END;
/
