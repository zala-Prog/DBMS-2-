SET SERVEROUTPUT ON;
DECLARE
  balance NUMBER:=36*500+5000; v_choice NUMBER:=1; withdrawal NUMBER; txns NUMBER:=0; total_withdrawn NUMBER:=0;
BEGIN
  FOR i IN 1..4 LOOP
    EXIT WHEN v_choice=3 OR balance=0;
    withdrawal:=CASE i WHEN 1 THEN 500 WHEN 2 THEN 1000 WHEN 3 THEN 500 ELSE 300 END;
    IF withdrawal<=0 THEN DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0');
    ELSIF MOD(withdrawal,100)<>0 THEN DBMS_OUTPUT.PUT_LINE('Error: Amount must be a multiple of 100');
    ELSIF withdrawal>10000 THEN DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000');
    ELSIF withdrawal>balance THEN DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance');
    ELSE balance:=balance-withdrawal; txns:=txns+1; total_withdrawn:=total_withdrawn+withdrawal; DBMS_OUTPUT.PUT_LINE('Receipt: Withdrawn Rs.'||withdrawal||', Balance Rs.'||balance); END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Transactions Done: '||txns); DBMS_OUTPUT.PUT_LINE('Total Withdrawn: Rs.'||total_withdrawn); DBMS_OUTPUT.PUT_LINE('Closing Balance: Rs.'||balance);
END;
/