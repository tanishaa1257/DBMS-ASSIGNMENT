SET SERVEROUTPUT ON;

DECLARE
    CURSOR c IS
        SELECT title
        FROM book
        WHERE price > 600;

    v_title book.title%TYPE;

BEGIN
    OPEN c;

    LOOP
        FETCH c INTO v_title;

        EXIT WHEN c%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            c%ROWCOUNT || ' : ' || v_title
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Final ROWCOUNT = ' || c%ROWCOUNT
    );

    CLOSE c;
END;
/

/*
PREDICTED OUTPUT:

1 : Database System Concepts
2 : Operating System Design
3 : Java Complete Reference
4 : Computer Networks
5 : Oracle SQL Handbook
6 : Advanced DBMS
7 : Cloud Computing Essentials
Final ROWCOUNT = 8


EXPLANATION:

The cursor selects 7 books whose price is greater than Rs.600.

%ROWCOUNT increases whenever FETCH is executed.
The first 7 FETCH operations successfully retrieve books,
so the output shows 1 to 7.

The 8th FETCH finds no row. It still increases %ROWCOUNT
to 8, and %NOTFOUND becomes TRUE, so the loop exits.

Therefore, the final ROWCOUNT is 8 instead of 7.
*/
