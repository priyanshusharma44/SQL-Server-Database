alter procedure getAllPerson as 
begin
	select * from person;
end
exec getAllPerson;