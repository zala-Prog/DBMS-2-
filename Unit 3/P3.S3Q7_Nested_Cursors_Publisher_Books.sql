SET SERVEROUTPUT ON;
DECLARE CURSOR cp IS SELECT pub_id,pub_name FROM publisher; CURSOR cb(p_id NUMBER) IS SELECT title FROM book WHERE pub_id=p_id;
BEGIN FOR p IN cp LOOP DBMS_OUTPUT.PUT_LINE(p.pub_name); FOR b IN cb(p.pub_id) LOOP DBMS_OUTPUT.PUT_LINE('  '||b.title); END LOOP; END LOOP; END;
/