DECLARE
CURSOR numemp IS
  SELECT manager_id, count(employee_ID) as total_emp from employees group by manager_id; 
  rec numemp%rowtype;
BEGIN
OPEN numemp;
    LOOP 
      FETCH numemp into rec;
      EXIt WHEN numemp%notfound;
        CASE 
WHEN rec.total_emp > 10 THEN 
               DBMS_OUTPUT.put_line(rec.manager_id|| '    ' ||rec.total_emp || '    over-packed');
        WHEN rec.total_emp < 5  
          THEN DBMS_OUTPUT.put_line(rec.manager_id ||'    ' ||rec.total_emp || '    not unpacked');
        ELSE 
               DBMS_OUTPUT.put_line(rec.manager_id ||'    ' ||rec.total_emp || '    Between 5 -10');
        END CASE;
    END LOOP;
CLOSE numemp;
END;
