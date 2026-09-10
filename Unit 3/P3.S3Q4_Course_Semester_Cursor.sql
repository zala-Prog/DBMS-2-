SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_course VARCHAR2,p_sem NUMBER) IS SELECT member_name,join_date FROM lib_member WHERE UPPER(course)=UPPER(p_course) AND semester=p_sem; BEGIN FOR r IN c('MCA',2) LOOP DBMS_OUTPUT.PUT_LINE(r.member_name||' - '||TO_CHAR(r.join_date,'DD-MON-YYYY')); END LOOP; END;
/