SET SERVEROUTPUT ON;
DECLARE
  m1 NUMBER:=43; m2 NUMBER:=53; m3 NUMBER:=63; m4 NUMBER:=73; m5 NUMBER:=83;
  total NUMBER:=m1+m2+m3+m4+m5; pct NUMBER:=total/5; grade VARCHAR2(5); class_name VARCHAR2(20); result VARCHAR2(20);
BEGIN
  IF pct>=90 THEN grade:='A+'; ELSIF pct>=80 THEN grade:='A'; ELSIF pct>=70 THEN grade:='B'; ELSIF pct>=60 THEN grade:='C'; ELSIF pct>=50 THEN grade:='D'; ELSE grade:='FAIL'; END IF;
  IF m1<35 OR m2<35 OR m3<35 OR m4<35 OR m5<35 THEN result:='DETAINED';
    IF m1<35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: 1'); END IF;
    IF m2<35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: 2'); END IF;
    IF m3<35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: 3'); END IF;
    IF m4<35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: 4'); END IF;
    IF m5<35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: 5'); END IF;
  ELSE result:='PASS'; IF pct>=75 THEN class_name:='Distinction'; ELSIF pct>=60 THEN class_name:='First'; ELSIF pct>=50 THEN class_name:='Second'; ELSE class_name:='Pass'; END IF; END IF;
  DBMS_OUTPUT.PUT_LINE('Roll No: 36'); DBMS_OUTPUT.PUT_LINE('Marks: '||m1||', '||m2||', '||m3||', '||m4||', '||m5); DBMS_OUTPUT.PUT_LINE('Total: '||total); DBMS_OUTPUT.PUT_LINE('Percentage: '||pct||'%'); DBMS_OUTPUT.PUT_LINE('Grade: '||grade); DBMS_OUTPUT.PUT_LINE('Result: '||result); IF class_name IS NOT NULL THEN DBMS_OUTPUT.PUT_LINE('Class: '||class_name); END IF;
END;
/