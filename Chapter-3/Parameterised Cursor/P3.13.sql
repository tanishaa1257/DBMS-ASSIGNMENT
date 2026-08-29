SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book(p_category VARCHAR2) IS
        SELECT book_id, title, price, stock
        FROM book
        WHERE category = p_category;

    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
    v_price book.price%TYPE;
    v_stock book.stock%TYPE;

BEGIN
    OPEN c_book('&category');

    LOOP
        FETCH c_book INTO v_book_id, v_title, v_price, v_stock;

        EXIT WHEN c_book%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || v_book_id ||
            ' | Title: ' || v_title ||
            ' | Price: Rs.' || v_price ||
            ' | Stock: ' || v_stock
        );
    END LOOP;

    CLOSE c_book;
END;
/




#output1
Enter value for category: Database

Book ID: 101 | Title: Database System Concepts | Price: Rs.850 | Stock: 12
Book ID: 102 | Title: Let Us Learn PL/SQL | Price: Rs.420.5 | Stock: 4
Book ID: 108 | Title: Oracle SQL Handbook | Price: Rs.640 | Stock: 9
Book ID: 111 | Title: Advanced DBMS | Price: Rs.1150 | Stock: 5


#output2
Enter value for category: Programming

Book ID: 104 | Title: Java Complete Reference | Price: Rs.975 | Stock: 15
Book ID: 105 | Title: Python for Beginners | Price: Rs.350 | Stock: 3
Book ID: 107 | Title: Data Structures in C | Price: Rs.560 | Stock: 2
