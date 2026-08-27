CREATE TABLE lib_member (
member_id NUMBER(5),
member_name VARCHAR2(40) NOT NULL,
course VARCHAR2(20),
semester NUMBER(1),
join_date DATE,
CONSTRAINT pk_member PRIMARY KEY (member_id)
);

INSERT INTO lib_member VALUES (1,'Riya Shah', 'MSc IT', 1, DATE '2026-01-10');
INSERT INTO lib_member VALUES (2,'Arjun Mehta', 'MSc IT', 3, DATE '2025-07-22');
INSERT INTO lib_member VALUES (3,'Neha Patel', 'MCA', 2, DATE '2026-02-05');
INSERT INTO lib_member VALUES (4,'Karan Joshi', 'MCA', 4, DATE '2025-06-15');
INSERT INTO lib_member VALUES (5,'Sneha Desai', 'BCA', 2, DATE '2026-03-01');
INSERT INTO lib_member VALUES (6,'Vivek Nair', 'MSc IT', 3, DATE '2025-12-11');
INSERT INTO lib_member VALUES (7,'Ananya Rao', 'BCA', 5, DATE '2026-01-28');
INSERT INTO lib_member VALUES (8,'Manav Trivedi','MCA', 2, DATE '2025-08-09');
COMMIT;


DECLARE
    CURSOR c_member IS
        SELECT member_name, course, semester
        FROM lib_member;

    v_name lib_member.member_name%TYPE;
    v_course lib_member.course%TYPE;
    v_semester lib_member.semester%TYPE;

BEGIN
    OPEN c_member;

    LOOP
        FETCH c_member INTO v_name, v_course, v_semester;

        EXIT WHEN c_member%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            c_member%ROWCOUNT || '. ' ||
            UPPER(v_name) || ' (' ||
            v_course || ' - Sem ' ||
            v_semester || ')'
        );
    END LOOP;

    CLOSE c_member;
END;
/
