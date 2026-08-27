SET SERVEROUTPUT ON;

DECLARE
    v_roll NUMBER := 45;
    v_attendance NUMBER := 85;
    v_theory NUMBER := 50;
    v_practical NUMBER := 25;
    v_assignment NUMBER := 8;

    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(20);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('----- LJICA SEMESTER RESULT -----');
    DBMS_OUTPUT.PUT_LINE('Roll No.: ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Attendance: ' || v_attendance || '%');
    DBMS_OUTPUT.PUT_LINE('Theory: ' || v_theory || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical: ' || v_practical || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment: ' || v_assignment || '/20');

    IF v_attendance < 40 THEN
        v_result := 'DETAINED';
        v_remark := 'Insufficient attendance';

    ELSIF v_theory < 28 THEN
        v_result := 'FAIL in Theory';
        v_remark := 'Improve theory marks';

    ELSIF v_practical < 12 THEN
        v_result := 'FAIL in Practical';
        v_remark := 'Improve practical marks';

    ELSE
        v_total := v_theory + v_practical + LEAST(v_assignment, 10);
        v_percentage := ROUND((v_total / 110) * 100, 2);

        v_grade := CASE
            WHEN v_percentage >= 75 THEN 'A'
            WHEN v_percentage >= 60 THEN 'B'
            WHEN v_percentage >= 50 THEN 'C'
            WHEN v_percentage >= 40 THEN 'D'
            ELSE 'F'
        END;

        v_result := 'PASS';

        IF v_percentage >= 75 THEN
            v_remark := 'Excellent performance';
        ELSIF v_percentage >= 60 THEN
            v_remark := 'Good performance';
        ELSIF v_percentage >= 50 THEN
            v_remark := 'Satisfactory performance';
        ELSE
            v_remark := 'Needs improvement';
        END IF;
    END IF;

    IF v_result = 'PASS' THEN
        DBMS_OUTPUT.PUT_LINE('Total: ' || v_total || '/110');
        DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
        DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Remark: ' || v_remark);
END;
/
