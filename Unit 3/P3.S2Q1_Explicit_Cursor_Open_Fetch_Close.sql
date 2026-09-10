SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT book_id,title,price FROM book; v_id book.book_id%TYPE; v_title book.title%TYPE; v_price book.price%TYPE;
BEGIN OPEN c; LOOP FETCH c INTO v_id,v_title,v_price; EXIT WHEN c%NOTFOUND; DBMS_OUTPUT.PUT_LINE(v_id||' - '||v_title||' - Rs.'||v_price); END LOOP; CLOSE c; END;
/