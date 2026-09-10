SET SERVEROUTPUT ON;
DECLARE
  c_gst CONSTANT NUMBER := 18;
  v_plan NUMBER;
  v_gst NUMBER;
  v_total NUMBER;
BEGIN
  v_plan := CASE MOD(36, 4) + 1
              WHEN 1 THEN 199 WHEN 2 THEN 299 WHEN 3 THEN 399 ELSE 599
            END;
  v_gst := v_plan * c_gst / 100;
  v_total := v_plan + v_gst;
  DBMS_OUTPUT.PUT_LINE(RPAD('Plan:', 15) || TO_CHAR(v_plan, '99,999.99'));
  DBMS_OUTPUT.PUT_LINE(RPAD('GST @18%:', 15) || TO_CHAR(v_gst, '99,999.99'));
  DBMS_OUTPUT.PUT_LINE(RPAD('Total:', 15) || TO_CHAR(v_total, '99,999.99'));
  DBMS_OUTPUT.PUT_LINE('Validity: ' || TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY'));
END;
/
