DROP TABLE IF EXISTS customers ;
CREATE TABLE customers
( 
  cust_id int NOT NULL,
  cust_name varchar(100) NOT NULL,
  CONSTRAINT cust_pk PRIMARY KEY (cust_id)
);



DROP TABLE IF EXISTS products ;
CREATE TABLE products
( 
  prod_id int NOT NULL,
  prod_name varchar(100) NOT NULL,
  CONSTRAINT prod_pk PRIMARY KEY (prod_id)
);


DROP TABLE IF EXISTS sales ;
CREATE TABLE sales
( 
  sale_id int NOT NULL IDENTITY(1,1) ,
  cust_id int NOT NULL,
  prod_id int NOT NULL,
  sale_date date,
  sale_qty int,
  sale_rate decimal(18, 2)
  CONSTRAINT sale_pk PRIMARY KEY (sale_id)
);


insert into customers (cust_id, cust_name) 
select 1, 'customer - 001' 
union all 
select 2, 'customer - 002' 
union all 
select 3, 'customer - 003' 
union all 
select 4, 'customer - 004' 
union all 
select 5, 'customer - 005'  ;



insert into products (prod_id, prod_name) 
select 1, 'product - 001' 
union all 
select 2, 'product - 002' 
union all 
select 3, 'product - 003'  ;

declare @counter int ;
declare @sale_date date ;
declare @cust_id int ;
declare @prod_id int ;


-- product 1
--soc
select 
@counter = 100,
@sale_date = '2020-01-03',
@cust_id = 1,
@prod_id = 1 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-02-03',
@cust_id = 2,
@prod_id = 1 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-03-03',
@cust_id = 3,
@prod_id = 1 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof

--soc
select 
@counter = 100,
@sale_date = '2020-05-03',
@cust_id = 4,
@prod_id = 1 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-07-10',
@cust_id = 5,
@prod_id = 1 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof



-- product 2
--soc
select 
@counter = 100,
@sale_date = '2020-01-03',
@cust_id = 1,
@prod_id = 2 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-02-03',
@cust_id = 2,
@prod_id = 2 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-03-03',
@cust_id = 3,
@prod_id = 2 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof

--soc
select 
@counter = 100,
@sale_date = '2020-05-03',
@cust_id = 4,
@prod_id = 2 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof

--soc
select 
@counter = 100,
@sale_date = '2020-07-10',
@cust_id = 5,
@prod_id = 2 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof



-- product 3
--soc
select 
@counter = 100,
@sale_date = '2020-01-03',
@cust_id = 1,
@prod_id = 3 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-02-03',
@cust_id = 2,
@prod_id = 3 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof


--soc
select 
@counter = 100,
@sale_date = '2020-03-03',
@cust_id = 3,
@prod_id = 3 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof

--soc
select 
@counter = 100,
@sale_date = '2020-05-03',
@cust_id = 4,
@prod_id = 3 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof

--soc
select 
@counter = 100,
@sale_date = '2020-07-10',
@cust_id = 5,
@prod_id = 3 ;
while @counter != 0
begin
	insert into sales  (cust_id, prod_id, sale_date, sale_qty, sale_rate) 
	select 
	@cust_id, 
	@prod_id, 
	@sale_date, 
	FLOOR(RAND()*(20-100+1))+100,
	FLOOR(RAND()*(20-50+1))+50 ;
	
	select @counter = @counter - 1 ;
	select @sale_date = DATEADD(day, 2, @sale_date) ;
end
-- eof




select * from sales 






