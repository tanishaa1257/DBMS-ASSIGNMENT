SET SERVEROUTPUT ON;


DECLARE
    v_city VARCHAR2(30) := 'Gujarat';
    v_num NUMBER := 100;
    v_roll_no NUMBER := 45;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer Block: City = ' || v_city || ', Number = ' || v_num);
    DBMS_OUTPUT.PUT_LINE('Roll Number: ' || v_roll_no);

    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Middle Block: City = ' || v_city || ', Number = ' || v_num);

        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Block: City = ' || v_city || ', Number = ' || v_num);
            DBMS_OUTPUT.PUT_LINE('Inner Block Outer City: ' || outer.v_city);
        END;
    END;

    DBMS_OUTPUT.PUT_LINE('After Middle Block: City = ' || v_city || ', Number = ' || v_num);
END outer;
/
