DECLARE
CURSOR pleft IS
  SELECT p.product_name, sum(i.quantity) as warehouse
  FROM products p JOIN inventories i
  ON p.product_id = i.product_id
  group by p.product_name;
  rec pleft%rowtype;
BEGIN
  OPEN pleft;
LOOP 
      FETCH pleft into rec;
      EXIt WHEN pleft%notfound;
      if (rec.warehouse < 1000) THEN
      DBMS_OUTPUT.put_line(rec.product_name ||'       ' || rec.warehouse || '                       - Status: MIN');
      else
      DBMS_OUTPUT.put_line(rec.product_name ||'       ' || rec.warehouse || '                       - Status: ENOUGH');
      END if;
    END LOOP;
  CLOSE pleft;
END;
