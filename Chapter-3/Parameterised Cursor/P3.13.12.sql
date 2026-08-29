SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_member(p_letter VARCHAR2) IS
        SELECT member_id, member_name, course, semester
        FROM lib_member
        WHERE UPPER(member_name) LIKE UPPER(p_letter) || '%'
        ORDER BY member_id;

BEGIN
    FOR r IN c_member('&letter') LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Member ID: ' || r.member_id ||
            ' | Name: ' || r.member_name ||
            ' | Course: ' || r.course ||
            ' | Semester: ' || r.semester
        );

    END LOOP;
END;
/

/*
OUTPUT:

Enter value for letter: R

Member ID: 1 | Name: Riya Shah | Course: MSc IT | Semester: 1
*/
