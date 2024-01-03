create procedure addPerson(@id as integer,@name as nvarchar(50),@addr as nvarchar(40), @phone as nvarchar(10)) as 
begin
insert into person(pid, pName, pAddress, pContactNo) values(@id,@name,@addr,@phone);
print 'Person Added.';
end

exec addPerson 2,'hari','Itahari', '98010101010';
