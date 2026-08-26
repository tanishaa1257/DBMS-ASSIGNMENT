SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'Tanisha';
    v_roll NUMBER := 45;
    v_dob DATE := TO_DATE('25-03-2008', 'DD-MM-YYYY');
    v_upper VARCHAR2(50);
    v_first VARCHAR2(50);
    v_id VARCHAR2(30);
    v_age NUMBER;
BEGIN
    v_upper := UPPER(v_name);
    v_first := SUBSTR(v_name, 1, INSTR(v_name, ' ') - 1);
    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll, 3, '0');
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    DBMS_OUTPUT.PUT_LINE(RPAD('LJICA STUDENT ID CARD', 35, ' '));
    DBMS_OUTPUT.PUT_LINE(RPAD('---------------------', 35, ' '));
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_upper);
    DBMS_OUTPUT.PUT_LINE('First Name : ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Roll No.   : ' || LPAD(v_roll, 3, '0'));
    DBMS_OUTPUT.PUT_LINE('Student ID : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('DOB        : ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Age        : ' || v_age);

    IF LENGTH(v_name) > 20 THEN
        v_name := REPLACE(v_name, SUBSTR(v_name, INSTR(v_name, ' ') + 1), 
                          SUBSTR(v_name, INSTR(v_name, ' ') + 1, 1) || '.');
        DBMS_OUTPUT.PUT_LINE('Abbreviated: ' || v_name);
    END IF;
END;
/
