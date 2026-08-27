SET SERVEROUTPUT ON;

DECLARE
    v_dept NUMBER := (45 MOD 6 + 1) * 10;
    v_cnt NUMBER;
    v_avg NUMBER;
    v_max NUMBER;
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary), 2), MAX(salary)
    INTO v_cnt, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Average Salary: Rs.' || v_avg);
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: Rs.' || v_max);

    /*
    COUNT(*) never raises NO_DATA_FOUND because it always returns
    one row containing 0 when no employees match the condition.
    */
END;
/
