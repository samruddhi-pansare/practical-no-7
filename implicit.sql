
declare
p_price productinfo.price%type;
begin
select price into p_price from productinfo where product_id=101;
if sql%found then
dbms_output.put_line('Price fetched:'||p_price);
else
dbms_output.put_line('Productinfo not found.');
end if;
end;
/
