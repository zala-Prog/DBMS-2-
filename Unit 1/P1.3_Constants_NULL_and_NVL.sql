SET SERVEROUTPUT ON;
DECLARE
  c_gst_rate CONSTANT NUMBER := 18;
  v_base_price NUMBER := 36 * 500 + 1000;
  v_city VARCHAR2(50) := NULL;
  v_cgst NUMBER;
  v_sgst NUMBER;
  v_total NUMBER;
BEGIN
  v_cgst := v_base_price * 9 / 100;
  v_sgst := v_base_price * 9 / 100;
  v_total := v_base_price + v_cgst + v_sgst;
  DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
  DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs.' || v_cgst);
  DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs.' || v_sgst);
  DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);
  DBMS_OUTPUT.PUT_LINE('NVL City: ' || NVL(v_city, 'Ahmedabad'));
  DBMS_OUTPUT.PUT_LINE(NVL2(v_city, 'City Known: ' || v_city, 'City Unknown'));
END;
/
