DROP function IF EXISTS get_class ;
go

CREATE FUNCTION get_class(@cust_id int)  
RETURNS char 
AS   
BEGIN  
    DECLARE @class char(1);  

	declare @tot_sales decimal(18,2) ;

	select @tot_sales = sum(sale_qty * sale_rate) from sales where cust_id = @cust_id ;
	
	if @tot_sales > 620000
		select @class = 'A' ;
	else
		select @class = 'B' ;
	
	return @class ;
END; 
go 


select *, dbo.get_class(cust_id) as class from customers ;

 

