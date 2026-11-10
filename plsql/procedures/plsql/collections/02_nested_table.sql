# Nested Table Collection

## Purpose
Stores multiple room numbers in a nested table collection.

## PL/SQL Concepts
- Nested table
- BULK COLLECT
- Collection COUNT
- Collection indexing


CREATE OR REPLACE PROCEDURE DISPLAY_ROOM_NESTED_TABLE
AS
    TYPE room_table_type IS TABLE OF VARCHAR2(10);

    v_rooms room_table_type := room_table_type();
BEGIN
    SELECT room_number
    BULK COLLECT INTO v_rooms
    FROM ROOMS
    ORDER BY room_number;

    FOR i IN 1..v_rooms.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Room ' || i || ': ' || v_rooms(i)
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total rooms: ' || v_rooms.COUNT
    );
END;
/
