use Net23_Company
go
create schema Company
go
create table Company.Department
(
	DeptNo nvarchar(20),
	DeptName nvarchar(20),
	[Location] nchar(2) default 'NY'

	--constraints --
	constraint Dept_PK primary key (DeptNo),
	constraint chk_Docation check ([Location] in ('NY','DS','KW'))
)

create table Company.Empolyee
(
	EmpNo int identity(1,1) ,
	Emp_FName nvarchar(20) not null,
	Emp_LName nvarchar(20) not null,
	DeptNo nvarchar(20) ,
	Salary int 
	
	--constraints --
	constraint Employee1PK primary key (EmpNo),
	constraint FK_Em1_Dept foreign key (DeptNo) references Company.Department (DeptNo),
	constraint Salary1QN unique (Salary),
	constraint chk_Salary1 check (Salary between 700 and 6000),
)

create table Project
(
	ProjectNo varchar(10) not null,
	ProjectName varchar(50) not null,
	Budget int

	--constraints --
	constraint Project_PK primary key (ProjectNo),
) on [SecondaryFG]

create table Works_On
(
	EmpNo int not null,
	ProjectNo varchar(10) not null,
	job varchar(20) null,
	Enter_Date date not null default GETDATE()

	constraint Works_PK primary key (EmpNo , ProjectNo),
	constraint FK_Works_Emp foreign key (EmpNo) references  Company.Empolyee (EmpNo),
	constraint FK_Works_Project foreign key (ProjectNo) references Project (ProjectNo)
) 
drop table  Company.Department
drop table  Company.Empolyee
drop table Project
drop table Works_On
