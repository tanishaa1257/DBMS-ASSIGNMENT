SET SERVEROUTPUT on;

CREATE TABLE publisher (
pub_id NUMBER(4),
pub_name VARCHAR2(40) NOT NULL,
city VARCHAR2(30),
country VARCHAR2(30),
CONSTRAINT pk_publisher PRIMARY KEY (pub_id)
);
-- Parent table first
INSERT INTO publisher VALUES (10, 'Oxford Press', 'London', 'UK');
INSERT INTO publisher VALUES (20, 'Tech Bharat Pub', 'Pune', 'India');
INSERT INTO publisher VALUES (30, 'McGraw Hill', 'New York', 'USA');
INSERT INTO publisher VALUES (40, 'Vidya Prakashan', 'Ahmedabad', 'India');
INSERT INTO publisher VALUES (50, 'Pearson Global', 'Toronto', 'Canada');
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
