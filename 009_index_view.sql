DROP view IF EXISTS vw_sales_sum ;
go 

create view vw_sales_sum with schemabinding as
(
	select 
	cust_id,
	prod_id,
	count_big(*) as tot_count,
	sum(isnull(sale_qty,0)) tot_sale_qty,
	sum(isnull((sale_qty * sale_rate),0)) tot_sale_value
	from dbo.sales 
	group by cust_id, prod_id 
) ;

go 

CREATE UNIQUE CLUSTERED INDEX [ix_vw_sales_sum] ON [dbo].[vw_sales_sum] 
(
	[cust_id] ASC, [prod_id] ASC
) ;
GO 


select * from vw_sales_sum ;