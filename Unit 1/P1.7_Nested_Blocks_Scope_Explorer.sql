SET SERVEROUTPUT ON;
<<outer>>
DECLARE
  v_city VARCHAR2(30) := 'Gujarat';
  v_num NUMBER := 100;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Outer: ' || v_city || ' ' || v_num);
  <<middle>>
  DECLARE
    v_city VARCHAR2(30) := 'Ahmedabad';
    v_num NUMBER := 200;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Middle: ' || v_city || ' ' || v_num);
    <<inner>>
    DECLARE
      v_num NUMBER := 300;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Inner: ' || middle.v_city || ' ' || v_num);
      DBMS_OUTPUT.PUT_LINE('Outer city from inner: ' || outer.v_city);
    END;
  END;
  DBMS_OUTPUT.PUT_LINE('After middle: ' || v_city || ' ' || v_num);
END;
/
