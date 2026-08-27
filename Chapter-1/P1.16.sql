SET SERVEROUTPUT ON;

DECLARE
    v_id NUMBER := ((45 + 2) MOD 11 + 1) * 10;
    v_dname departments.department_name%TYPE;
    v_loc departments.location_id%TYPE;
BEGIN
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Dept ' || v_id || ': ' || v_dname ||
                         ' at location ' || v_loc);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found - check the ID.');
END;
/

-- %TYPE automatically takes the data type of the referenced column.
-- If department_name changes from VARCHAR2(30) to VARCHAR2(60),
-- this block still works without any changes.
