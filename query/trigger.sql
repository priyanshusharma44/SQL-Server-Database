--Trigger
create or alter trigger notifyInsert on Employee after insert as
begin
declare @name as nvarchar(50);
select @name=empName from inserted
	print 'Congratulations!! new employee inserted with name: '+@name;
end

exec addEmployee 'Bijaya',35000;

declare @i as integer
set @i = 1;
while @i<=100
begin
	print @i;
	set @i = @i+1;
end