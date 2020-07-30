DECLARE
CURSOR comparing IS
  SELECT product_name, standard_cost, list_price
  FROM products; 
  rec comparing%rowtype;
BEGIN
OPEN comparing;
    LOOP 
      FETCH comparing into rec;
      EXIt WHEN comparing%notfound;
      if (rec.standard_cost > rec.list_price) THEN
      DBMS_OUTPUT.put_line(rec.product_name ||'       ' || rec.standard_cost || '      ' ||rec.list_price || '              Decreased ' || rec.list_price * 0.75 );
elsif(rec.standard_cost < rec.list_price) THEN
      DBMS_OUTPUT.put_line(rec.product_name ||'       ' || rec.standard_cost ||'       ' || rec.list_price || '              Increased ' ||  rec.list_price * 1.2);
      else
      DBMS_OUTPUT.put_line(rec.product_name ||'       ' || rec.standard_cost ||'       ' || rec.list_price || '              Not Changed');
END if;
    END LOOP;
  CLOSE comparing;
END;
