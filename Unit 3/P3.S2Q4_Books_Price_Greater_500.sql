SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT book_id,title,price FROM book WHERE price>500; BEGIN FOR r IN c LOOP DBMS_OUTPUT.PUT_LINE(c%ROWCOUNT||'. '||r.book_id||' - '||r.title||' - Rs.'||r.price); END LOOP; END;
/