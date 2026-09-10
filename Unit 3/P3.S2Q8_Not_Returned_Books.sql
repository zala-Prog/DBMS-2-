SET SERVEROUTPUT ON;
DECLARE CURSOR c IS SELECT issue_id,book_id,issue_date FROM book_issue WHERE return_date IS NULL; n NUMBER:=0; BEGIN FOR r IN c LOOP n:=n+1; DBMS_OUTPUT.PUT_LINE(r.issue_id||' - Book '||r.book_id||' - '||TO_CHAR(r.issue_date,'DD-MON-YYYY')); END LOOP; IF n=0 THEN DBMS_OUTPUT.PUT_LINE('All books returned'); END IF; END;
/