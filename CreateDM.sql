--Script to create Dimension and facts
--Product
CREATE TABLE [dbo].[dim_product](
	[product_ident] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[discontinued] [bit] NOT NULL
) ON [PRIMARY]


--Supplier


CREATE TABLE [dbo].[dim_supplier](
	[supplier_ident] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[supplier_name] [varchar](255) NOT NULL,
	[supplier_city] [varchar](255) NULL,
	[country] [varchar](255) NULL
) ON [PRIMARY]

--Employee
CREATE TABLE [dbo].[dim_employee](
	[employee_ident] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[employee_name] [varchar](85) NOT NULL,
	[employee_city] [varchar](255) NULL,
	[employee_country] [varchar](255) NULL
) ON [PRIMARY]

--Customers
CREATE TABLE [dbo].[dim_customer](
	[customer_ident] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [varchar](20) NOT NULL,
	[customer_name] [varchar](255) NOT NULL,
	[customer_city] [varchar](255) NULL,
	[customer_country] [varchar](255) NULL
) ON [PRIMARY]



-- Date
--refer file
-- Fact table
CREATE TABLE [dbo].[fact_sales](
	[customer_ident] [int] NOT NULL,
	[product_ident] [int] NOT NULL,
	[employee_ident] [int] NOT NULL,
	[supplier_ident] [int] NOT NULL,
	[total_sale] [smallmoney] NOT NULL,
	[DateKey] [int] NOT NULL
) ON [PRIMARY]


