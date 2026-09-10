SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Implicit: declared/opened/closed by Oracle; not directly reusable with values; best for single SQL statements.');
  DBMS_OUTPUT.PUT_LINE('Explicit simple: declared by programmer, opened/fetched/closed by programmer; fixed query; best for controlled row-by-row processing.');
  DBMS_OUTPUT.PUT_LINE('Parameterized: declared by programmer, opened/fetched/closed by programmer or FOR loop; reusable with different values; best for repeated queries with changing inputs.');
END;
/