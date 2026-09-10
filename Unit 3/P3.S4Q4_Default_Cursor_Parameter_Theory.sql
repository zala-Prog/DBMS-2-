SET SERVEROUTPUT ON;
DECLARE CURSOR c_book(p_cat VARCHAR2) IS SELECT title FROM book WHERE category=p_cat;
BEGIN
  -- OPEN c_book; causes PLS-00306: wrong number or types of arguments in call to C_BOOK.
  -- A parameter with DEFAULT, e.g. p_cat VARCHAR2 DEFAULT 'Database', allows OPEN c_book without an argument.
  DBMS_OUTPUT.PUT_LINE('Parameterized cursor requires its argument unless a DEFAULT value is declared.');
END;
/