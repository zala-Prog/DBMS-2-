SET SERVEROUTPUT ON;
DECLARE
  monthly_salary NUMBER:=50000; existing_emi NUMBER:=5000; loan_amount NUMBER:=1000000; annual_rate NUMBER:=8; tenure_months NUMBER:=60; r NUMBER; emi NUMBER; foir NUMBER; approved NUMBER; decision VARCHAR2(20);
  FUNCTION calc_emi(p NUMBER) RETURN NUMBER IS m NUMBER:=annual_rate/12/100; BEGIN RETURN p*m*POWER(1+m,tenure_months)/(POWER(1+m,tenure_months)-1); END;
BEGIN
  r:=annual_rate/12/100; foir:=monthly_salary*.40; emi:=calc_emi(loan_amount); approved:=loan_amount;
  IF monthly_salary<25000 THEN decision:='REJECTED'; approved:=0;
  ELSIF loan_amount>monthly_salary*60 THEN decision:='REJECTED'; approved:=monthly_salary*60;
  ELSE WHILE calc_emi(approved)+existing_emi>foir AND approved>0 LOOP approved:=approved-10000; END LOOP; IF approved=loan_amount THEN decision:='APPROVED'; ELSE decision:='CONDITIONAL'; END IF; END IF;
  DBMS_OUTPUT.PUT_LINE('Salary: Rs.'||monthly_salary); DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs.'||existing_emi); DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs.'||loan_amount); DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs.'||ROUND(emi)); DBMS_OUTPUT.PUT_LINE('FOIR Limit: Rs.'||ROUND(foir)); DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs.'||approved); DBMS_OUTPUT.PUT_LINE('Decision: '||decision); DBMS_OUTPUT.PUT_LINE('Monthly Cost: Existing EMI Rs.'||existing_emi||' + New EMI Rs.'||ROUND(calc_emi(approved)));
END;
/