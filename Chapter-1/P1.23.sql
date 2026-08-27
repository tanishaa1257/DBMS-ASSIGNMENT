SET SERVEROUTPUT ON;

DECLARE
    -- Bug 1: Assignment operator error - use := instead of =
    v_name VARCHAR2(50) := 'Tanisha';

    -- Bug 3: CONSTANT must be initialized when declared
    c_bonus_rate CONSTANT NUMBER := 0.1;

    v_sal NUMBER := 45 * 1000 + 20000;
    v_bonus NUMBER;
    v_fname employees.first_name%TYPE;
BEGIN
    v_bonus := v_sal * c_bonus_rate;

    -- Bug 5: SELECT in PL/SQL must use INTO
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    -- Bug 4: Missing semicolon after DBMS_OUTPUT statement
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || v_bonus);
END;
/
