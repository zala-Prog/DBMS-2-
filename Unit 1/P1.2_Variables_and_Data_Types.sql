SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(50) := 'Zala jyotindrasinh.M';
  v_marks NUMBER(5,2) := 420;
  v_percentage NUMBER(5,2);
  v_dob DATE := DATE '2007-06-06';
  v_passed BOOLEAN;
BEGIN
  v_percentage := ROUND((v_marks / 500) * 100, 2);
  v_passed := v_percentage >= 40;
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
  DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
  DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
  IF v_passed THEN DBMS_OUTPUT.PUT_LINE('PASS'); ELSE DBMS_OUTPUT.PUT_LINE('FAIL'); END IF;
END;
/
