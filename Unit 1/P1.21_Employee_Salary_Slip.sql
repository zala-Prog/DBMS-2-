SET SERVEROUTPUT ON;
DECLARE
  v_emp employees%ROWTYPE;
  v_id NUMBER := 100 + MOD(36, 20);
  v_da NUMBER;
  v_hra NUMBER;
  v_pf NUMBER;
  v_net NUMBER;
BEGIN
  SELECT * INTO v_emp FROM employees WHERE employee_id = v_id;
  v_da := v_emp.salary * 0.40;
  v_hra := v_emp.salary * 0.20;
  v_pf := v_emp.salary * 0.12;
  v_net := v_emp.salary + v_da + v_hra - v_pf;
  DBMS_OUTPUT.PUT_LINE('SALARY SLIP - ' || TO_CHAR(SYSDATE, 'Month YYYY'));
  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp.first_name || ' ' || v_emp.last_name || ' ID: ' || v_emp.employee_id);
  DBMS_OUTPUT.PUT_LINE('Job: ' || v_emp.job_id);
  DBMS_OUTPUT.PUT_LINE(LPAD('Basic: ', 20) || TO_CHAR(v_emp.salary, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE(LPAD('DA: ', 20) || TO_CHAR(v_da, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE(LPAD('HRA: ', 20) || TO_CHAR(v_hra, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE(LPAD('PF: ', 20) || TO_CHAR(v_pf, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE(LPAD('Net Pay: ', 20) || TO_CHAR(v_net, '99,99,999.99'));
END;
/
