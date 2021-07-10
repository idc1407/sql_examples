DROP view IF EXISTS vw_sales ;
go 

create view vw_sales as
(
	select 
	a.sale_id,
	b.cust_id,
	b.cust_name,
	a.prod_id,
	c.prod_name,
	a.sale_date,
	a.sale_qty,
	a.sale_rate,
	a.sale_qty * sale_rate sale_value
	from sales a
	inner join customers b on a.cust_id = b.cust_id 
	inner join products c on a.prod_id = c.prod_id 
) ;

go 

select * from vw_sales ;