SET SERVEROUTPUT ON
 DECLARE
 v_counter BINARY_INTEGER := 1;
 v_sum NUMBER := 0;
 BEGIN
 for v_counter in 1 .. 10 LOOP
 v_sum := v_sum + v_counter;
 DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
 -- increment loop counter by one
 END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('The sum of integers between 1 '||
 'and 10 is: '||v_sum);
END;

