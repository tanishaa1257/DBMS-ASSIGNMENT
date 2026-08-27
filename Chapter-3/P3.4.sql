SET SERVEROUTPUT ON;

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
COMMIT;

DECLARE
    CURSOR c_publisher IS
        SELECT pub_name, city, country
        FROM publisher;

    v_publisher c_publisher%ROWTYPE;
BEGIN
    OPEN c_publisher;

    LOOP
        FETCH c_publisher INTO v_publisher;

        EXIT WHEN c_publisher%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_publisher.pub_name ||
            ' | City: ' || v_publisher.city ||
            ' | Country: ' || v_publisher.country
        );
    END LOOP;

    CLOSE c_publisher;
END;
/


