--right outer join (All records from child tables will be queried) ;


declare @emp_mst table (emp_id int, emp_name varchar(100)) ;
declare @emp_trn table (emp_id int, mth int, yy int, net_salary int) ;

insert into @emp_mst (emp_id, emp_name) 
select 1, 'emp_01'
union all 
select 2, 'emp_02'
union all 
select 3, 'emp_03' ;

insert into @emp_trn (emp_id, mth, yy, net_salary) 
select 1, 4, 2020, 900
union all 
select 1, 5, 2020, 1000
union all 
select 2, 4, 2020, 1900 ;


select 
b.emp_id,
b.emp_name,
a.mth,
a.yy,
a.net_salary 
from @emp_trn a
right outer join @emp_mst b on a.emp_id = b.emp_id ;





