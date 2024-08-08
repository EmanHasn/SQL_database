--- insert in table 

--- insert in derpartment table

use Net23_Company
insert into Company.Department 
values('d1', 'Marketing','DS'),('d2', 'Front_end','KW'),('d3', 'Back_end' ,'DS')

--- insert in Empolyee table
use Net23_Company
set identity_insert Company.Empolyee ON
insert into Company.Empolyee (EmpNo ,Emp_FName ,Emp_LName,DeptNo ,Salary)
values(25348, 'Mathew','Smith' , 'd3' , 2500),(10102 , 'Ann', 'Jones','d3',3000), (18316 , 'John', 'Barrimore','d1',2400)

--- insert in Project table
insert into Project(ProjectNo,ProjectName ,Budget )
values('p1', 'Apollo',120000),('p2', 'Gemini',95000),('p3', 'Mercury',185600)


--- insert in Works_On table
set dateformat ymd 
insert into Works_On 
values(10102,'p1','Analyst','2006-10-01') , (10102,'p3','Manager','2008-01-01') , (25348,'p2','Clerk','2007-02-15');

delete from Company.Department
delete from Company.Empolyee
delete from Works_On