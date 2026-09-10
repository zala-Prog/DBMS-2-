-- DBMS 2 - PL/SQL Unit 1 - P1.1 to P1.23
-- Student: Zala jyotindrasinh.M | Roll No: 36 | Division: D
SET SERVEROUTPUT ON;

-- P1.1
DECLARE v_roll NUMBER:=36; v_message VARCHAR2(100):='Welcome to PL/SQL!';
BEGIN DBMS_OUTPUT.PUT_LINE('Name: Zala jyotindrasinh.M'); DBMS_OUTPUT.PUT_LINE('Roll No: '||v_roll); DBMS_OUTPUT.PUT_LINE(v_message); DBMS_OUTPUT.PUT_LINE('Lucky: '||(MOD(v_roll,7)+1)); END;
/
-- P1.2
DECLARE v_name VARCHAR2(50):='Zala jyotindrasinh.M'; v_marks NUMBER(5,2):=420; v_percentage NUMBER(5,2); v_passed BOOLEAN; BEGIN v_percentage:=ROUND(v_marks/500*100,2); v_passed:=v_percentage>=40; DBMS_OUTPUT.PUT_LINE(v_name||' | Marks:'||v_marks||' | %:'||v_percentage); IF v_passed THEN DBMS_OUTPUT.PUT_LINE('PASS'); ELSE DBMS_OUTPUT.PUT_LINE('FAIL'); END IF; END;
/
-- P1.3
DECLARE c_gst CONSTANT NUMBER:=18; v_base NUMBER:=36*500+1000; v_city VARCHAR2(50):=NULL; v_cgst NUMBER; BEGIN v_cgst:=v_base*9/100; DBMS_OUTPUT.PUT_LINE('Base: '||v_base); DBMS_OUTPUT.PUT_LINE('CGST: '||v_cgst); DBMS_OUTPUT.PUT_LINE('SGST: '||v_cgst); DBMS_OUTPUT.PUT_LINE('Total: '||(v_base+2*v_cgst)); DBMS_OUTPUT.PUT_LINE('NVL city: '||NVL(v_city,'Ahmedabad')); DBMS_OUTPUT.PUT_LINE(NVL2(v_city,'City Known: '||v_city,'City Unknown')); END;
/
-- P1.4
DECLARE v_fname employees.first_name%TYPE; v_sal employees.salary%TYPE; v_id NUMBER:=100+MOD(36,7); BEGIN SELECT first_name,salary INTO v_fname,v_sal FROM employees WHERE employee_id=v_id; DBMS_OUTPUT.PUT_LINE('Employee: '||v_fname||' earns Rs.'||v_sal||' per month.'); EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not found - check the ID.'); END;
/
-- P1.5
DECLARE v_emp employees%ROWTYPE; v_id NUMBER:=100+MOD(36,9)+1; v_yrs NUMBER; BEGIN SELECT * INTO v_emp FROM employees WHERE employee_id=v_id; v_yrs:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_emp.hire_date)/12); DBMS_OUTPUT.PUT_LINE('Name: '||v_emp.first_name||' '||v_emp.last_name); DBMS_OUTPUT.PUT_LINE('Job: '||v_emp.job_id); DBMS_OUTPUT.PUT_LINE('Dept: '||v_emp.department_id); DBMS_OUTPUT.PUT_LINE('Salary: '||TO_CHAR(v_emp.salary,'Rs.99,999')); DBMS_OUTPUT.PUT_LINE('Hire Date: '||TO_CHAR(v_emp.hire_date,'DD-MON-YYYY')); DBMS_OUTPUT.PUT_LINE('Experience: '||v_yrs||' years'); IF v_yrs>10 THEN DBMS_OUTPUT.PUT_LINE('Senior Employee'); END IF; END;
/
-- P1.6
DECLARE v_p NUMBER:=36000; v_r NUMBER:=7; v_t NUMBER:=3; v_si NUMBER; v_ci NUMBER; BEGIN v_si:=v_p*v_r*v_t/100; v_ci:=v_p*POWER(1+v_r/100,v_t)-v_p; DBMS_OUTPUT.PUT_LINE('SI: '||TO_CHAR(v_si,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE('CI: '||TO_CHAR(v_ci,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE('Difference: '||TO_CHAR(v_ci-v_si,'99,99,999.99')); IF v_ci>v_si*1.10 THEN DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.'); END IF; END;
/
-- P1.7
<<outer>> DECLARE v_city VARCHAR2(30):='Gujarat'; v_num NUMBER:=100; BEGIN DBMS_OUTPUT.PUT_LINE(v_city||' '||v_num); <<middle>> DECLARE v_city VARCHAR2(30):='Ahmedabad'; v_num NUMBER:=200; BEGIN DBMS_OUTPUT.PUT_LINE(v_city||' '||v_num); <<inner>> DECLARE v_num NUMBER:=300; BEGIN DBMS_OUTPUT.PUT_LINE(middle.v_city||' '||v_num); DBMS_OUTPUT.PUT_LINE('Outer city: '||outer.v_city); END; END; DBMS_OUTPUT.PUT_LINE('After middle: '||v_city||' '||v_num); END;
/
-- P1.8
DECLARE v_name VARCHAR2(50):='Zala jyotindrasinh.M'; v_roll NUMBER:=36; v_dob DATE:=DATE '2007-06-06'; v_upper VARCHAR2(50); v_first VARCHAR2(30); v_id VARCHAR2(30); v_age NUMBER; BEGIN v_upper:=UPPER(v_name); v_first:=SUBSTR(v_upper,1,INSTR(v_upper,' ')-1); v_id:='LJICA'||TO_CHAR(v_dob,'YYYY')||LPAD(v_roll,3,'0'); v_age:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_dob)/12); DBMS_OUTPUT.PUT_LINE(RPAD('LJICA STUDENT ID',30,'-')); DBMS_OUTPUT.PUT_LINE('Name: '||v_upper); DBMS_OUTPUT.PUT_LINE('First: '||v_first); DBMS_OUTPUT.PUT_LINE('ID: '||v_id); DBMS_OUTPUT.PUT_LINE('Age: '||v_age); END;
/
-- P1.9
DECLARE v_units NUMBER:=36*10+50; c_rate CONSTANT NUMBER:=5; c_fixed CONSTANT NUMBER:=70; v_energy NUMBER; BEGIN v_energy:=v_units*c_rate; DBMS_OUTPUT.PUT_LINE('Consumer: Zala jyotindrasinh.M'); DBMS_OUTPUT.PUT_LINE('Units: '||v_units); DBMS_OUTPUT.PUT_LINE('Energy: Rs.'||v_energy); DBMS_OUTPUT.PUT_LINE('Fixed: Rs.'||c_fixed); DBMS_OUTPUT.PUT_LINE('Total: Rs.'||(v_energy+c_fixed)); END;
/
-- P1.10
DECLARE v_c NUMBER:=MOD(36,20)+25; v_f NUMBER; v_k NUMBER; v_f2 NUMBER:=98.6; v_c2 NUMBER; BEGIN v_f:=ROUND(v_c*9/5+32,1); v_k:=v_c+273.15; v_c2:=ROUND((v_f2-32)*5/9,1); DBMS_OUTPUT.PUT_LINE('Celsius: '||v_c); DBMS_OUTPUT.PUT_LINE('Fahrenheit: '||v_f); DBMS_OUTPUT.PUT_LINE('Kelvin: '||v_k); DBMS_OUTPUT.PUT_LINE('98.6 F to C: '||v_c2); END;
/
-- P1.11
DECLARE v_n NUMBER:=MOD(36,12)+1; BEGIN DBMS_OUTPUT.PUT_LINE('Today: '||TO_CHAR(SYSDATE,'Day, DD "th" Month YYYY')); DBMS_OUTPUT.PUT_LINE('After months: '||TO_CHAR(ADD_MONTHS(SYSDATE,v_n),'DD-MON-YYYY')); DBMS_OUTPUT.PUT_LINE('Last day: '||TO_CHAR(LAST_DAY(SYSDATE),'DD-MON-YYYY')); DBMS_OUTPUT.PUT_LINE('Next Monday: '||TO_CHAR(NEXT_DAY(SYSDATE,'MONDAY'),'DD-MON-YYYY')); DBMS_OUTPUT.PUT_LINE('Days left: '||TRUNC(LAST_DAY(SYSDATE)-SYSDATE)); END;
/
-- P1.12
DECLARE v_m1 NUMBER:=MOD(36,30)+60; v_m2 NUMBER:=v_m1; v_m3 NUMBER:=v_m1; v_m4 NUMBER:=v_m1; v_m5 NUMBER:=NULL; v_total NUMBER; v_pct NUMBER; v_passed BOOLEAN; BEGIN v_total:=v_m1+v_m2+v_m3+v_m4+NVL(v_m5,0); v_pct:=ROUND(v_total/500*100,2); v_passed:=v_pct>=40; DBMS_OUTPUT.PUT_LINE('Total: '||v_total); DBMS_OUTPUT.PUT_LINE('Percentage: '||v_pct); IF v_passed THEN DBMS_OUTPUT.PUT_LINE('PASS'); ELSE DBMS_OUTPUT.PUT_LINE('FAIL'); END IF; END;
/
-- P1.13
DECLARE v_amt NUMBER:=36*137+1000; n500 NUMBER; n200 NUMBER; n100 NUMBER; rem NUMBER; BEGIN n500:=TRUNC(v_amt/500); rem:=MOD(v_amt,500); n200:=TRUNC(rem/200); rem:=MOD(rem,200); n100:=TRUNC(rem/100); rem:=MOD(rem,100); DBMS_OUTPUT.PUT_LINE('Amount: '||v_amt); DBMS_OUTPUT.PUT_LINE('500 notes: '||n500); DBMS_OUTPUT.PUT_LINE('200 notes: '||n200); DBMS_OUTPUT.PUT_LINE('100 notes: '||n100); DBMS_OUTPUT.PUT_LINE('Undispensed: '||rem); END;
/
-- P1.14
DECLARE c_gst CONSTANT NUMBER:=18; v_plan NUMBER; v_gst NUMBER; v_total NUMBER; BEGIN v_plan:=CASE MOD(36,4)+1 WHEN 1 THEN 199 WHEN 2 THEN 299 WHEN 3 THEN 399 ELSE 599 END; v_gst:=v_plan*c_gst/100; v_total:=v_plan+v_gst; DBMS_OUTPUT.PUT_LINE(RPAD('Plan:',15)||TO_CHAR(v_plan,'99,999.99')); DBMS_OUTPUT.PUT_LINE(RPAD('GST @18%:',15)||TO_CHAR(v_gst,'99,999.99')); DBMS_OUTPUT.PUT_LINE(RPAD('Total:',15)||TO_CHAR(v_total,'99,999.99')); DBMS_OUTPUT.PUT_LINE('Validity: '||TO_CHAR(SYSDATE+28,'DD-MON-YYYY')); END;
/
-- P1.15
DECLARE v_dept NUMBER:=(MOD(36,6)+1)*10; v_cnt NUMBER; v_avg NUMBER; v_max NUMBER; BEGIN SELECT COUNT(*),ROUND(AVG(salary),2),MAX(salary) INTO v_cnt,v_avg,v_max FROM employees WHERE department_id=v_dept; DBMS_OUTPUT.PUT_LINE('Department: '||v_dept); DBMS_OUTPUT.PUT_LINE('Count: '||v_cnt); DBMS_OUTPUT.PUT_LINE('Average: '||v_avg); DBMS_OUTPUT.PUT_LINE('Maximum: '||v_max); END;
/
-- P1.16
DECLARE v_id NUMBER:=(MOD(36+2,11)+1)*10; v_dname departments.department_name%TYPE; v_loc departments.location_id%TYPE; BEGIN SELECT department_name,location_id INTO v_dname,v_loc FROM departments WHERE department_id=v_id; DBMS_OUTPUT.PUT_LINE('Dept '||v_id||': '||v_dname||' at location '||v_loc); EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Department not found.'); END;
/
-- P1.17
DECLARE v_p NUMBER:=36*10000+50000; v_rate NUMBER:=9; v_years NUMBER:=5; v_r NUMBER; v_n NUMBER; v_emi NUMBER; v_total NUMBER; BEGIN v_r:=v_rate/12/100; v_n:=v_years*12; v_emi:=ROUND(v_p*v_r*POWER(1+v_r,v_n)/(POWER(1+v_r,v_n)-1),2); v_total:=v_emi*v_n; DBMS_OUTPUT.PUT_LINE('Principal: '||TO_CHAR(v_p,'99,99,999')); DBMS_OUTPUT.PUT_LINE('EMI: '||TO_CHAR(v_emi,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE('Total Payment: '||TO_CHAR(v_total,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE('Total Interest: '||TO_CHAR(v_total-v_p,'99,99,999.99')); END;
/
-- P1.18
DECLARE v_raw VARCHAR2(100):='  zala  JYOTINDRASINH.M  '; v_clean VARCHAR2(100); v_first VARCHAR2(50); v_last VARCHAR2(50); v_email VARCHAR2(120); BEGIN v_clean:=TRIM(v_raw); v_clean:=REPLACE(REPLACE(v_clean,'  ',' '),'  ',' '); v_clean:=INITCAP(v_clean); v_first:=SUBSTR(v_clean,1,INSTR(v_clean,' ')-1); v_last:=SUBSTR(v_clean,INSTR(v_clean,' ')+1); v_email:=LOWER(REPLACE(v_first||'.'||v_last,' ','.')||'@ljku.edu.in'); DBMS_OUTPUT.PUT_LINE('Cleaned: '||v_clean); DBMS_OUTPUT.PUT_LINE('First: '||v_first); DBMS_OUTPUT.PUT_LINE('Last: '||v_last); DBMS_OUTPUT.PUT_LINE('Email: '||v_email); DBMS_OUTPUT.PUT_LINE('Length before: '||LENGTH(v_raw)); DBMS_OUTPUT.PUT_LINE('Length after: '||LENGTH(v_clean)); END;
/
-- P1.19
<<bank>> DECLARE v_bank VARCHAR2(30):='LJ Bank'; v_total_deposit NUMBER:=0; BEGIN <<branch>> DECLARE v_branch VARCHAR2(30):='Ahmedabad'; v_dep NUMBER:=36*1000; BEGIN bank.v_total_deposit:=bank.v_total_deposit+v_dep; <<counter>> DECLARE v_token NUMBER:=1; BEGIN DBMS_OUTPUT.PUT_LINE(bank.v_bank||' | '||v_branch||' | Token '||v_token); END; END; DBMS_OUTPUT.PUT_LINE('Bank total: '||v_total_deposit); END;
/
-- P1.20
DECLARE v_roll NUMBER:=36; v_name VARCHAR2(50):='Zala jyotindrasinh.M'; v_dob DATE:=DATE '2007-06-06'; v_pnr VARCHAR2(30); v_jdate DATE; v_fare NUMBER; v_age NUMBER; BEGIN v_pnr:='GJ'||TO_CHAR(SYSDATE,'YYMM')||LPAD(v_roll,4,'0'); v_jdate:=SYSDATE+MOD(v_roll,30)+1; v_fare:=v_roll*50+200; v_age:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_dob)/12); IF v_age>=60 THEN v_fare:=v_fare*0.60; END IF; DBMS_OUTPUT.PUT_LINE('PNR: '||v_pnr); DBMS_OUTPUT.PUT_LINE('Passenger: '||v_name); DBMS_OUTPUT.PUT_LINE('Journey: '||TO_CHAR(v_jdate,'Day, DD-MON-YYYY')); DBMS_OUTPUT.PUT_LINE('Age: '||v_age); DBMS_OUTPUT.PUT_LINE('Fare: Rs.'||v_fare); END;
/
-- P1.21
DECLARE v_emp employees%ROWTYPE; v_id NUMBER:=100+MOD(36,20); v_da NUMBER; v_hra NUMBER; v_pf NUMBER; v_net NUMBER; BEGIN SELECT * INTO v_emp FROM employees WHERE employee_id=v_id; v_da:=v_emp.salary*.40; v_hra:=v_emp.salary*.20; v_pf:=v_emp.salary*.12; v_net:=v_emp.salary+v_da+v_hra-v_pf; DBMS_OUTPUT.PUT_LINE('SALARY SLIP - '||TO_CHAR(SYSDATE,'Month YYYY')); DBMS_OUTPUT.PUT_LINE('Employee: '||v_emp.first_name||' '||v_emp.last_name||' ID:'||v_emp.employee_id); DBMS_OUTPUT.PUT_LINE('Job: '||v_emp.job_id); DBMS_OUTPUT.PUT_LINE(LPAD('Basic: ',20)||TO_CHAR(v_emp.salary,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE(LPAD('DA: ',20)||TO_CHAR(v_da,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE(LPAD('HRA: ',20)||TO_CHAR(v_hra,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE(LPAD('PF: ',20)||TO_CHAR(v_pf,'99,99,999.99')); DBMS_OUTPUT.PUT_LINE(LPAD('Net Pay: ',20)||TO_CHAR(v_net,'99,99,999.99')); END;
/
-- P1.22
DECLARE v_qty NUMBER:=MOD(36,5)+2; v_price NUMBER:=36*100+400; v_coupon NUMBER; v_gross NUMBER; v_disc NUMBER; v_taxable NUMBER; v_cgst NUMBER; v_total NUMBER; BEGIN FOR i IN 1..2 LOOP IF i=1 THEN v_coupon:=NULL; ELSE v_coupon:=10; END IF; v_gross:=v_qty*v_price; v_disc:=v_gross*NVL(v_coupon,0)/100; v_taxable:=v_gross-v_disc; v_cgst:=v_taxable*9/100; v_total:=ROUND(v_taxable+v_cgst*2); DBMS_OUTPUT.PUT_LINE('--- BILL ---'); DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon,'Coupon applied: '||v_coupon||'%','No coupon')); DBMS_OUTPUT.PUT_LINE('Gross: '||v_gross); DBMS_OUTPUT.PUT_LINE('Discount: '||v_disc); DBMS_OUTPUT.PUT_LINE('CGST: '||v_cgst); DBMS_OUTPUT.PUT_LINE('SGST: '||v_cgst); DBMS_OUTPUT.PUT_LINE('Final Total: Rs.'||v_total); END LOOP; END;
/
-- P1.23
DECLARE v_name VARCHAR2(50):='Zala jyotindrasinh.M'; v_bonus CONSTANT NUMBER:=36*1000+20000; v_rate CONSTANT NUMBER:=0.10; v_sal NUMBER:=36*1000+20000; v_fname employees.first_name%TYPE; BEGIN -- Bug 1 fixed: := used for initialization.
-- Bug 2 fixed: VARCHAR2(50) is large enough.
-- Bug 3 fixed: CONSTANT receives its value at declaration.
-- Bug 4 fixed: declaration statements end with semicolons.
-- Bug 5 fixed: SELECT uses INTO in PL/SQL.
  SELECT first_name INTO v_fname FROM employees WHERE employee_id=100; DBMS_OUTPUT.PUT_LINE('Name: '||v_name); DBMS_OUTPUT.PUT_LINE('Employee: '||v_fname); DBMS_OUTPUT.PUT_LINE('Bonus: '||v_sal*v_rate); END;
/
