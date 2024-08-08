
----- add new col
alter table Company.Empolyee
add TelephoneNumber varchar(11) 

----- drop col
alter table Company.Empolyee
drop column TelephoneNumber


----- delete PK
use Net23_Company
alter table Company.Empolyee
drop column EmpNo
/*
can we drop empno colum from emp table?
error - ALTER TABLE DROP COLUMN EmpNo failed because one or more objects access this column.*/
