SET SERVEROUTPUT ON;

DECLARE
    -- Simple cursor for all publishers
    CURSOR c_publisher IS
        SELECT pub_id, pub_name
        FROM publisher
        ORDER BY pub_id;

    -- Parameterised cursor for books of a particular publisher
    CURSOR c_book(p_pub_id NUMBER) IS
        SELECT title, price
        FROM book
        WHERE pub_id = p_pub_id
        ORDER BY book_id;

    v_pub_id publisher.pub_id%TYPE;
    v_pub_name publisher.pub_name%TYPE;
    v_title book.title%TYPE;
    v_price book.price%TYPE;

BEGIN
    OPEN c_publisher;

    LOOP
        FETCH c_publisher INTO v_pub_id, v_pub_name;

        EXIT WHEN c_publisher%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Publisher: ' || v_pub_name ||
            ' (ID: ' || v_pub_id || ')'
        );

        OPEN c_book(v_pub_id);

        LOOP
            FETCH c_book INTO v_title, v_price;

            EXIT WHEN c_book%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(
                '    Book: ' || v_title ||
                ' | Price: Rs.' || v_price
            );
        END LOOP;

        CLOSE c_book;
    END LOOP;

    CLOSE c_publisher;
END;
/

/*
OUTPUT:

Publisher: Oxford Press (ID: 10)
    Book: Computer Networks | Price: Rs.780
    Book: Oracle SQL Handbook | Price: Rs.640
    Book: Cloud Computing Essentials | Price: Rs.880

Publisher: Tech Bharat Pub (ID: 20)
    Book: Let Us Learn PL/SQL | Price: Rs.420.5
    Book: Python for Beginners | Price: Rs.350

Publisher: McGraw Hill (ID: 30)
    Book: Database System Concepts | Price: Rs.850
    Book: Operating System Design | Price: Rs.690
    Book: Java Complete Reference | Price: Rs.975

Publisher: Vidya Prakashan (ID: 40)
    Book: Data Structures in C | Price: Rs.560
    Book: Web Technology Basics | Price: Rs.295

Publisher: Pearson Global (ID: 50)
    Book: Software Engineering | Price: Rs.520
    Book: Advanced DBMS | Price: Rs.1150

*/
