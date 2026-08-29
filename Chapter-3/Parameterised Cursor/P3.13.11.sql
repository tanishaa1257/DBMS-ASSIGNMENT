SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book(p_category VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_category)
        FOR UPDATE OF price;

    v_old_price book.price%TYPE;
    v_new_price book.price%TYPE;

BEGIN
    FOR r IN c_book('&category') LOOP

        v_old_price := r.price;
        v_new_price := ROUND(v_old_price * 1.10, 2);

        UPDATE book
        SET price = v_new_price
        WHERE CURRENT OF c_book;

        DBMS_OUTPUT.PUT_LINE(
            'Title: ' || r.title ||
            ' | Old Price: Rs.' || v_old_price ||
            ' | New Price: Rs.' || v_new_price
        );

    END LOOP;

    COMMIT;
END;
/

/*
OUTPUT:

Enter value for category: Database

Title: Database System Concepts | Old Price: Rs.850 | New Price: Rs.935
Title: Let Us Learn PL/SQL | Old Price: Rs.420.5 | New Price: Rs.462.55
Title: Oracle SQL Handbook | Old Price: Rs.640 | New Price: Rs.704
Title: Advanced DBMS | Old Price: Rs.1150 | New Price: Rs.1265

*/
