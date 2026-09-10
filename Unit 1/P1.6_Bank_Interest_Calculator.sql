SET SERVEROUTPUT ON;
DECLARE
  v_p NUMBER := 36 * 1000;
  v_r NUMBER := 4.0;
  v_t NUMBER := 3;
  v_si NUMBER;
  v_ci NUMBER;
  v_diff_pct NUMBER;
BEGIN
  v_si := v_p * v_r * v_t / 100;
  v_ci := v_p * POWER(1 + v_r / 100, v_t) - v_p;
  v_diff_pct := (v_ci - v_si) / v_si * 100;
  DBMS_OUTPUT.PUT_LINE('Principal: Rs.' || TO_CHAR(v_p, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Simple Interest: Rs.' || TO_CHAR(v_si, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs.' || TO_CHAR(v_ci, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Difference: Rs.' || TO_CHAR(v_ci - v_si, '99,99,999.99'));
  IF v_ci > v_si * 1.10 THEN DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.'); END IF;
END;
/
