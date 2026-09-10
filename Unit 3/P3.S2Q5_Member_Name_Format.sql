SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT member_name,course,semester FROM lib_member; n NUMBER:=0; BEGIN FOR r IN c LOOP n:=n+1; DBMS_OUTPUT.PUT_LINE(n||'. '||UPPER(r.member_name)||' ('||r.course||' - Sem '||r.semester||')'); END LOOP; END;
/