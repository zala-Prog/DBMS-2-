SET SERVEROUTPUT ON;
DECLARE
  v_dept NUMBER := (MOD(36, 6) + 1) * 10;
  v_cnt NUMBER;
  v_avg NUMBER;
  v_max NUMBER;
BEGIN
  SELECT COUNT(*), ROUND(AVG(salary), 2), MAX(salary)
  INTO v_cnt, v_avg, v_max
  FROM employees WHERE department_id = v_dept;
  DBMS_OUTPUT.PUT_LINE('Department: ' || v_dept);
  DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_cnt);
  DBMS_OUTPUT.PUT_LINE('Average Salary: ' || v_avg);
  DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || v_max);
  -- COUNT(*) always returns one aggregate row, so NO_DATA_FOUND is not raised.
END;
/
