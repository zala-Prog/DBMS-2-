SET SERVEROUTPUT ON;
DECLARE
  v_qty NUMBER := MOD(36, 5) + 2;
  v_price NUMBER := 36 * 100 + 400;
  v_coupon NUMBER;
  v_gross NUMBER;
  v_disc NUMBER;
  v_taxable NUMBER;
  v_cgst NUMBER;
  v_total NUMBER;
BEGIN
  FOR i IN 1..2 LOOP
    IF i = 1 THEN v_coupon := NULL; ELSE v_coupon := 10; END IF;
    v_gross := v_qty * v_price;
    v_disc := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_disc;
    v_cgst := v_taxable * 9 / 100;
    v_total := ROUND(v_taxable + v_cgst * 2);
    DBMS_OUTPUT.PUT_LINE('--- KIRANA BILL ---');
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '%', 'No coupon'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || v_gross);
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || v_disc);
    DBMS_OUTPUT.PUT_LINE('CGST: Rs.' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST: Rs.' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs.' || v_total);
  END LOOP;
END;
/
