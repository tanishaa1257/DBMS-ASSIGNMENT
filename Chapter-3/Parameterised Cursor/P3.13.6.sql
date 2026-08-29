SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue(p_member_id NUMBER) IS
        SELECT b.book_id, b.title, bi.issue_date
        FROM lib_member m
        JOIN book_issue bi
            ON m.member_id = bi.member_id
        JOIN book b
            ON bi.book_id = b.book_id
        WHERE m.member_id = p_member_id
        ORDER BY bi.issue_date;

    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
    v_issue_date book_issue.issue_date%TYPE;

BEGIN
    OPEN c_issue(1);

    LOOP
        FETCH c_issue INTO v_book_id, v_title, v_issue_date;

        EXIT WHEN c_issue%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || v_book_id ||
            ' | Title: ' || v_title ||
            ' | Issue Date: ' ||
            TO_CHAR(v_issue_date, 'DD-MON-YYYY')
        );
    END LOOP;

    CLOSE c_issue;
END;
/

/*
OUTPUT:

Book ID: 101 | Title: Database System Concepts | Issue Date: 01-JUN-2026
Book ID: 107 | Title: Data Structures in C | Issue Date: 10-JUN-2026

*/
