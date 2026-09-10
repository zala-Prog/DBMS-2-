SET SERVEROUTPUT ON;
DECLARE
  n NUMBER:=5+MOD(36,8); a NUMBER:=0; b NUMBER:=1; c NUMBER; last_fib NUMBER:=0; i NUMBER:=1; x NUMBER; d NUMBER; prime BOOLEAN; gcd_a NUMBER:=48; gcd_b NUMBER:=18; r NUMBER; divisor_sum NUMBER:=0; perfect_no NUMBER:=6;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Part A: Fibonacci'); WHILE i<=n LOOP DBMS_OUTPUT.PUT(a||' '); last_fib:=a; c:=a+b; a:=b; b:=c; i:=i+1; END LOOP; DBMS_OUTPUT.NEW_LINE;
  x:=last_fib; prime:=TRUE; IF x<2 THEN prime:=FALSE; ELSE d:=2; WHILE d*d<=x LOOP IF MOD(x,d)=0 THEN prime:=FALSE; EXIT; END IF; d:=d+1; END LOOP; END IF; DBMS_OUTPUT.PUT_LINE('Nth Fibonacci='||last_fib||', Prime='||CASE WHEN prime THEN 'YES' ELSE 'NO' END);
  DBMS_OUTPUT.PUT_LINE('Part C: Primes 1-100'); i:=2; WHILE i<=100 LOOP prime:=TRUE; d:=2; WHILE d*d<=i LOOP IF MOD(i,d)=0 THEN prime:=FALSE; EXIT; END IF; d:=d+1; END LOOP; IF prime THEN DBMS_OUTPUT.PUT(i||' '); END IF; i:=i+1; END LOOP; DBMS_OUTPUT.NEW_LINE;
  WHILE gcd_b<>0 LOOP r:=MOD(gcd_a,gcd_b); gcd_a:=gcd_b; gcd_b:=r; END LOOP; DBMS_OUTPUT.PUT_LINE('GCD(48,18)='||gcd_a);
  i:=1; WHILE i<perfect_no LOOP IF MOD(perfect_no,i)=0 THEN divisor_sum:=divisor_sum+i; END IF; i:=i+1; END LOOP; DBMS_OUTPUT.PUT_LINE('6 is '||CASE WHEN divisor_sum=perfect_no THEN 'a Perfect Number' ELSE 'not a Perfect Number' END);
END;
/