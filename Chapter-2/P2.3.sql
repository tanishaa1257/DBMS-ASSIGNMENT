SET SERVEROUTPUT ON;

DECLARE
    v_balance NUMBER := 45 * 500 + 5000;
    v_choice NUMBER := 1;
    v_withdraw NUMBER;
    v_txns NUMBER := 0;
    v_total_withdrawn NUMBER := 0;
BEGIN
    LOOP
        EXIT WHEN v_choice = 3 OR v_balance = 0;

        -- Simulated withdrawals for 4 iterations
        IF v_txns = 0 THEN
            v_withdraw := 500;
        ELSIF v_txns = 1 THEN
            v_withdraw := 1000;
        ELSIF v_txns = 2 THEN
            v_withdraw := 1500;
        ELSE
            v_withdraw := 2000;
        END IF;

        IF v_withdraw <= 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0.');

        ELSIF MOD(v_withdraw, 100) <> 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be a multiple of 100.');

        ELSIF v_withdraw > 10000 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000.');

        ELSIF v_withdraw > v_balance THEN
            DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance.');

        ELSE
            v_balance := v_balance - v_withdraw;
            v_txns := v_txns + 1;
            v_total_withdrawn := v_total_withdrawn + v_withdraw;

            DBMS_OUTPUT.PUT_LINE('----- TRANSACTION ' || v_txns || ' -----');
            DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs.' || v_withdraw);
            DBMS_OUTPUT.PUT_LINE('Remaining Balance: Rs.' || v_balance);
        END IF;

        -- Exit after 4 simulated transactions
        IF v_txns = 4 THEN
            v_choice := 3;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('----- FINAL SUMMARY -----');
    DBMS_OUTPUT.PUT_LINE('Transactions Done: ' || v_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn: Rs.' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance: Rs.' || v_balance);
END;
/
