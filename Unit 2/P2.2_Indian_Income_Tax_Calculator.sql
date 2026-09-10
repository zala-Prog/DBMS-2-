SET SERVEROUTPUT ON;
DECLARE
  gross_salary NUMBER:=1000000; taxable NUMBER; tax NUMBER:=0; tds NUMBER; take_home NUMBER; slab_tax NUMBER;
BEGIN
  taxable:=GREATEST(gross_salary-75000,0);
  tax:=CASE WHEN taxable<=300000 THEN 0 WHEN taxable<=700000 THEN (taxable-300000)*0.05 WHEN taxable<=1000000 THEN 20000+(taxable-700000)*0.10 WHEN taxable<=1200000 THEN 50000+(taxable-1000000)*0.15 WHEN taxable<=1500000 THEN 80000+(taxable-1200000)*0.20 ELSE 140000+(taxable-1500000)*0.30 END;
  tds:=tax/12; take_home:=gross_salary/12-tds;
  DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs.'||gross_salary); DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs.75000'); DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs.'||taxable); DBMS_OUTPUT.PUT_LINE('Total Tax: Rs.'||tax); DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs.'||ROUND(tds)); DBMS_OUTPUT.PUT_LINE('Take-home Monthly: Rs.'||ROUND(take_home)); IF tax=0 THEN DBMS_OUTPUT.PUT_LINE('No tax this year — save more with PPF/ELSS!'); END IF;
END;
/