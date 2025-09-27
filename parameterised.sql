DECLARE
  CURSOR product_cursor(p_price_1 NUMBER) IS 
    SELECT product_id, product_name, price 
    FROM productinfo 
    WHERE price > p_price_1;

  p_product_id   productinfo.product_id%TYPE;
  p_product_name productinfo.product_name%TYPE;
  p_price productinfo.price%TYPE;

  v_input NUMBER;  
BEGIN
  v_input := &enter_price;

  DBMS_OUTPUT.PUT_LINE('Starting to fetch products above price ' || v_input || '...');

  OPEN product_cursor(v_input);
  LOOP
    FETCH product_cursor INTO p_product_id, p_product_name, p_price;
    EXIT WHEN product_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('pid: ' || p_product_id || ', name: ' || p_product_name || ', price: ' || p_price);
  END LOOP;
  CLOSE product_cursor;

  DBMS_OUTPUT.PUT_LINE('Done fetching products.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
