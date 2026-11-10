# Bulk Log Rooms

## Purpose
Records multiple room IDs in the ROOM_BULK_LOG table using bulk processing.

## PL/SQL Concepts
- BULK COLLECT
- FORALL
- INSERT statement
- SQL%ROWCOUNT
- COMMIT


CREATE OR REPLACE PROCEDURE LOG_ROOMS_BULK
AS
    TYPE room_id_array IS TABLE OF ROOMS.room_id%TYPE;

    v_room_ids room_id_array;
BEGIN
    SELECT room_id
    BULK COLLECT INTO v_room_ids
    FROM ROOMS
    ORDER BY room_id;

    FORALL i IN 1..v_room_ids.COUNT
        INSERT INTO ROOM_BULK_LOG (room_id)
        VALUES (v_room_ids(i));

    DBMS_OUTPUT.PUT_LINE(
        'Rooms logged: ' || SQL%ROWCOUNT
    );

    COMMIT;
END;
/
