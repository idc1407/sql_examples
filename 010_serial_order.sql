select 
row_number() over(partition by a.cust_id, a.prod_id order by a.cust_id, a.prod_id, a.sale_date) serial,
a.cust_id,
b.cust_name,
a.prod_id,
c.prod_name,
a.sale_date, 
a.sale_rate,
a.sale_qty,
a.sale_qty * a.sale_rate sale_value
from sales a
inner join customers b on a.cust_id = b.cust_id 
inner join products c on a.prod_id = c.prod_id  ;




