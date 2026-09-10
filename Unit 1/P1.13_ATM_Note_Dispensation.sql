SET SERVEROUTPUT ON;
DECLARE
  v_amt NUMBER := 36 * 137 + 1000;
  n500 NUMBER;
  n200 NUMBER;
  n100 NUMBER;
  rem NUMBER;
BEGIN
  n500 := TRUNC(v_amt / 500);
  rem := MOD(v_amt, 500);
  n200 := TRUNC(rem / 200);
  rem := MOD(rem, 200);
  n100 := TRUNC(rem / 100);
  rem := MOD(rem, 100);
  DBMS_OUTPUT.PUT_LINE('Amount: ' || v_amt);
  DBMS_OUTPUT.PUT_LINE('500 notes: ' || n500);
  DBMS_OUTPUT.PUT_LINE('200 notes: ' || n200);
  DBMS_OUTPUT.PUT_LINE('100 notes: ' || n100);
  DBMS_OUTPUT.PUT_LINE('Undispensed: ' || rem);
END;
/
