SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_cat VARCHAR2) IS SELECT title,price FROM book WHERE category=p_cat FOR UPDATE OF price; old_price NUMBER; BEGIN FOR r IN c('Database') LOOP old_price:=r.price; UPDATE book SET price=price*1.10 WHERE CURRENT OF c; DBMS_OUTPUT.PUT_LINE(r.title||': Rs.'||old_price||' -> Rs.'||ROUND(old_price*1.10,2)); END LOOP; COMMIT; END;
/