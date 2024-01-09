--alter database method 1 
alter database sample2 modify name=sample3

--alter database method 2
sp_renameDB 'sample3','sample4'


--use database
use sample4
   
--drop database
drop database GraphicDesigned
