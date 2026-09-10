SET SERVEROUTPUT ON;
DECLARE CURSOR c(p_cat VARCHAR2) IS SELECT book_id,title FROM book WHERE UPPER(category)=UPPER(p_cat); BEGIN FOR r IN c('Database') LOOP DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title); END LOOP; FOR r IN c('Programming') LOOP DBMS_OUTPUT.PUT_LINE(r.book_id||' - '||r.title); END LOOP; END;
/