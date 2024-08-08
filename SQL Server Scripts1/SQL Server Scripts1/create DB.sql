create database Net23_Company
on Primary --fileGroup
(
	name='Net23_Company_Data',
	Size=10MB,
	filegrowth=10MB,
	Maxsize=50MB,
	filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Net23_Company_Data.mdf'
),
filegroup SecondaryFG
(
	name='SecondaryFG',
	Size=10MB,
	filegrowth=4MB,
	Maxsize=unlimited,
	filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SecondaryFG.ndf'
)
Log on 
(
	name='Net23_Company_Log',
	Size=5MB,
	filegrowth=10MB,
	Maxsize=40MB,
	filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Net23_Company_Log.ndf'
)

drop database Net23_Company