DECLARE
CURSOR manager IS
  SELECT employee_id, first_name, manager_id 
  FROM EMPLOYEES;
  rec manager%rowtype;
BEGIN
OPEN manager;
    LOOP 
      FETCH manager into rec;
      EXIt WHEN manager%notfound;
        CASE 
WHEN rec.manager_id IS NULL THEN 
          DBMS_OUTPUT.put_line('ID ' || rec.employee_id  || ' NAME : ' || rec.first_name || ' there is no manager '  );
        ELSE 
          DBMS_OUTPUT.put_line('ID ' || rec.employee_id  || ' NAME : ' || rec.first_name || ' MANAGER is ' || rec.manager_id );
        END CASE;
    END LOOP;
  CLOSE manager;
END;
