SET SERVEROUTPUT ON;

DECLARE
    v_n NUMBER := 45 MOD 12 + 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Today: ' ||
        TO_CHAR(SYSDATE, 'Day, DD "th" Month YYYY'));

    DBMS_OUTPUT.PUT_LINE('Date after ' || v_n || ' months: ' ||
        TO_CHAR(ADD_MONTHS(SYSDATE, v_n), 'DD-MON-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Last day of current month: ' ||
        TO_CHAR(LAST_DAY(SYSDATE), 'DD-MON-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Next Monday: ' ||
        TO_CHAR(NEXT_DAY(SYSDATE, 'MONDAY'), 'DD-MON-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Days left in this month: ' ||
        TRUNC(LAST_DAY(SYSDATE) - SYSDATE));
END;
/
