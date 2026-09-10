SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT title FROM book WHERE price>600; v_title book.title%TYPE;
BEGIN OPEN c; LOOP FETCH c INTO v_title; EXIT WHEN c%NOTFOUND; DBMS_OUTPUT.PUT_LINE(c%ROWCOUNT||' : '||v_title); END LOOP; DBMS_OUTPUT.PUT_LINE('Final ROWCOUNT = '||c%ROWCOUNT); CLOSE c; END;
/
-- There are 7 qualifying books; FETCH that finds no row increments ROWCOUNT, so final ROWCOUNT is 8 while the last displayed row is 7.