
/*
ANSWER:

If a parameterised cursor is declared without a DEFAULT value,
for example:

CURSOR c_book(p_cat VARCHAR2) IS
    SELECT title
    FROM book
    WHERE category = p_cat;

and we write:

OPEN c_book;

Oracle raises a compilation error because the required cursor
parameter has not been supplied.

The error is:
PLS-00306: wrong number or types of arguments in call to 'C_BOOK'

This happens when the PL/SQL block is compiled, not during execution.

If the cursor parameter has a DEFAULT value:

CURSOR c_book(p_cat VARCHAR2 DEFAULT 'Database') IS
    SELECT title
    FROM book
    WHERE category = p_cat;

then:

OPEN c_book;

is valid. Oracle automatically uses 'Database' as the parameter
value.

Therefore, a DEFAULT value makes the parameter optional.
*/
