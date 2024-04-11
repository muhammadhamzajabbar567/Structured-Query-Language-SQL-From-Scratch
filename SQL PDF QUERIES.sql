use Northwind
go
select * from Employees
select FirstName from Employees
select UPPER(FirstName) as [First Name] from Employees
select lower(FirstName) as [First Name] from Employees
select FirstName  + ' ' +  LastName as [Full Name]from Employees
select * from Employees where FirstName = 'Adam'
select * from Employees where FirstName like 'a%'
select * from Employees where FirstName like '%b%'
select * from Employees where FirstName like '%l'
select * from Employees where FirstName like '[a-p]%'
select * from Employees where FirstName like '[^a-p]%'
select * from Employees where FirstName like  '__am'
select * from Employees where FirstName like 'a___'
select * from Employees where FirstName like '%[%]%'
select distinct(Country) from Customers 
select max(Price) as [Max Price] from Products
select min(Price) as [Min Price] from Products
select * from Employees
SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Employees' 
and COLUMN_NAME = 'BirthDate'

select convert(varchar(20),BirthDate,106) as [Birth Dates] from Employees
select CONVERT(varchar(20),BirthDate,111) as [Birth Dates] from Employees
select CONVERT(varchar(20), BirthDate,108) as [Birth Dates] from Employees
select DATEPART(YEAR,BirthDate) as [Birth Year] from Employees
select DATEPART(MONTH,BirthDate) as [Birth Month] from Employees
select GETDATE()
select convert(varchar(20),GETDATE(),106)
select GETUTCDATE()
select CONVERT(varchar(20), GETUTCDATE(),111)
select  BirthDate from Employees where (DATEPART(YEAR,BirthDate)) = 1968
select * from Employees where (DATEPART(MONTH,BirthDate)) = '1'
select * from Employees where BirthDate between '1963-01-01' and '1963-12-01'
select count(*) [Total Employees] from Employees
select * from Suppliers
select top 1 * from Employees
select * from Employees where FirstName in ('Adam','Janet','Laura')
select * from Employees where FirstName not in ('Adam','Janet','Laura')
select FirstName from Employees
select RTRIM(FirstName) from Employees
select LTRIM(FirstName) from Employees
select * from  [Brazil Customers]
select * from Categories

select  Categories.CategoryID,CategoryName,
case
     when CategoryName = 'Confections' then 'Vegetarian'
	 when CategoryName = 'Meat/Poultry' then 'Non-Vegetairan'
end as [Vegetarian / Non-Vegetarian] from Categories



select 'Hello,' + FirstName from Employees
select * from Products

select * from Products where Price > 200
select * from Products where Price < 200
select * from Products where Price Between 100 and 200
select top 1 Price from (select top 2 Price from [Products] order by Price desc) T order by Price asc
select Price from Products order by Price desc
select top 1 Price from (select top 3 Price from Products order by Price desc) T order by Price asc
select ProductName,sum(Price) as [Total price] from Products Group by ProductName

select ProductName,Price as [Total price] from Products order by ProductName
select * from OrderDetails
select *  from Products
select * from Customers
select * from Employees
select * from Categories
select * from Orders

select ProductName,COUNT(*)[Total Product],sum(Price) [Toatal Price]from Products group by ProductName

select ProductName, avg(Price) [Avg Price] from Products group by ProductName order by Avg(Price) asc

select CustomerName,ProductName from [Customers]A 
inner join
[Products]B on A.CustomerID =B.ProductID order by CustomerName

select CustomerName,ProductName from [Customers]A 
left outer join 
[Products]B on A.CustomerID = B.ProductID order by CustomerName

select CustomerName,isnull(ProductName,'Null')[Product Name] from [Customers]A 
left outer join 
[Products]B on A.CustomerID = B.ProductID order by CustomerName

select CustomerName,ProductName from [Customers]A 
right outer join 
[Products]B on A.CustomerID = B.ProductID order by CustomerName

select * from Customers
select * from Products
select * from OrderDetails

select * from Products join OrderDetails
on Products.ProductID = OrderDetails.ProductID

select * from Products join OrderDetails 

--These are used to display information in a database, like as tables and columns. 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Products'

--These are used to show database self-describing information.
SELECT * FROM SYS.TABLES

--These Views give the administrator information about the database about the current state of the SQL Server machine. 
--These values help the administrator to analyze problems and tune the server for optimal performance. 
--These are of two types
--Server-scoped Dynamic Management View
--These are stored only in the Master database.
--Database-scoped Dynamic Management View
--These are stored in each database.
 --To see all SQL Server connections
SELECT connection_id,session_id,client_net_address,auth_scheme
FROM sys.dm_exec_connections 

--User Defined Views
--These types of views are defined by users. We have two types of user-defined views.
--Simple View
--When we create a view on a single table, it is called a simple view.
CREATE VIEW PRODUCTS_DATA
AS
SELECT ProductID from products


select * from Products
select * from OrderDetails
select * from Employees
select * from Orders
select * from Customers

--to see the data of view
select * FROM PRODUCTS_DATA

--Complex View
--When we create a view on more than one table, it is called a complex view.
create view Products_OrderDetails_Data_1
as
select Employees.EmployeeID, Orders.EmployeeID, Employees.FirstName,Orders.OrderDate
from Employees inner join Orders
on Employees.EmployeeID =  Orders.EmployeeID 

--Format of CASE expression
--The CASE expression has following two formats:
--Simple CASE expression
--This compares an expression to a set of simple expressions to find the result. 
--This expression compares an expression to the expression in each WHEN clause for equivalency. 
--If the expression with in the WHEN clause is matched, the expression in the THEN clause will be returned.
--Syntax
select OrderID, Quantity,
case
     when Quantity > 30 then 'Quantity is greater than 30'
	 when Quantity = 30 then 'Quantity is 30'
	 when Quantity < 30 then 'Quantity is under 30'
end as QuantityText
from OrderDetails

update Customers set CustomerName = City, City = ContactName
select * from Customers
update Customers set City = CustomerName, ContactName = City

--set no# 04--
select top 1 * from Employees
select * from Employees where FirstName in ('Nancy', 'Robert', 'Anne')
select * from Employees where FirstName not in ('Nancy', 'Robert', 'Anne')
select top 1 rtrim(FirstName) as First_Name from Employees
select rtrim(FirstName) as First_Name from Employees
select LTRIM(FirstName) as [First Name] from Employees
select FirstName,BirthDate,
case
    when DATEPART(year,BirthDate)  = 1928 then 'Eligible For Admission'
	when DATEPART(year,BirthDate) between 1952 and 1963 then 'Not Eligible For Admission'
end
as [ Birth Year]
from Employees

select 'Hello! ' + FirstName + ' How are You? ' from Employees
select COUNT(*)[Total Prices Greater Than 40] from Products  where Price > 40 
select *  from Products where Price > 40
select count(*)[Total Prices Smaller Than 25] from Products  where Price < 25
select * from Products where Price between 30 and 60

-- set 5 --
select * from Employees_Tbl
select City, sum(Salary) [Total Salary] from Employees_Tbl
group by City

select City, sum(Salary) [Total Salary] from Employees_Tbl
group by City
order by [Total Salary] asc

select City, sum(Salary) [Total Salary] from Employees_Tbl
group by City
order by [Total Salary] desc

select City,count(City) as [Total No Of Cities],sum(Salary) as [Total Salary]
from Employees_Tbl
group by City

select City,count(*) as [Total No Of Cities],sum(Salary) as [Total Salary]
from Employees_Tbl
group by City

select City , avg(Salary) as [Avg Salary] from Employees_Tbl
group by City 
order by [Avg Salary] asc

select City , max(Salary) as [Maximun Salary] from Employees_Tbl
group by City 
order by [Maximun Salary] asc

select City , min(Salary) as [Minimun Salary] from Employees_Tbl
group by City 
order by [Minimun Salary] asc

select City, count(*) [Number Of Employees]from Employees_Tbl
group by City 
having  count(*) > 1

--Set 6----
select * from Employees where EmployeeID < 1
select * from Products where ProductID < 1

select A.LastName, convert(varchar(50),A.BirthDate,107) [Birth Date], B.ProductName from Employees A
inner join Products B 
on A.EmployeeID = B.ProductID 
order by A.FirstName

select A.LastName,  B.ProductName from Employees A
left outer join Products B 
on A.EmployeeID = B.ProductID 
order by A.FirstName

select isnull(A.FirstName,'-Invalid Employee-') as [FirstName],  B.ProductName from Employees A
right outer join Products B 
on A.EmployeeID = B.ProductID 
order by A.FirstName

select A.ProductName, B.EmployeeID from Products A
left outer join Employees B
on A.ProductID = B.EmployeeID
order by B.FirstName

select A.ProductName, B.EmployeeID from Products A
full outer join Employees B
on A.ProductID = B.EmployeeID
order by B.FirstName

select A.FirstName, isnull(B.ProductName,'No Product Assign')  from Employees A
right outer join Products B
on A.EmployeeID = B.ProductID
where B.ProductName is null

select A.ProductName,B.EmployeeID from Products A
right outer join Employees B
on A.ProductID = B.EmployeeID

select * from OrderDetails
select A.FirstName, B.Quantity from Employees A
left join OrderDetails B
on A.EmployeeID = B.ProductID
where B.Quantity > 10

create table EmployeeDetailTable
(
EmployeeID int primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
Salary varchar(50),
JoiningDate datetime,
Department varchar(50),
Gender varchar(50)
)
--Set 8--
select $
--110) D 109) A 108) A 107) A 106) A 105) C 104) D 103) B 102) B 101) C 100) C 99) A 98) D 97) A 96) C
--95) C 94) C 93) D 92) B 91) A 90) A 89) C 88) D 87) A 86) D 85) C 84) D 83) B
SELECT 0/9
SELECT 0/0
SELECT 6/0
SELECT SUM(NULL)
SELECT SUM('1')
SELECT SUM(1)
SELECT 1 WHERE NULL = NULL
SELECT NULL + '1'
SELECT NULL + 5
SELECT '1' + 1
SELECT 1 + '1'
select count(*)
select count('7')
SELECT 'VIKAS' + 1SELECT 'VIKAS' + '1'SELECT (SELECT 'VIKAS')--SELECT SELECT 'VIKAS'--SELECT * FROM 'Country'SELECT COUNT(*) + COUNT(*)SELECT SUM(1+2*3)SELECT MAX(1+2*3)--SELECT MAX(1,3,4)SELECT MAX('VIKAS')--Set-10:  --Write down the query to display all employee name in one cell seprated by ',' SELECT UPPER(SUBSTRING(FirstName,1,1))+LOWER(SUBSTRING(FirstName,2,LEN(FirstName)-
1)) AS [FirstName] from EmployeesSELECT STRING_AGG(FirstName, ', ') AS AllFirstNames
FROM Employees;
--By using Functiondeclare @name varchar(max) = ''select @name = @name + FirstName + ',' from Employees select STRING_AGG(@name,',') [All First Names]--Write down the query to get ProjectName and respective EmployeeName(firstname) which are working on the project,
--if more then one employee working on same project, then it should be in same cell seprated by comma
--for example :- Task Tracker : Vikas, Ashishselect * from Customers--Set 13------How to select random record form a table?select  top 1 * from Employees order by NEWID()--Suppose that you have table Employee with a column EName which contain 
update Customers set CustomerName = (casewhen CustomerName = 'London' then 'Dubai'when CustomerName = 'Dubai' then 'London'else CustomerNameend)select Customers.CustomerName from Customers where CustomerName = 'Dubai' or  CustomerName = 'London'--Write a query to create a clone of existing table without using Create Command.select * into Customers_Clone from Customers where  1 = 2select top 0 * into Customers_Clone1 from Customers
--Write a query to print 1 to 100 in sql server without using loops?
;WITH CTE
AS
(
SELECT 1 [Sequence]
UNION ALL
SELECT [Sequence] + 1 FROM CTE WHERE [Sequence] <100
)
SELECT * FROM CTE

;with ETC 
as
(
select 1 [sequence 1 TO 101]
union all
select [sequence 1 TO 101] + 1 from ETC where [sequence 1 TO 101] < 101
)
select * from ETC

--by using loop
declare @num int
set @num = 0
while (@num < 100)
begin
select @num = @num + 1
print @num
end

declare @num2 int
set @num2 = 0
while (@num2 < 1000)
begin
select @num2 = @num2 + 1
print @num2
end

-- Write a query to calculate number of A in string 'VIKASAAA'?
select len('VIKASAAA')- len(REPLACE('VIKASAAA','A','')) as [Total Characters]
--select * from (select 1 union all select 2)     (thorws an error)
SELECT SUM(A) AS [Sum] FROM ( SELECT 1 A UNION ALL SELECT NULL A) M
SELECT CAST(4 AS float) / CAST(2 AS float)

--SET 14 (Question / Answers) (44 t0 46)
create table Test(Id int)
go
begin tran t1
insert into Test values (1)

begin tran t2
insert into Test values (2)

begin tran t3
insert into Test values (3)
update test set Id = 4 where Id = 3

rollback tran t3
rollback tran t2

commit tran t1

select * from test 

--SET 15 (Question / Answers) (47 to 49)
-- creating nested views
create view vw_Products_1
with encryption
as
select * from Employees
create view vw_products2
with encryption
as
select * from vw_Products_1
create view vw_Products_3
as
select * from vw_products2

select * from vw_Products_3

-- To check dependencies there is a system-supplied stored procedure, sp_depends, which will list all dependent objects for the object name you pass in.
sp_depends Customers
sp_depends Employees
sp_depends Shippers
sp_depends Orders
sp_depends OrderDetails
sp_depends Products
sp_depends Suppliers
sp_depends Categories
sp_refreshsqlmodule [dbo.Vw_CustomerDetails]

-- What is the purpose of the WITH SCHEMABINDING clause and where can it be 
--used?
--Ans: WITH SCHEMABINDING can be used in Views and T-SQL Functions.
-- Objects that are schema bound can have their definition changed, but objects that are 
-- referenced by schema bound objects cannot have their definition changed.
-- Schema binding effectively states that the meta-data which is created at object creation 
-- time can then be relied upon to be accurate at all times, and use of sp_refreshsqlmodule is 
-- not necessary. Schema binding can also significantly increase the performance of user 
-- defined functions in SQL Server 2005 and above. However, caution should be applied, as 
-- this is definitely not always the case.

create view Vw_ProductsSchemaBinding
WITH SCHEMABINDING
AS
Select ProductName, Price from [Products].[Products]

--set No#16  (Question / Answers) (49)
create index Ix_Products_Price1
on Products (Price asc)

select * from Products where Price Between 34 and 50

select * from Customers
create index Ix_Customers_CustomerID_PostalCode
on Customers (Country asc, PostalCode asc)
select * from Customers where PostalCode = 5021 and Country = 'Mexico'

create unique index Ix_Customers_PostalCode
on Customers (PostalCode asc)


