SET SERVEROUTPUT ON;

DECLARE
    v_n NUMBER := 5 + (45 MOD 8);
    v_a NUMBER := 0;
    v_b NUMBER := 1;
    v_next NUMBER;
    v_i NUMBER := 1;

    v_prime NUMBER;
    v_div NUMBER;
    v_is_prime BOOLEAN;

    v_count NUMBER := 0;

    v_gcd_a NUMBER := 45;
    v_gcd_b NUMBER := 30;
    v_r NUMBER;

    v_num NUMBER := 28;
    v_sum NUMBER := 0;
    v_d NUMBER := 1;
BEGIN
    -- Part A: Fibonacci numbers
    DBMS_OUTPUT.PUT_LINE('--- FIBONACCI ---');

    WHILE v_i <= v_n LOOP
        DBMS_OUTPUT.PUT(v_a || ' ');

        v_next := v_a + v_b;
        v_a := v_b;
        v_b := v_next;
        v_i := v_i + 1;
    END LOOP;

    DBMS_OUTPUT.NEW_LINE;

    -- Part B: Check Nth Fibonacci number for prime
    v_prime := v_a;
    v_is_prime := TRUE;
    v_div := 2;

    IF v_prime < 2 THEN
        v_is_prime := FALSE;
    ELSE
        WHILE v_div <= TRUNC(SQRT(v_prime)) LOOP
            IF MOD(v_prime, v_div) = 0 THEN
                v_is_prime := FALSE;
                EXIT;
            END IF;
            v_div := v_div + 1;
        END LOOP;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Nth Fibonacci number: ' || v_prime);

    IF v_is_prime THEN
        DBMS_OUTPUT.PUT_LINE('It is PRIME.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('It is NOT PRIME.');
    END IF;

    -- Part C: Primes from 1 to 100
    DBMS_OUTPUT.PUT_LINE('--- PRIMES 1 TO 100 ---');

    v_prime := 2;

    WHILE v_prime <= 100 LOOP
        v_is_prime := TRUE;
        v_div := 2;

        WHILE v_div <= TRUNC(SQRT(v_prime)) LOOP
            IF MOD(v_prime, v_div) = 0 THEN
                v_is_prime := FALSE;
                EXIT;
            END IF;
            v_div := v_div + 1;
        END LOOP;

        IF v_is_prime THEN
            DBMS_OUTPUT.PUT(v_prime || ' ');
            v_count := v_count + 1;
        END IF;

        v_prime := v_prime + 1;
    END LOOP;

    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Total Primes: ' || v_count);

    -- Part D: GCD using Euclidean algorithm
    DBMS_OUTPUT.PUT_LINE('--- GCD ---');

    WHILE v_gcd_b != 0 LOOP
        v_r := MOD(v_gcd_a, v_gcd_b);
        v_gcd_a := v_gcd_b;
        v_gcd_b := v_r;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('GCD = ' || v_gcd_a);

    -- Part E: Perfect number
    DBMS_OUTPUT.PUT_LINE('--- PERFECT NUMBER ---');

    WHILE v_d <= v_num / 2 LOOP
        IF MOD(v_num, v_d) = 0 THEN
            v_sum := v_sum + v_d;
        END IF;
        v_d := v_d + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
    DBMS_OUTPUT.PUT_LINE('Sum of divisors: ' || v_sum);

    IF v_sum = v_num THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is a PERFECT NUMBER.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is NOT a perfect number.');
    END IF;
END;
/
