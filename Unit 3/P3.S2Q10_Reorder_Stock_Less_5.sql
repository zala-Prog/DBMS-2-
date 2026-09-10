SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT book_id,title,stock FROM book WHERE stock<5; n NUMBER:=0; BEGIN FOR r IN c LOOP n:=n+1; DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title||' - Stock '||r.stock||' REORDER'); END LOOP; DBMS_OUTPUT.PUT_LINE('Books to reorder: '||n); END;
/