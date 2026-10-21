USE BarbershopAnalytics;
GO
--CREATE SCHEMAS

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE (name) = 'Bronze')
BEGIN
	EXEC('CREATE SCHEMA bronze')
END;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE (name) = 'staging')
BEGIN
	EXEC('CREATE SCHEMA staging')
END;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE (name) = 'dw')
BEGIN
	EXEC('CREATE SCHEMA dw')
END;
GO

--create tables
IF OBJECT_ID('bronze.customers_raw', 'U') IS NOT NULL
	DROP TABLE bronze.customers_raw;
	GO

CREATE TABLE bronze.customers_raw(
customer_id VARCHAR(50),
first_name VARCHAR(200),
last_name VARCHAR(50),
phone_number VARCHAR(50),
email VARCHAR(50),
gender VARCHAR(50),
city VARCHAR(50),
province VARCHAR(50),
signup_date VARCHAR(50),
source_file_name VARCHAR(200),
loaded_at DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.barbers_raw', 'U') IS NOT NULL
	DROP TABLE bronze.barbers_raw;
GO

CREATE TABLE bronze.barbers_raw(
	barber_code VARCHAR(20),
	barber_name VARCHAR(50),
	branch_code VARCHAR(20),
	experience_level VARCHAR(20),
	hire_date VARCHAR(50),
	source_file_name VARCHAR(200),
	loaded_at DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.braches_raw', 'U') IS NOT NULL
	DROP TABLE bronze.braches_raw;
GO

CREATE TABLE bronze.braches_raw(
	branch_code VARCHAR(50),
	branch_neme VARCHAR(200),
	province VARCHAR(100),
	city VARCHAR(100),
	suburb VARCHAR(50),
	source_file_name VARCHAR(200),
	loaded_at DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.services_raw', 'U') IS NOT NULL
	DROP TABLE bronze.services_raw;
GO

CREATE TABLE bronze.services_raw(
	service_code VARCHAR(50),
	service_name VARCHAR(200),
	category VARCHAR(100),
	standard_price VARCHAR(50),
	duration_minutes VARCHAR(50),
	source_file_name VARCHAR(200),
	loaded_at DATETIME2 DEFAULT GETDATE()
);
GO
IF OBJECT_ID('bronze.bookings_raw', 'U') IS NOT NULL
	DROP TABLE bronze.bookings_raw;
GO

CREATE TABLE bronze.bookings_raw(
	booking_id VARCHAR(50),
	customer_id VARCHAR(50),
	barber_code VARCHAR(50),
	service_code VARCHAR(50),
	branch_code VARCHAR(50),
	booking_datetime VARCHAR(50),
	booking_status VARCHAR(50),
	booking_amount VARCHAR(50),
	discount_amount VARCHAR(50),
	tip_amount VARCHAR(50),
	source_file_name VARCHAR(200),
	loaded_at DATETIME2 DEFAULT GETDATE()
 );
 GO

 IF OBJECT_ID('bronze.payments_raw', 'U') IS NOT NULL
	DROP TABLE bronze.payments_raw;
GO

CREATE TABLE bronze.payments_raw(
	paymnet_id VARCHAR(50),
	booking_id VARCHAR(50),
	payment_method VARCHAR(50),
	payment_amount VARCHAR(50),
	payment_status VARCHAR(50),
	payment_datetime VARCHAR(50),
	source_file_name VARCHAR(200),
	loaded_at DATETIME2 DEFAULT GETDATE()
);
GO