create proc getPersonCount(@count as integer output) as
begin
	select @count = count(*) from person;
end

--================================================

declare @count as integer;
exec getPersonCount @count output;
print @count;