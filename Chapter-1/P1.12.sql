SET SERVEROUTPUT ON;

DECLARE
    v_m1 NUMBER := 45 MOD 30 + 60;
    v_m2 NUMBER := 45 MOD 30 + 60;
    v_m3 NUMBER := 45 MOD 30 + 60;
    v_m4 NUMBER := 45 MOD 30 + 60;
    v_m5 NUMBER := NULL;
    v_total NUMBER;
    v_pct NUMBER;
    v_passed BOOLEAN;
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    v_pct := ROUND(v_total / 500 * 100, 2);
    v_passed := (v_pct >= 40);

    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_pct || '%');

    -- BOOLEAN cannot be passed directly to DBMS_OUTPUT.PUT_LINE.
    DBMS_OUTPUT.PUT_LINE(
        CASE
            WHEN v_passed THEN 'Result: PASS'
            ELSE 'Result: FAIL'
        END
    );
END;
/
