SET SERVEROUTPUT ON;

CREATE TABLE book_issue (
issue_id NUMBER(6),
book_id NUMBER(5),
member_id NUMBER(5),
issue_date DATE,
return_date DATE,
fine NUMBER(6,2) DEFAULT 0,
CONSTRAINT pk_issue PRIMARY KEY (issue_id),
CONSTRAINT fk_issue_book FOREIGN KEY (book_id)
REFERENCES book (book_id),
CONSTRAINT fk_issue_member FOREIGN KEY (member_id)
REFERENCES lib_member (member_id)
);

INSERT INTO book_issue VALUES (5001,101,1,DATE '2026-06-01',DATE '2026-06-12', 0);
INSERT INTO book_issue VALUES (5002,104,2,DATE '2026-06-03',NULL, 0);
INSERT INTO book_issue VALUES (5003,102,3,DATE '2026-06-05',DATE '2026-06-30', 50);
INSERT INTO book_issue VALUES (5004,107,1,DATE '2026-06-10',NULL, 0);
INSERT INTO book_issue VALUES (5005,111,4,DATE '2026-06-11',DATE '2026-06-20', 0);
INSERT INTO book_issue VALUES (5006,103,5,DATE '2026-06-15',NULL, 0);
INSERT INTO book_issue VALUES (5007,108,2,DATE '2026-06-18',DATE '2026-07-15', 90);
INSERT INTO book_issue VALUES (5008,106,6,DATE '2026-07-01',NULL, 0);
INSERT INTO book_issue VALUES (5009,101,7,DATE '2026-07-04',DATE '2026-07-14', 0);
INSERT INTO book_issue VALUES (5010,112,8,DATE '2026-07-09',NULL, 0);
INSERT INTO book_issue VALUES (5011,105,3,DATE '2026-07-12',DATE '2026-07-19', 0);
INSERT INTO book_issue VALUES (5012,109,4,DATE '2026-07-20',NULL, 0);
COMMIT;

DECLARE
    CURSOR c_issue IS
        SELECT issue_id, book_id, issue_date
        FROM book_issue
        WHERE return_date IS NULL;

    v_issue_id book_issue.issue_id%TYPE;
    v_book_id book_issue.book_id%TYPE;
    v_issue_date book_issue.issue_date%TYPE;
    v_count NUMBER := 0;

BEGIN
    OPEN c_issue;

    LOOP
        FETCH c_issue INTO v_issue_id, v_book_id, v_issue_date;

        EXIT WHEN c_issue%NOTFOUND;

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || v_issue_id ||
            ' | Book ID: ' || v_book_id ||
            ' | Issue Date: ' || TO_CHAR(v_issue_date, 'DD-MON-YYYY')
        );
    END LOOP;

    CLOSE c_issue;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('All books returned');
    END IF;
END;
/
