SET SERVEROUTPUT ON;

DECLARE
    v_table NUMBER := 45 MOD 9 + 2;
    v_height NUMBER := 5 + 45 MOD 5;
BEGIN
    -- Part A: Multiplication table
    DBMS_OUTPUT.PUT_LINE('--- TABLE OF ' || v_table || ' ---');

    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_table || ' x ' || i || ' = ' || v_table * i);
    END LOOP;

    -- Part B: Tables of 2, 3, 4 and 5
    DBMS_OUTPUT.PUT_LINE('--- TABLES 2 TO 5 ---');

    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(
                LPAD(n || ' x ' || i, 8) ||
                ' = ' || LPAD(n * i, 3)
            );
        END LOOP;
    END LOOP;

    -- Part C: Right-angled star triangle
    DBMS_OUTPUT.PUT_LINE('--- STAR TRIANGLE ---');

    FOR i IN 1..v_height LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

    -- Part D: Number pyramid
    DBMS_OUTPUT.PUT_LINE('--- NUMBER PYRAMID ---');

    FOR i IN 1..6 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT(j);
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

    -- Part E: Reverse star triangle using REVERSE
    DBMS_OUTPUT.PUT_LINE('--- REVERSE STAR TRIANGLE ---');

    FOR i IN REVERSE 1..v_height LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/
