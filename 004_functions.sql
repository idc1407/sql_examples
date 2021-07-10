-- avg
select 
prod_id,
round(avg(sale_rate),0) avgPrice from sales group by prod_id  ;
-- EOF avg


-- count with CTE
with cte_01 as 
(
	select 
	cust_id,
	prod_id,
	count(*) TotalCount 
	from sales 
	where sale_date between '2020-03-01' and '2021-07-31' 
	group by cust_id, prod_id  
	
)
select 
a.cust_id,
b.cust_name,
a.prod_id,
c.prod_name,
a.TotalCount
from cte_01 a 
inner join customers b on a.cust_id = b.cust_id 
inner join products c on a.prod_id = c.prod_id ;
-- EOF count with CTE



-- Multiple CTE's
with 
cte_01 as 
(
	select 
	cust_id,
	prod_id,
	count(*) TotalCount 
	from sales 
	where sale_date between '2020-03-01' and '2021-07-31' 
	group by cust_id, prod_id  
	
),
cte_02 as 
(
	select 
	cust_id,
	prod_id,
	sum( sale_qty * sale_rate) TotalSales
	from sales 
	where sale_date between '2020-03-01' and '2021-07-31' 
	group by cust_id, prod_id  
),
cte_03 as 
(
	select 
	a.cust_id,
	a.prod_id,
	a.TotalCount,
	b.TotalSales
	from cte_01 a
	left join cte_02 b  on a.cust_id = b.cust_id and a.prod_id = b.prod_id 
)
select 
a.cust_id,
b.cust_name,
a.prod_id,
c.prod_name,
a.TotalCount,
a.TotalSales
from cte_03 a 
inner join customers b on a.cust_id = b.cust_id 
inner join products c on a.prod_id = c.prod_id order by TotalSales, cust_id, prod_id ;
-- EOF Multiple CTE's




-- Recursive CTE
Declare @RowNo int =1;
with ROWCTE as  
(  
    SELECT @RowNo as ROWNO    
 	UNION ALL  
    SELECT  ROWNO + 1  
	FROM  ROWCTE  
	WHERE RowNo < 10
)  
SELECT * FROM ROWCTE ; 
-- EOF Recursive CTE


