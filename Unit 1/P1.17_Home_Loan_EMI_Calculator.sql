SET SERVEROUTPUT ON;
DECLARE
  v_p NUMBER := 36 * 10000 + 50000;
  v_annual_rate NUMBER := 9;
  v_years NUMBER := 5;
  v_r NUMBER;
  v_n NUMBER;
  v_emi NUMBER;
  v_total NUMBER;
BEGIN
  v_r := v_annual_rate / 12 / 100;
  v_n := v_years * 12;
  v_emi := ROUND(v_p * v_r * POWER(1 + v_r, v_n) / (POWER(1 + v_r, v_n) - 1), 2);
  v_total := v_emi * v_n;
  DBMS_OUTPUT.PUT_LINE('Principal: Rs.' || TO_CHAR(v_p, '99,99,999'));
  DBMS_OUTPUT.PUT_LINE('EMI: Rs.' || TO_CHAR(v_emi, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Total Payment: Rs.' || TO_CHAR(v_total, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Total Interest: Rs.' || TO_CHAR(v_total - v_p, '99,99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Interest % of payment: ' || ROUND((v_total-v_p)/v_total*100,2) || '%');
END;
/
