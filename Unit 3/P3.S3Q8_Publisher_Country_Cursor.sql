SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_country VARCHAR2) IS SELECT pub_name,city FROM publisher WHERE UPPER(country)=UPPER(p_country); found BOOLEAN:=FALSE; country_name VARCHAR2(30):='India'; BEGIN FOR r IN c(country_name) LOOP found:=TRUE; DBMS_OUTPUT.PUT_LINE(r.pub_name||' - '||r.city); END LOOP; IF NOT found THEN DBMS_OUTPUT.PUT_LINE('No publisher found in '||country_name); END IF; END;
/ 
-- A cursor FOR loop closes the cursor automatically, so its cursor attributes cannot be checked after the loop.