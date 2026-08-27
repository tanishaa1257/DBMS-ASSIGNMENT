SET SERVEROUTPUT ON;

DECLARE
    v_food NUMBER := 45;
    v_distance NUMBER := 5;

    v_rain CHAR(1) := 'Y';
    v_late_night CHAR(1) := 'N';
    v_festival CHAR(1) := 'N';
    v_peak CHAR(1) := 'Y';
    v_first_order CHAR(1) := 'Y';

    v_base NUMBER;
    v_rain_charge NUMBER := 0;
    v_night_charge NUMBER := 0;
    v_festival_charge NUMBER := 0;
    v_peak_charge NUMBER := 0;
    v_discount NUMBER := 0;
    v_delivery NUMBER;
    v_grand_total NUMBER;
BEGIN
    v_base := CASE
        WHEN v_distance < 3 THEN 0
        WHEN v_distance <= 8 THEN 29
        WHEN v_distance <= 15 THEN 49
        ELSE 79
    END;

    v_rain_charge := CASE
        WHEN v_rain = 'Y' THEN v_base * 0.20
        ELSE 0
    END;

    v_night_charge := CASE
        WHEN v_late_night = 'Y' THEN v_base * 0.15
        ELSE 0
    END;

    v_festival_charge := CASE
        WHEN v_festival = 'Y' THEN v_base * 0.10
        ELSE 0
    END;

    v_peak_charge := CASE
        WHEN v_peak = 'Y' THEN v_base * 0.10
        ELSE 0
    END;

    v_delivery := v_base + v_rain_charge +
                  v_night_charge + v_festival_charge +
                  v_peak_charge;

    IF v_food > 499 THEN
        v_discount := v_delivery;
        v_delivery := 0;
    ELSIF v_first_order = 'Y' THEN
        v_discount := v_delivery * 0.50;
        v_delivery := v_delivery - v_discount;
    END IF;

    v_delivery := ROUND(v_delivery);
    v_grand_total := ROUND(v_food + v_delivery);

    DBMS_OUTPUT.PUT_LINE('----- ZOMATO DELIVERY RECEIPT -----');
    DBMS_OUTPUT.PUT_LINE('Food Total: Rs.' || v_food);
    DBMS_OUTPUT.PUT_LINE('Distance: ' || v_distance || ' km');
    DBMS_OUTPUT.PUT_LINE('Base Delivery: Rs.' || v_base);
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge: Rs.' || ROUND(v_rain_charge));
    DBMS_OUTPUT.PUT_LINE('Late Night Surcharge: Rs.' || ROUND(v_night_charge));
    DBMS_OUTPUT.PUT_LINE('Festival Surcharge: Rs.' || ROUND(v_festival_charge));
    DBMS_OUTPUT.PUT_LINE('Peak Hour Surcharge: Rs.' || ROUND(v_peak_charge));
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || ROUND(v_discount));
    DBMS_OUTPUT.PUT_LINE('Final Delivery: Rs.' || v_delivery);
    DBMS_OUTPUT.PUT_LINE('Grand Total: Rs.' || v_grand_total);
END;
/
