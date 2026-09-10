SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_cat VARCHAR2 DEFAULT 'Database') IS SELECT book_id,title FROM book WHERE category=p_cat;
BEGIN DBMS_OUTPUT.PUT_LINE('Default Database:'); FOR r IN c LOOP DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title); END LOOP; DBMS_OUTPUT.PUT_LINE('Networking:'); FOR r IN c('Networking') LOOP DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title); END LOOP; END;
/