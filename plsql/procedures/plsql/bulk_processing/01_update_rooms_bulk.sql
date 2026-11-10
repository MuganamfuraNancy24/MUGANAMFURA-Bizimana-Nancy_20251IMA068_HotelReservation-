# Bulk Update Rooms

## Purpose
Demonstrates bulk retrieval and bulk updating of room records.

## PL/SQL Concepts
- BULK COLLECT
- FORALL
- SQL%ROWCOUNT
- UPDATE statement


CREATE OR REPLACE PROCEDURE UPDATE_ROOMS_BULK
AS
    TYPE room_id_array IS TABLE OF ROOMS.room_id%TYPE;

    v_room_ids room_id_array;
BEGIN
    SELECT room_id
    BULK COLLECT INTO v_room_ids
    FROM ROOMS
    WHERE room_status = 'AVAILABLE';

    FORALL i IN 1..v_room_ids.COUNT
        UPDATE ROOMS
        SET room_status = 'AVAILABLE'
        WHERE room_id = v_room_ids(i);

    DBMS_OUTPUT.PUT_LINE(
        'Rooms processed: ' || SQL%ROWCOUNT
    );

    COMMIT;
END;
/
