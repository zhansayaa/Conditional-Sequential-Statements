DECLARE
CURSOR activity IS
  SELECT c.name as customer_name, count(ORDER_ID) as total 
  FROM CUSTOMERS c JOIN ORDERS o ON c.CUSTOMER_ID = o.CUSTOMER_ID
  group by c.name;
  rec activity%rowtype;
BEGIN
OPEN activity;
    LOOP 
FETCH activity into rec;
      EXIt WHEN activity%notfound;
        CASE 
        WHEN rec.total > 10 THEN 
          DBMS_OUTPUT.put_line(rec.customer_name ||'   ' ||rec.total || '    is Active');
        WHEN rec.total < 5  
     THEN DBMS_OUTPUT.put_line(rec.customer_name ||'   ' ||rec.total || '    is Less active');
        ELSE 
          DBMS_OUTPUT.put_line(rec.customer_name ||'   ' ||rec.total || '    is Not active');
        END CASE;
    END LOOP;
  CLOSE activity;
END;
