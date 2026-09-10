SET SERVEROUTPUT ON;
DECLARE
  v_celsius NUMBER := MOD(36, 20) + 25;
  v_fahrenheit NUMBER;
  v_kelvin NUMBER;
  v_f NUMBER := 98.6;
  v_c2 NUMBER;
BEGIN
  v_fahrenheit := ROUND(v_celsius * 9 / 5 + 32, 1);
  v_kelvin := v_celsius + 273.15;
  v_c2 := ROUND((v_f - 32) * 5 / 9, 1);
  DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius);
  DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_fahrenheit);
  DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_kelvin);
  DBMS_OUTPUT.PUT_LINE('98.6 F to Celsius: ' || v_c2);
END;
/
