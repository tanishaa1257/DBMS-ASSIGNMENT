SET SERVEROUTPUT ON;

DECLARE
    v_qty NUMBER := 45 MOD 5 + 2;
    v_price NUMBER := 45 * 100 + 400;
    v_coupon NUMBER := NULL;
    v_gross NUMBER;
    v_disc NUMBER;
    v_taxable NUMBER;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;
BEGIN
    v_gross := v_qty * v_price;
    v_disc := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_disc;
    v_cgst := v_taxable * 9 / 100;
    v_sgst := v_taxable * 9 / 100;
    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('----- KIRANA STORE BILL -----');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price: Rs.' || TO_CHAR(v_price, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || TO_CHAR(v_gross, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon,
        'Coupon applied: ' || v_coupon || '%',
        'No coupon'));
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || TO_CHAR(v_disc, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Taxable Amount: Rs.' || TO_CHAR(v_taxable, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('CGST @9%: Rs.' || TO_CHAR(v_cgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('SGST @9%: Rs.' || TO_CHAR(v_sgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs.' || TO_CHAR(v_total, '99,999'));
END;
/
