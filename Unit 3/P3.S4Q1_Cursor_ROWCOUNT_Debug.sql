SET SERVEROUTPUT ON;
DECLARE CURSOR c_book(p_cat VARCHAR2) IS SELECT book_id,title FROM book WHERE category=p_cat;
BEGIN FOR r IN c_book('Database') LOOP DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title); END LOOP;
-- Cause: c_book%ROWCOUNT is invalid after a cursor FOR loop because the loop manages and closes the cursor. The IF line raises ORA-01001. Correct approach: count rows with a BOOLEAN/number flag inside the loop.
END;
/