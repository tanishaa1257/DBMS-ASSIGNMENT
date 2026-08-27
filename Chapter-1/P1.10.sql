SET SERVEROUTPUT ON;

DECLARE
    v_celsius NUMBER := 45 MOD 20 + 25;
    v_f NUMBER;
    v_k NUMBER;
    v_f2 NUMBER := 98.6;
    v_c2 NUMBER;
BEGIN
    v_f := ROUND(v_celsius * 9 / 5 + 32, 1);
    v_k := v_celsius + 273.15;

    v_c2 := ROUND((v_f2 - 32) * 5 / 9, 1);

    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius || ' C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_f || ' F');
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_k || ' K');

    DBMS_OUTPUT.PUT_LINE('Reverse Conversion:');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_f2 || ' F');
    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_c2 || ' C');

    DBMS_OUTPUT.PUT_LINE('C*9/5+32 and C*(9/5)+32 give the same result because multiplication and division have the same precedence and are evaluated from left to right.');
END;
/
