SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title
        FROM book;

    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;

BEGIN
    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor already open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is closed. Opening cursor...');
        OPEN c_book;
    END IF;

    FETCH c_book INTO v_book_id, v_title;

    DBMS_OUTPUT.PUT_LINE(
        'Book ID: ' || v_book_id || ' | Title: ' || v_title
    );

    CLOSE c_book;

    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is still open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is now closed: FALSE');
    END IF;
END;
/
