SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_publisher(p_country VARCHAR2) IS
        SELECT pub_id, pub_name, city, country
        FROM publisher
        WHERE UPPER(country) = UPPER(p_country);

    v_found BOOLEAN := FALSE;

BEGIN
    FOR r IN c_publisher('&country') LOOP

        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE(
            'Publisher ID: ' || r.pub_id ||
            ' | Name: ' || r.pub_name ||
            ' | City: ' || r.city ||
            ' | Country: ' || r.country
        );

    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE(
            'No publisher found in ' || '&country'
        );
    END IF;


    /*
    %ROWCOUNT cannot be checked after a cursor FOR loop has ended
    because Oracle automatically opens, fetches, and closes the cursor.
    After the loop ends, the cursor is closed.
    */

END;
/

/*
OUTPUT 1:

Enter value for country: India

Publisher ID: 20 | Name: Tech Bharat Pub | City: Pune | Country: India
Publisher ID: 40 | Name: Vidya Prakashan | City: Ahmedabad | Country: India


OUTPUT 2:

Enter value for country: USA

Publisher ID: 30 | Name: McGraw Hill | City: New York | Country: USA


OUTPUT 3:

Enter value for country: Japan

No publisher found in Japan
*/
