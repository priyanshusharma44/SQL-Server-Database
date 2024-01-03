create procedure deletePersonById(@id as integer) as 
begin
	delete from Person where pid=@id;
end

exec deletePersonById 2;

