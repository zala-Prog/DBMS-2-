SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT title,price,stock FROM book; total NUMBER:=0; val NUMBER; BEGIN FOR r IN c LOOP val:=r.price*r.stock; total:=total+val; DBMS_OUTPUT.PUT_LINE(r.title||' = Rs.'||val); END LOOP; DBMS_OUTPUT.PUT_LINE('Grand Total = Rs.'||total); END;
/