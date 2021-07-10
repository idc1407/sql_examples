-- cross join all -> all records * all records

declare @employee table (empName VARCHAR(100)) ;
declare @dates table (tdate date) ;

INSERT INTO @employee
VALUES('Emp 01'), ('Emp 02'), ('Emp 03') ;


Declare @date date = '2020-01-01';
with ROWCTE as  
(  
    SELECT @date as cdate    
 	UNION ALL  
    SELECT  dateadd(day, 1, cdate) 
	FROM  ROWCTE  
	WHERE cdate < '2020-01-31' 
)  
INSERT INTO @dates 
SELECT * FROM ROWCTE ; 
-- EOF Recursive CTE





SELECT * FROM @employee
CROSS JOIN @dates ;