SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT b.title,p.pub_name,p.country FROM book b JOIN publisher p ON b.pub_id=p.pub_id; BEGIN FOR r IN c LOOP DBMS_OUTPUT.PUT_LINE(r.title||' - '||r.pub_name||' - '||r.country); END LOOP; END;
/