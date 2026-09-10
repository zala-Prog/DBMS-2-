SET SERVEROUTPUT ON;
DECLARE
  v_roll NUMBER := 36;
  v_name VARCHAR2(50) := 'Zala jyotindrasinh.M';
  v_dob DATE := DATE '2007-06-06';
  v_pnr VARCHAR2(30);
  v_jdate DATE;
  v_fare NUMBER;
  v_age NUMBER;
BEGIN
  v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');
  v_jdate := SYSDATE + MOD(v_roll, 30) + 1;
  v_fare := v_roll * 50 + 200;
  v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
  IF v_age >= 60 THEN v_fare := v_fare * 0.60; END IF;
  DBMS_OUTPUT.PUT_LINE('PNR: ' || v_pnr);
  DBMS_OUTPUT.PUT_LINE('Passenger: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Journey: ' || TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
  DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
  DBMS_OUTPUT.PUT_LINE('Fare: Rs.' || v_fare);
END;
/
