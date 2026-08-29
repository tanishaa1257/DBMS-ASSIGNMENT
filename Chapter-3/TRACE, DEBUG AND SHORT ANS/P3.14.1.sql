SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title
        FROM book
        WHERE category = p_cat;

    v_found BOOLEAN := FALSE;

BEGIN
    FOR r IN c_book('Database') LOOP

        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE(
            r.book_id || ' - ' || r.title
        );

    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No books found');
    END IF;

END;
/

/*
ANSWER:

Cause:
The cursor FOR loop automatically opens, fetches, and closes
the parameterised cursor.

The line:
IF c_book%ROWCOUNT = 0 THEN

raises ORA-01001 because the cursor has already been closed
when the FOR loop ends.

The line:
CLOSE c_book;

is also removed because the cursor FOR loop closes it
automatically.

A BOOLEAN flag is used to check whether any rows were found.

OUTPUT:

101 - Database System Concepts
102 - Let Us Learn PL/SQL
108 - Oracle SQL Handbook
111 - Advanced DBMS
*/
