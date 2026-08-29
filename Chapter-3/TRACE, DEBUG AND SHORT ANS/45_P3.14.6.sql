SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title
        FROM book;

BEGIN
    /*
    %FOUND on an unopened cursor raises ORA-01001.
    Example:
    DBMS_OUTPUT.PUT_LINE(c_book%FOUND);
    */

    /*
    %NOTFOUND on an unopened cursor raises ORA-01001.
    Example:
    DBMS_OUTPUT.PUT_LINE(c_book%NOTFOUND);
    */

    /*
    %ROWCOUNT on an unopened cursor raises ORA-01001.
    Example:
    DBMS_OUTPUT.PUT_LINE(c_book%ROWCOUNT);
    */

    -- %ISOPEN is the exception. It can be checked before OPEN.
    DBMS_OUTPUT.PUT_LINE(
        'Cursor open status: ' ||
        CASE
            WHEN c_book%ISOPEN THEN 'TRUE'
            ELSE 'FALSE'
        END
    );

END;
/

/*
OUTPUT:

Cursor open status: FALSE

EXPLANATION:

%FOUND, %NOTFOUND and %ROWCOUNT require the cursor to have
been opened and fetched. Using them before OPEN raises
ORA-01001: cursor number is invalid.

%ISOPEN is the exception. It can be checked even when the
cursor has not been opened, and it returns FALSE.
*/
