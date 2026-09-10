SET SERVEROUTPUT ON;
DECLARE
  v_roll NUMBER := 36;
  v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Name: Zala jyotindrasinh.M');
  DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll);
  DBMS_OUTPUT.PUT_LINE(v_message);
  DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || (MOD(v_roll, 7) + 1));
END;
/
