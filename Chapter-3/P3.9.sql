SET SERVEROUTPUT ON;

CREATE TABLE publisher (
pub_id NUMBER(4),
pub_name VARCHAR2(40) NOT NULL,
city VARCHAR2(30),
country VARCHAR2(30),
CONSTRAINT pk_publisher PRIMARY KEY (pub_id)
);

CREATE TABLE book (
book_id NUMBER(5),
title VARCHAR2(60) NOT NULL,
category VARCHAR2(25),
price NUMBER(8,2),
stock NUMBER(4),
pub_id NUMBER(4),
CONSTRAINT pk_book PRIMARY KEY (book_id),
CONSTRAINT fk_book_pub FOREIGN KEY (pub_id)
REFERENCES publisher (pub_id)
);


-- Parent table first
INSERT INTO publisher VALUES (10, 'Oxford Press', 'London', 'UK');
INSERT INTO publisher VALUES (20, 'Tech Bharat Pub', 'Pune', 'India');
INSERT INTO publisher VALUES (30, 'McGraw Hill', 'New York', 'USA');
INSERT INTO publisher VALUES (40, 'Vidya Prakashan', 'Ahmedabad', 'India');
INSERT INTO publisher VALUES (50, 'Pearson Global', 'Toronto', 'Canada');
INSERT INTO book VALUES (101,'Database System Concepts','Database', 850.00, 12, 30);
INSERT INTO book VALUES (102,'Let Us Learn PL/SQL', 'Database', 420.50, 4, 20);
INSERT INTO book VALUES (103,'Operating System Design', 'OS', 690.00, 8, 30);
INSERT INTO book VALUES (104,'Java Complete Reference', 'Programming',975.00, 15, 30);
INSERT INTO book VALUES (105,'Python for Beginners', 'Programming',350.00, 3, 20);
INSERT INTO book VALUES (106,'Computer Networks', 'Networking', 780.00, 6, 10);
INSERT INTO book VALUES (107,'Data Structures in C', 'Programming',560.00, 2, 40);
INSERT INTO book VALUES (108,'Oracle SQL Handbook', 'Database', 640.00, 9, 10);
INSERT INTO book VALUES (109,'Software Engineering', 'SE', 520.00, 7, 50);
INSERT INTO book VALUES (110,'Web Technology Basics', 'Web', 295.00, 1, 40);
INSERT INTO book VALUES (111,'Advanced DBMS', 'Database', 1150.00, 5, 50);
INSERT INTO book VALUES (112,'Cloud Computing Essentials','Networking',880.00, 4, 10);


DECLARE
    CURSOR c_book_pub IS
        SELECT b.title, p.pub_name, p.country
        FROM book b
        JOIN publisher p
        ON b.pub_id = p.pub_id;

    v_title book.title%TYPE;
    v_pub_name publisher.pub_name%TYPE;
    v_country publisher.country%TYPE;
BEGIN
    OPEN c_book_pub;

    LOOP
        FETCH c_book_pub INTO v_title, v_pub_name, v_country;
        EXIT WHEN c_book_pub%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Book: ' || v_title ||
            ' | Publisher: ' || v_pub_name ||
            ' | Country: ' || v_country
        );
    END LOOP;

    CLOSE c_book_pub;
END;
/


/*
OUTPUT:

Book: Database System Concepts | Publisher: McGraw Hill | Country: USA
Book: Let Us Learn PL/SQL | Publisher: Tech Bharat Pub | Country: India
Book: Operating System Design | Publisher: McGraw Hill | Country: USA
...
*/
