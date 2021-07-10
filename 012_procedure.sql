DROP procedure IF EXISTS iu_customer ;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[iu_customer]
	@iud int,
	@cust_id int,
	@cust_name varchar(100)
AS

BEGIN
	SET NOCOUNT ON;
	

	declare @u_result_no int = 0 ;
	declare @u_result_desc nvarchar(500) ;
	declare @dup_id int = 0 ; 

	BEGIN TRY   
		
		begin tran
	
		 select @dup_id = cust_id  from customers where cust_name = @cust_name and cust_id != isnull( @cust_id,0) ;
		 if isnull( @dup_id,0) > 0 
		 begin 
			 RAISERROR (N'Name (%s) already exist for ID  (%d)' , 16, 1, @cust_name, @dup_id );
		 end
	
		begin 
			if @iud = 1 
			begin 
		
				select @cust_id = (select isnull( max(cust_id),0) + 1 from customers WITH (updlock, holdlock) ) ;

				insert into customers
				(
					cust_id,
					cust_name
				)
				select 
				@cust_id,
				@cust_name ;

				select @u_result_desc = 'Record Inserted ID Number : '  + CONVERT(nvarchar(10),@cust_id) ;  
				select @u_result_no = 0  ; 
			end
			else if @iud = 2 
			begin 

				update customers
				set 
				cust_name = @cust_name
				 where cust_id = @cust_id ;

				if @@ROWCOUNT > 0
				begin 
					select @u_result_desc = 'Record Updated ID Number : ' + CONVERT(nvarchar(10), @cust_id)  ;
					select @u_result_no = 0  ; 
				end 
			    else 
				begin
					RAISERROR (N'** ERROR ** Record Failed to Update with this ID Number : %d' , 16, 1,@cust_id );
				end 
			end 
	
     		commit tran ;
		end 
	
	END TRY
	BEGIN CATCH
		begin 
			select @u_result_no = @@ERROR,  @u_result_desc = ERROR_MESSAGE() ; 
			rollback ;
		end
	END CATCH

	select @u_result_no as ResultNumber,@u_result_desc as ResultDesc, @cust_id as id  ;

END