SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_overdue(p_days NUMBER) IS
        SELECT bi.issue_id, b.book_id, b.title, bi.issue_date
        FROM book_issue bi
        JOIN book b
            ON bi.book_id = b.book_id
        WHERE bi.return_date IS NULL
        AND TRUNC(SYSDATE - bi.issue_date) > p_days
        ORDER BY bi.issue_date;

    v_total_fine NUMBER := 0;
    v_overdue_days NUMBER;
    v_fine NUMBER;

BEGIN
    FOR r IN c_overdue(&days) LOOP

        v_overdue_days := TRUNC(SYSDATE - r.issue_date);
        v_fine := v_overdue_days * 2;

        v_total_fine := v_total_fine + v_fine;

        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || r.issue_id ||
            ' | Book ID: ' || r.book_id ||
            ' | Title: ' || r.title ||
            ' | Issue Date: ' || TO_CHAR(r.issue_date, 'DD-MON-YYYY') ||
            ' | Overdue Days: ' || v_overdue_days ||
            ' | Fine: Rs.' || v_fine
        );

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Fine Payable: Rs.' || v_total_fine);

END;
/

/*
OUTPUT:

Enter value for days: 30

Issue ID: 5002 | Book ID: 104 | Title: Java Complete Reference | Issue Date: 03-JUN-2026 | Overdue Days: 87 | Fine: Rs.174
Issue ID: 5004 | Book ID: 107 | Title: Data Structures in C | Issue Date: 10-JUN-2026 | Overdue Days: 80 | Fine: Rs.160
Issue ID: 5006 | Book ID: 103 | Title: Operating System Design | Issue Date: 15-JUN-2026 | Overdue Days: 75 | Fine: Rs.150
Issue ID: 5008 | Book ID: 106 | Title: Computer Networks | Issue Date: 01-JUL-2026 | Overdue Days: 59 | Fine: Rs.118
Issue ID: 5010 | Book ID: 112 | Title: Cloud Computing Essentials | Issue Date: 09-JUL-2026 | Overdue Days: 51 | Fine: Rs.102
Issue ID: 5012 | Book ID: 109 | Title: Software Engineering | Issue Date: 20-JUL-2026 | Overdue Days: 40 | Fine: Rs.80

Total Fine Payable: Rs.784
*/
