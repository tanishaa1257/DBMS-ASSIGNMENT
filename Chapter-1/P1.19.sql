SET SERVEROUTPUT ON;

<<bank>>
DECLARE
    v_bank VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;
BEGIN

    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_dep NUMBER := 45 * 1000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_dep;

        <<counter>>
        DECLARE
            v_token NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(
                bank.v_bank || ' | ' || branch.v_branch ||
                ' | Token ' || v_token
            );
        END;

        -- DBMS_OUTPUT.PUT_LINE(v_token);
        -- Uncommenting the above line gives:
        -- PLS-00201: identifier 'V_TOKEN' must be declared
    END;

    DBMS_OUTPUT.PUT_LINE('Bank Total Deposit: Rs.' || bank.v_total_deposit);
END bank;
/
