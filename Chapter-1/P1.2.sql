SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'Tanisha';
    v_marks NUMBER(5,2) := 330;
    v_percentage NUMBER(5,2);
    v_dob DATE := SYSDATE;
    v_passed BOOLEAN := TRUE;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || SYSDATE);

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
/
