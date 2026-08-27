SET SERVEROUTPUT ON;

DECLARE
    c_gst CONSTANT NUMBER := 18;
    v_roll_no NUMBER := 45;
    v_index NUMBER;
    v_plan NUMBER;
    v_gst NUMBER;
    v_total NUMBER;
BEGIN
    v_index := MOD(v_roll_no, 4) + 1;

    IF v_index = 1 THEN
        v_plan := 199;
    ELSIF v_index = 2 THEN
        v_plan := 299;
    ELSIF v_index = 3 THEN
        v_plan := 399;
    ELSE
        v_plan := 599;
    END IF;

    v_gst := v_plan * c_gst / 100;
    v_total := v_plan + v_gst;

    DBMS_OUTPUT.PUT_LINE('----- MOBILE RECHARGE RECEIPT -----');
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan Name:', 20) || 'Airtel/Jio ' || v_plan);
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Price:', 20) || TO_CHAR(v_plan, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST @18%:', 20) || TO_CHAR(v_gst, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Total Payable:', 20) || TO_CHAR(v_total, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Validity Date:', 20) ||
                         TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY'));
END;
/
