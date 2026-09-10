SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT pub_id,pub_name,city,country FROM publisher; r c%ROWTYPE;
BEGIN OPEN c; LOOP FETCH c INTO r; EXIT WHEN c%NOTFOUND; DBMS_OUTPUT.PUT_LINE(r.pub_name||' - '||r.city||' - '||r.country); END LOOP; CLOSE c; END;
/