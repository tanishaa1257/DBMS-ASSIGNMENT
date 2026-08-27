SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'Tanisha';
    v_dob DATE := TO_DATE('25-03-2008', 'DD-MM-YYYY');
    v_roll NUMBER := 45;
    v_pnr VARCHAR2(30);
    v_jdate DATE;
    v_base_fare NUMBER;
    v_final_fare NUMBER;
    v_age NUMBER;
BEGIN
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');

    v_jdate := SYSDATE + (v_roll MOD 30 + 1);

    v_base_fare := v_roll * 50 + 200;

    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    IF v_age >= 60 THEN
        v_final_fare := v_base_fare * 0.60;
    ELSE
        v_final_fare := v_base_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('          IRCTC RAILWAY TICKET');
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger:', 20) || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Roll No.:', 20) || LPAD(v_roll, 4, '0'));
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR:', 20) || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Date of Birth:', 20) ||
                         TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Age:', 20) || v_age);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date:', 20) ||
                         TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare:', 20) ||
                         'Rs.' || TO_CHAR(v_base_fare, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Final Fare:', 20) ||
                         'Rs.' || TO_CHAR(v_final_fare, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('========================================');
END;
/
