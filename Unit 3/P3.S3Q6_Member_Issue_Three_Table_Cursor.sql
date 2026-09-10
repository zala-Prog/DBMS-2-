SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_member NUMBER) IS SELECT b.title,bi.issue_date FROM book_issue bi JOIN book b ON bi.book_id=b.book_id JOIN lib_member m ON bi.member_id=m.member_id WHERE m.member_id=p_member; BEGIN FOR r IN c(3) LOOP DBMS_OUTPUT.PUT_LINE(r.title||' - '||TO_CHAR(r.issue_date,'DD-MON-YYYY')); END LOOP; END;
/