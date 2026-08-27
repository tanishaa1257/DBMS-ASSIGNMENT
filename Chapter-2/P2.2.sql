SET SERVEROUTPUT ON;

DECLARE
    v_seed NUMBER := 45;
    v_gross NUMBER := v_seed * 50000;
    v_standard_deduction NUMBER := 75000;
    v_taxable NUMBER;
    v_tax NUMBER;
    v_tds NUMBER;
    v_monthly_salary NUMBER;
BEGIN
    v_taxable := v_gross - v_standard_deduction;

    -- Searched CASE is used for the tax slabs.
    v_tax := CASE
        WHEN v_taxable <= 300000 THEN 0
        WHEN v_taxable <= 700000 THEN
            (v_taxable - 300000) * 0.05
        WHEN v_taxable <= 1000000 THEN
            20000 + (v_taxable - 700000) * 0.10
        WHEN v_taxable <= 1200000 THEN
            50000 + (v_taxable - 1000000) * 0.15
        WHEN v_taxable <= 1500000 THEN
            80000 + (v_taxable - 1200000) * 0.20
        ELSE
            140000 + (v_taxable - 1500000) * 0.30
    END;

    v_tax := ROUND(v_tax, 2);
    v_tds := ROUND(v_tax / 12, 2);
    v_monthly_salary := ROUND((v_gross - v_tax) / 12, 2);

    DBMS_OUTPUT.PUT_LINE('----- INCOME TAX CALCULATOR 2024-25 -----');
    DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs.' || TO_CHAR(v_gross, '99,99,999'));
    DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs.' ||
                         TO_CHAR(v_standard_deduction, '99,99,999'));
    DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs.' ||
                         TO_CHAR(v_taxable, '99,99,999'));
    DBMS_OUTPUT.PUT_LINE('Total Tax: Rs.' ||
                         TO_CHAR(v_tax, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs.' ||
                         TO_CHAR(v_tds, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Monthly Take-Home: Rs.' ||
                         TO_CHAR(v_monthly_salary, '99,99,999.00'));

    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No tax this year - save more with PPF/ELSS!'
        );
    END IF;
END;
/
