
-- 1.	Display the Department id, name and id and the name of its manager.

use Company_SD;
select D.Dname 'department name', D.Dnum as 'department id', E.SSN 'manger id' , CONCAT(E.Fname , ' ' , E.Lname) as ' manager name'
from dbo.Departments D , dbo.Employee E
where D.MGRSSN = E.SSN

-- 2.	Display the name of the departments and the name of the projects under its control.

use Company_SD;
select D.Dname 'department name', P.Pname 'project name'
from Departments D, Project P
where D.Dnum = P.Dnum;

-- 3.	Display the Id, name and location of the projects in Cairo or Alex city.

use Company_SD;
select P.Pnumber as 'project id' , P.Plocation 'project location' , P.Pname as 'project name'
from  Project P
where P.City in ('Cairo' , 'Alex')


-- 4.	Display the Projects full data of the projects with a name starts with "p" letter.

use Company_SD;
select * from Project
where Pname like 'p%'


-- 5.	display all the employees in department 10 whose salary from 1000 to 2000 LE monthly

use Company_SD;
select * from Employee
where Dno=10 and Salary between 1000 and 2000;

-- 6.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "P1" project.

use Company_SD;
select CONCAT(E.Fname , ' ' , E.Lname) as ' employee name', P.Pname as 'project name'
from Employee E, Works_for W , Project P
where E.SSN = W.ESSn and W.Pno = P.Pnumber
order by p.Pname

-- 7.	Find the names of the employees who directly supervised with Huda.

use Company_SD
select E.Fname , E.Lname
from Employee E
where E.Superssn = (select SSN from Employee where Lname = 'Huda')

--8.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

use Company_SD
select E.Fname, E.Lname , P.Pname
from Employee E, Works_for W , Project P
where E.SSN = W.ESSn and W.Pno  = P.Pnumber
order by P.Pname

-- 9.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

use Company_SD
select P.Pnumber , D.Dname , E.Lname as 'manager last name' , E.Address , E.Bdate
from Employee E, Departments D , Project P
where P.Dnum = D.Dnum and D.MGRSSN = E.SSN and P.City = 'Cairo'

-- 10.	Display All Data of the mangers

use Company_SD
select * from Employee
where SSN in (select MGRSSN from Departments)

--11.	Display All Employees data and the data of their dependents even if they have no dependents

use Company_SD
select CONCAT(E.Fname , ' ', E.Lname) as 'employee name' , D.Dependent_name
from Employee E, Dependent D

--12.	Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233.

use Company_SD
insert into Employee
values('Mohamed' , 'Ali' , 102672 , '1960-01-01','Cairo','male',15000,112233, 30)

-- 13.	Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him.

use Company_SD
insert into Employee(Fname , Lname,SSN,Bdate,Address , Sex,Dno)
values('Dia' , 'jo' , 102660 , '1960-01-01','Cairo','male', 30)

--14.	In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'.

insert into Departments(Dnum, Dname , MGRSSN,[MGRStart Date])
values(100, 'DEPT IT', 112233,1-11-2006)

--15.	For each project, list the project name and the total hours per week (for all employees) spent on that project.

use Company_SD
select P.Pname as 'project name', SUM(W.Hours) as 'hours'
from Project P,Works_for W
where P.Pnumber = W.Pno
group by P.Pname

--16.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

use Company_SD
select D.Dname , MAX(E.Salary) as 'max salary' ,MIN(E.Salary) as 'min salary' , avg(E.Salary) as 'avg salary'
from Departments D, Employee E
where D.Dnum = E.Dno
group by D.Dname

--17.	Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.

use Company_SD
select CONCAT(E.Fname,'',E.Lname ) as 'employee name', P.Pname
from Employee E, Works_for W, Project P
where E.SSN = W.ESSn and W.Pno = P.Pnumber
order by E.Dno , E.Lname , E.Fname
