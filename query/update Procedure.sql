--create proc updatePerson(@id as integer, @n as nvarchar(50), @addr as nvarchar(40), @phone as nvarchar(10)) as
--begin
--	update Person set pname = @n, pAddress=@addr, pContactNo = @phone where pid = @id;
--end

--select * from Person;
--exec updatePerson 1,'Hari', 'Itahari',null;

--==================================================================================================================
--==============================optional============================== 

alter proc updatePerson(@id as integer, @n as nvarchar(50), @addr as nvarchar(40), @phone as nvarchar(10)=null) as
begin
	if(@phone is null)
		begin
		update Person set pname = @n, pAddress=@addr where pid = @id;
		end
	else
		begin
		update Person set pname = @n, pAddress=@addr, pContactNo = @phone where pid = @id;
		end
end

select * from Person;
--exec updatePerson 1,'Hari', 'Itahari','9812345678';
exec updatePerson 1,'Hari', 'biratnagar';