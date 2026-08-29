SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book(p_cat VARCHAR2 DEFAULT 'Database') IS
        SELECT book_id, title, price
        FROM book
        WHERE category = p_cat;

    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
    v_price book.price%TYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- DEFAULT: DATABASE ---');

    OPEN c_book;

    LOOP
        FETCH c_book INTO v_book_id, v_title, v_price;

        EXIT WHEN c_book%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || v_book_id ||
            ' | Title: ' || v_title ||
            ' | Price: Rs.' || v_price
        );
    END LOOP;

    CLOSE c_book;

    DBMS_OUTPUT.PUT_LINE('--- ARGUMENT: NETWORKING ---');

    OPEN c_book('Networking');

    LOOP
        FETCH c_book INTO v_book_id, v_title, v_price;

        EXIT WHEN c_book%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || v_book_id ||
            ' | Title: ' || v_title ||
            ' | Price: Rs.' || v_price
        );
    END LOOP;

    CLOSE c_book;
END;
/

#Output
--- DEFAULT: DATABASE ---
Book ID: 101 | Title: Database System Concepts | Price: Rs.850
Book ID: 102 | Title: Let Us Learn PL/SQL | Price: Rs.420.5
Book ID: 108 | Title: Oracle SQL Handbook | Price: Rs.640
Book ID: 111 | Title: Advanced DBMS | Price: Rs.1150

--- ARGUMENT: NETWORKING ---
Book ID: 106 | Title: Computer Networks | Price: Rs.780
Book ID: 112 | Title: Cloud Computing Essentials | Price: Rs.880
