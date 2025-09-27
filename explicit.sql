DECLARE
   CURSOR prod_cursor IS
      SELECT product_id, product_name, price FROM productinfo;

   p_product_id   productinfo.product_id%TYPE;
   p_product_name productinfo.product_name%TYPE;
   p_price        productinfo.price%TYPE;
BEGIN
   OPEN prod_cursor;
   LOOP
      FETCH prod_cursor INTO p_product_id, p_product_name, p_price;
      EXIT WHEN prod_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Product ID: ' || p_product_id);
      DBMS_OUTPUT.PUT_LINE('Product Name: ' || p_product_name);
      DBMS_OUTPUT.PUT_LINE('Price: ' || p_price);
   END LOOP;
   CLOSE prod_cursor;
END;
/
