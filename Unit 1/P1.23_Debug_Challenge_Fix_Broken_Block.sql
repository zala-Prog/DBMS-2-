SET SERVEROUTPUT ON;
DECLARE
  -- Bug 1 fixed: := is used instead of = for assignment.
  -- Bug 2 fixed: VARCHAR2(50) is large enough for the full name.
  v_name VARCHAR2(50) := 'Zala jyotindrasinh.M';
  -- Bug 3 fixed: a CONSTANT must be initialized when declared.
  c_bonus_rate CONSTANT NUMBER := 0.10;
  v_sal NUMBER := 36 * 1000 + 20000;
  v_fname employees.first_name%TYPE;
BEGIN
  -- Bug 4 fixed: declaration statements are terminated with semicolons.
  -- Bug 5 fixed: SELECT in PL/SQL requires an INTO clause.
  SELECT first_name INTO v_fname FROM employees WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname);
  DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_sal * c_bonus_rate);
END;
/
