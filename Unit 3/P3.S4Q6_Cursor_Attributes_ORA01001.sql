SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('%FOUND, %NOTFOUND, %ROWCOUNT and %ISOPEN require a valid open explicit cursor; using them on a never-opened cursor raises ORA-01001.');
  DBMS_OUTPUT.PUT_LINE('Exception: %ISOPEN on a cursor that has never been opened returns FALSE rather than raising ORA-01001.');
END;
/