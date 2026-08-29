SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book(p_pub_name VARCHAR2) IS
        SELECT b.title, b.price
        FROM book b
        JOIN publisher p
        ON b.pub_id = p.pub_id
        WHERE UPPER(p.pub_name) = UPPER(p_pub_name);

    v_title book.title%TYPE;
    v_price book.price%TYPE;

BEGIN
    OPEN c_book('&publisher_name');

    LOOP
        FETCH c_book INTO v_title, v_price;

        EXIT WHEN c_book%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Title: ' || v_title ||
            ' | Price: Rs.' || v_price
        );
    END LOOP;

    CLOSE c_book;
END;
/

#output1
  
Enter: McGraw Hill

Output:

Title: Database System Concepts | Price: Rs.850
Title: Operating System Design | Price: Rs.690
Title: Java Complete Reference | Price: Rs.975

#output2

Enter: TECH BHARAT PUB

Output:

Title: Let Us Learn PL/SQL | Price: Rs.420.5
Title: Python for Beginners | Price: Rs.350

