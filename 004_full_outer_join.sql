--full outer join (All records from parent and child tables will be queried) ;


declare @emp_mst_old table (emp_id int, emp_name varchar(100)) ;
declare @emp_mst_new table (emp_id int, emp_name varchar(100)) ;

insert into @emp_mst_old (emp_id, emp_name) 
select 1, 'emp_01'
union all 
select 2, 'emp_02'
union all 
select 3, 'emp_03' ;

insert into @emp_mst_new (emp_id, emp_name) 
select 5, 'emp_04'
union all 
select 6, 'emp_05'
union all 
select 7, 'emp_06' ;


select 
a.emp_id new_emp_id, 
a.emp_name new_emp_name,
b.emp_id old_emp_id, 
b.emp_name old_emp_name
from @emp_mst_new a
full outer join @emp_mst_old b on a.emp_id = b.emp_id ;


select 
case when a.emp_id is null then 'old' else 'new' end emp_type,
case when a.emp_id is not null then a.emp_id else b.emp_id end emp_id, 
case when a.emp_id is not null then a.emp_name else b.emp_name end emp_name
from @emp_mst_new a
full outer join @emp_mst_old b on a.emp_id = b.emp_id 
order by emp_id ;




