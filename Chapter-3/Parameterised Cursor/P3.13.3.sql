SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book(p_min_price NUMBER, p_max_price NUMBER) IS
        SELECT book_id, title, price
        FROM book
        WHERE price BETWEEN p_min_price AND p_max_price;

    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
    v_price book.price%TYPE;

BEGIN
    OPEN c_book(300, 700);

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
Book ID: 102 | Title: Let Us Learn PL/SQL | Price: Rs.420.5
Book ID: 103 | Title: Operating System Design | Price: Rs.690
Book ID: 105 | Title: Python for Beginners | Price: Rs.350
Book ID: 107 | Title: Data Structures in C | Price: Rs.560
Book ID: 108 | Title: Oracle SQL Handbook | Price: Rs.640
Book ID: 109 | Title: Software Engineering | Price: Rs.520
