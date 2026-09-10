SET SERVEROUTPUT ON;
DECLARE
  food_total NUMBER:=350; km NUMBER:=5; rain CHAR(1):='Y'; late_night CHAR(1):='N'; festival CHAR(1):='N'; peak CHAR(1):='N'; first_order CHAR(1):='N'; base_charge NUMBER; delivery NUMBER; surcharge NUMBER:=0; discount NUMBER:=0;
BEGIN
  IF km<3 THEN base_charge:=0; ELSIF km<=8 THEN base_charge:=29; ELSIF km<=15 THEN base_charge:=49; ELSE base_charge:=79; END IF; delivery:=base_charge;
  IF food_total>499 THEN delivery:=0; ELSE
    IF rain='Y' THEN surcharge:=surcharge+ROUND(base_charge*CASE 'R' WHEN 'R' THEN .20 ELSE 0 END); END IF;
    IF late_night='Y' THEN surcharge:=surcharge+ROUND(base_charge*.15); END IF;
    IF festival='Y' THEN surcharge:=surcharge+ROUND(base_charge*.10); END IF;
    IF peak='Y' THEN surcharge:=surcharge+ROUND(base_charge*.10); END IF;
    delivery:=base_charge+surcharge; IF first_order='Y' THEN discount:=ROUND(delivery*.50); delivery:=delivery-discount; END IF;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Food Total: Rs.'||food_total); DBMS_OUTPUT.PUT_LINE('Base Delivery: Rs.'||base_charge); DBMS_OUTPUT.PUT_LINE('Surcharges: Rs.'||surcharge); DBMS_OUTPUT.PUT_LINE('Discount: Rs.'||discount); DBMS_OUTPUT.PUT_LINE('Final Delivery: Rs.'||ROUND(delivery)); DBMS_OUTPUT.PUT_LINE('Grand Total: Rs.'||ROUND(food_total+delivery));
END;
/