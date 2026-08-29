SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_member(p_course VARCHAR2, p_semester NUMBER) IS
        SELECT member_id, member_name, join_date
        FROM lib_member
        WHERE UPPER(course) = UPPER(p_course)
        AND semester = p_semester;

    v_member_id lib_member.member_id%TYPE;
    v_member_name lib_member.member_name%TYPE;
    v_join_date lib_member.join_date%TYPE;

BEGIN
    OPEN c_member('&course', &semester);

    LOOP
        FETCH c_member INTO v_member_id, v_member_name, v_join_date;

        EXIT WHEN c_member%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Member ID: ' || v_member_id ||
            ' | Name: ' || v_member_name ||
            ' | Join Date: ' || TO_CHAR(v_join_date, 'DD-MON-YYYY')
        );
    END LOOP;

    CLOSE c_member;
END;
/

#OUTPUT

enter:

Enter value for course: MCA
Enter value for semester: 2
Output
Member ID: 3 | Name: Neha Patel | Join Date: 05-FEB-2026
Member ID: 8 | Name: Manav Trivedi | Join Date: 09-AUG-2025
