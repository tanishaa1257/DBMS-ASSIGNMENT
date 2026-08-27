SET SERVEROUTPUT ON;

DECLARE
    v_units NUMBER := 45 * 10 + 50;
    c_rate CONSTANT NUMBER := 5;
    c_fixed CONSTANT NUMBER := 70;
    v_energy NUMBER;
    v_total NUMBER;
BEGIN
    v_energy := v_units * c_rate;
    v_total := v_energy + c_fixed;

    DBMS_OUTPUT.PUT_LINE('----- TORRENT POWER ELECTRICITY BILL -----');
    DBMS_OUTPUT.PUT_LINE('Consumer Name: ' || 'Tanisha');
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units);
    DBMS_OUTPUT.PUT_LINE('Energy Charge: Rs.' || ROUND(v_energy, 2));
    DBMS_OUTPUT.PUT_LINE('Fixed Charge: Rs.' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || ROUND(v_total, 2));
END;
/
