SET SERVEROUTPUT ON;
DECLARE
  attendance_pct NUMBER:=51; theory_marks NUMBER:=31; practical_marks NUMBER:=13; assignment_marks NUMBER:=8; total NUMBER; pct NUMBER; grade VARCHAR2(3); result VARCHAR2(30); remark VARCHAR2(60);
BEGIN
  IF attendance_pct<40 THEN result:='DETAINED'; remark:='Attendance below minimum';
  ELSIF theory_marks<28 THEN result:='FAIL in Theory'; remark:='Improve theory marks';
  ELSIF practical_marks<12 THEN result:='FAIL in Practical'; remark:='Improve practical marks';
  ELSE total:=theory_marks+practical_marks+LEAST(assignment_marks,10); pct:=total/120*100; grade:=CASE WHEN pct>=75 THEN 'A+' WHEN pct>=60 THEN 'B' WHEN pct>=50 THEN 'C' WHEN pct>=40 THEN 'D' ELSE 'F' END; result:='PASS'; remark:='Promoted'; END IF;
  DBMS_OUTPUT.PUT_LINE('Attendance: '||attendance_pct||'%'); DBMS_OUTPUT.PUT_LINE('Theory: '||theory_marks||'/70'); DBMS_OUTPUT.PUT_LINE('Practical: '||practical_marks||'/30'); DBMS_OUTPUT.PUT_LINE('Assignment: '||assignment_marks||' (counted '||LEAST(assignment_marks,10)||')'); IF total IS NOT NULL THEN DBMS_OUTPUT.PUT_LINE('Total: '||total); DBMS_OUTPUT.PUT_LINE('Percentage: '||ROUND(pct,2)||'%'); DBMS_OUTPUT.PUT_LINE('Grade: '||grade); END IF; DBMS_OUTPUT.PUT_LINE('Result: '||result); DBMS_OUTPUT.PUT_LINE('Remark: '||remark);
END;
/