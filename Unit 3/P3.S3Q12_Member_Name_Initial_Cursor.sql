SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_letter VARCHAR2) IS SELECT member_id,member_name FROM lib_member WHERE UPPER(member_name) LIKE UPPER(p_letter)||'%'; v_letter VARCHAR2(1):='R'; BEGIN FOR r IN c(v_letter) LOOP DBMS_OUTPUT.PUT_LINE(r.member_id||' - '||r.member_name); END LOOP; END;
/