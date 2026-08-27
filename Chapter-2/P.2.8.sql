SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 45 * 1000;
    v_existing_emi NUMBER := 5000;
    v_loan_amount NUMBER := 2000000;
    v_rate NUMBER := 9;
    v_tenure NUMBER := 60;

    v_r NUMBER;
    v_emi NUMBER;
    v_foir NUMBER;
    v_available_emi NUMBER;
    v_approved_amount NUMBER;
    v_test_loan NUMBER;
    v_decision VARCHAR2(20);
BEGIN
    v_r := v_rate / 12 / 100;

    v_foir := v_salary * 0.40;
    v_available_emi := v_foir - v_existing_emi;

    v_emi := ROUND(
        v_loan_amount * v_r * POWER(1 + v_r, v_tenure) /
        (POWER(1 + v_r, v_tenure) - 1), 2
    );

    v_approved_amount := v_loan_amount;

    -- Find maximum eligible loan using WHILE LOOP
    IF v_salary < 25000 THEN
        v_approved_amount := 0;

    ELSIF v_loan_amount > v_salary * 60 THEN
        v_test_loan := v_salary * 60;

        WHILE v_test_loan > 0 LOOP
            v_emi := ROUND(
                v_test_loan * v_r * POWER(1 + v_r, v_tenure) /
                (POWER(1 + v_r, v_tenure) - 1), 2
            );

            EXIT WHEN v_emi <= v_available_emi;

            v_test_loan := v_test_loan - 10000;
        END LOOP;

        v_approved_amount := v_test_loan;

    ELSIF v_emi > v_available_emi THEN
        v_test_loan := v_loan_amount;

        WHILE v_test_loan > 0 LOOP
            v_emi := ROUND(
                v_test_loan * v_r * POWER(1 + v_r, v_tenure) /
                (POWER(1 + v_r, v_tenure) - 1), 2
            );

            EXIT WHEN v_emi <= v_available_emi;

            v_test_loan := v_test_loan - 10000;
        END LOOP;

        v_approved_amount := v_test_loan;
    END IF;

    v_emi := ROUND(
        v_approved_amount * v_r * POWER(1 + v_r, v_tenure) /
        (POWER(1 + v_r, v_tenure) - 1), 2
    );

    v_decision := CASE
        WHEN v_salary < 25000 THEN 'REJECTED'
        WHEN v_approved_amount = v_loan_amount THEN 'APPROVED'
        WHEN v_approved_amount > 0 THEN 'CONDITIONAL'
        ELSE 'REJECTED'
    END;

    DBMS_OUTPUT.PUT_LINE('----- LOAN EMI AFFORDABILITY CHECK -----');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs.' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs.' || v_existing_emi);
    DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs.' || v_loan_amount);
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure: ' || v_tenure || ' months');
    DBMS_OUTPUT.PUT_LINE('FOIR Limit: Rs.' || v_foir);
    DBMS_OUTPUT.PUT_LINE('Available EMI Capacity: Rs.' || v_available_emi);
    DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs.' || v_emi);
    DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs.' || v_approved_amount);
    DBMS_OUTPUT.PUT_LINE('Decision: ' || v_decision);
    DBMS_OUTPUT.PUT_LINE('Monthly Cost: Existing EMI Rs.' ||
                         v_existing_emi || ' + New EMI Rs.' || v_emi);
    DBMS_OUTPUT.PUT_LINE('Total Monthly EMI: Rs.' ||
                         (v_existing_emi + v_emi));
END;
/
