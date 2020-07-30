SET SERVEROUTPUT ON
DECLARE
v_counter BINARY_INTEGER := 1;
v_factorial NUMBER := 1;
BEGIN
FOR v_counter IN 1..10 LOOP
v_factorial := v_factorial * v_counter;
END LOOP;
DBMS_OUTPUT.PUT_LINE ('Factorial of 10 is '|| v_factorial);
END;
