SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT book_id,title,stock FROM book WHERE category='Database' FOR UPDATE OF stock; old_stock NUMBER; BEGIN FOR r IN c LOOP old_stock:=r.stock; UPDATE book SET stock=stock+10 WHERE CURRENT OF c; DBMS_OUTPUT.PUT_LINE(r.title||': '||old_stock||' -> '||(old_stock+10)); END LOOP; COMMIT; END;
/