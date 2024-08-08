/*
7.	Try update and Delete on the previous data.
a.	Testing Referential Integrity:
i.	Add new employee with EmpNo =11111 In the works_on table [Is there error what is it].
ii.	Change the employee number 10102  to 11111  in the works on table [is there error what is it].
iii.	Modify the employee number 10102 in the employee table to 22222. [is there error what is it].
*/

---i.	Add new employee with EmpNo =11111 In the works_on table [Is there error what is it].
use Net23_Company
insert into Works_On 
values(11111,'p1','Analyst','2006-10-01');
--error - The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Works_Emp". The conflict occurred in database "Net23_Company", table "dbo.Empolyee", column 'EmpNo'.



--ii.	Change the employee number 10102  to 11111  in the works on table [is there error what is it].--
use Net23_Company
update Works_On 
set EmpNo =11111
where EmpNo = 10102
--error  - The UPDATE statement conflicted with the FOREIGN KEY constraint "FK_Works_Emp". The conflict occurred in database "Net23_Company", table "dbo.Empolyee", column 'EmpNo'.



-- iii.	Modify the employee number 10102 in the employee table to 22222. [is there error what is it].

use Net23_Company
update Company.Empolyee 
set EmpNo =22222
where EmpNo = 10102
-- error - Cannot update identity column 'EmpNo'.

-- iv.	Delete the employee with id 10102
use Net23_Company
delete from Company.Empolyee
where EmpNo = 10102
-- Error - The DELETE statement conflicted with the REFERENCE constraint "FK_Works_Emp". The conflict occurred in database "Net23_Company", table "dbo.Works_On", column 'EmpNo'.
