SET SERVEROUTPUT ON;
DECLARE
  v_raw VARCHAR2(100) := '  zala  JYOTINDRASINH.M  ';
  v_clean VARCHAR2(100);
  v_first VARCHAR2(50);
  v_last VARCHAR2(50);
  v_email VARCHAR2(120);
BEGIN
  v_clean := TRIM(v_raw);
  v_clean := REPLACE(REPLACE(v_clean, '  ', ' '), '  ', ' ');
  v_clean := INITCAP(v_clean);
  v_first := SUBSTR(v_clean, 1, INSTR(v_clean, ' ') - 1);
  v_last := SUBSTR(v_clean, INSTR(v_clean, ' ') + 1);
  v_email := LOWER(REPLACE(v_first || '.' || v_last, ' ', '.') || '@ljku.edu.in');
  DBMS_OUTPUT.PUT_LINE('Cleaned: ' || v_clean);
  DBMS_OUTPUT.PUT_LINE('First: ' || v_first);
  DBMS_OUTPUT.PUT_LINE('Last: ' || v_last);
  DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
  DBMS_OUTPUT.PUT_LINE('Length before: ' || LENGTH(v_raw));
  DBMS_OUTPUT.PUT_LINE('Length after: ' || LENGTH(v_clean));
  -- REPLACE is applied twice because multiple adjacent spaces may require more than one pass.
END;
/
