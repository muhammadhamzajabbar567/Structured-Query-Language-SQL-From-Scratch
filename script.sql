USE [Northwind]
GO
/****** Object:  UserDefinedFunction [dbo].[AddNumbers]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AddNumbers](@num1 int, @num2 int)
returns int
as
begin
     declare @result int
	 set @result = @num1 + @num2
	 return @result
end;
GO
/****** Object:  UserDefinedFunction [dbo].[AddTwoNumbers]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AddTwoNumbers](@a as int, @b as int)
returns int
as 
begin
return (@a + @b)
end
GO
/****** Object:  UserDefinedFunction [dbo].[CheckVotersAge]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- --Scalar Functions With Conditions (if/else)

CREATE function [dbo].[CheckVotersAge](@age int)
returns varchar(100)
as
begin
      declare @str varchar(100)
      if @age >= 18
	  begin
	        set @str = 'You Are Eligible For Vote'
	  end
	  else
	  begin
	         set @str = 'You Are Not Eligible For Vote'
	  end
	  return @str
end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEmployeesByNames]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetEmployeesByNames](@FirstName varchar(100))
returns @mytable table (employee_id int, employee_firstname varchar(100), employee_lastname varchar(100))
as 
begin
      insert into @mytable
	  select EmployeeID,FirstName,LastName from Employees where FirstName = @FirstName
	  return 
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetTodayDate]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetTodayDate]()
returns nvarchar(100)
as
begin
      return getdate()
end
GO
/****** Object:  UserDefinedFunction [dbo].[single_parameter]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[single_parameter](@num int)
returns int
as
begin
      return (@num * @num * @num)
end
GO
/****** Object:  UserDefinedFunction [dbo].[SplitsTwoStrings]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Creating the function (Splite String Values)
create function [dbo].[SplitsTwoStrings](@String as nvarchar(20), @Delemeter as nvarchar(20))
returns @table table(ColumnName  nvarchar(20)not null)
as
begin
insert into @table
select value from string_split(@String,@Delemeter) where value <> ''
return
end
GO
/****** Object:  UserDefinedFunction [dbo].[Take_A_Number]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Take_A_Number]()
returns int
as
begin
      return 100+5
end
GO
/****** Object:  UserDefinedFunction [dbo].[two_parameters]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[two_parameters](@num1 int, @num2 int)
returns int
as
begin
      return (@num1 * @num2 + @num1 - @num2)
end
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Unit] [varchar](25) NULL,
	[Price] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PRODUCTS_DATA]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRODUCTS_DATA]
AS
SELECT ProductID from products
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(10248,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipperID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_CustomerDetails]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_CustomerDetails]
as
select Orders.CustomerID, Orders.OrderDate, Orders.ShipperID,
Customers.CustomerName,Customers.ContactName,
Customers.City,Customers.Country 
from Customers
inner join Orders 
on 
Orders.CustomerID = Customers.CustomerID

GO
/****** Object:  View [dbo].[vW_Products_Orders_Record]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vW_Products_Orders_Record]
as
select A.OrderID, convert(varchar(50),A.OrderDate,107) as [Order Date],A.EmployeeID,A.ShipperID,
B.ProductID,B.ProductName,B.CategoryID,B.Unit,B.Price
from Orders as A
inner join Products as B 
on A.EmployeeID = B.ProductID
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](15) NULL,
	[FirstName] [varchar](15) NULL,
	[BirthDate] [datetime] NULL,
	[Photo] [varchar](25) NULL,
	[Notes] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmployees]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetEmployees]()
returns table
as 
return (select * from Employees)
GO
/****** Object:  UserDefinedFunction [dbo].[get_employee_by_birthdate]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_employee_by_birthdate](@birthdate datetime)
returns table
as
return (select * from Employees where BirthDate = @birthdate)
GO
/****** Object:  View [dbo].[Vw_Employee_Order_Deatails]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_Employee_Order_Deatails] 
as
select A.EmployeeID,B.ProductName, a.OrderDate,B.Price from Products as B
right join Orders as A
on B.ProductID = A.EmployeeID
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](15) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_Suppliers_Orders]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_Suppliers_Orders]
as 
select A.*, B.OrderDate,B.OrderID from Suppliers as A
left join Orders as B
on A.SupplierID = B.ShipperID
where City in ('Londona','New Orleans','Tokyo','Sydney')

GO
/****** Object:  View [dbo].[Brazil Customers]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';
GO
/****** Object:  View [dbo].[Products Higher Than Avg Price]    Script Date: 3/14/2024 11:58:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Products Higher Than Avg Price]
as
select  ProductName, Price, ProductID from Products
where Price > (select avg(Price) from Products)
GO
