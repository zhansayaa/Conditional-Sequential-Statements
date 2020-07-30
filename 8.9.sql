SET SERVEROUTPUT ON
DECLARE
v_counter BINARY_INTEGER := 1;
v_factorial NUMBER := 1;
BEGIN LOOP
v_factorial := v_factorial * v_counter;
v_counter := v_counter + 1;
EXIT WHEN v_counter = 11;
END LOOP;
DBMS_OUTPUT.PUT_LINE ('Factorial of 10 is '|| v_factorial);
COMMIT;
END;
