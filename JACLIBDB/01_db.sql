/* Purpose: Create John Abbott Library Database.
Script Date: March 28th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */
 /*
 drop database JAClib
 ;
 go
 */
 create database JAClib
 on primary
 (
	-- rows data logical filename
    name ='JAClibDB',
    -- logical rows data path and filename
    filename ='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JAClibDB.mdf',
    -- logical rows data file size
    size = 12MB,
    -- logical data file growth
    filegrowth = 2MB,
    -- logical rows data file Maximum size
    maxsize = 100MB

 )
 log on
 (
	-- log file name
    name ='JAClibDB_log',
     -- log path and filename
    filename ='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JAClibDB_log.ldf',
     -- log file initial size (1/4 of the rows data size)
    size = 3MB,
    -- log file growth
    filegrowth = 10%,
    -- log file maximum size
    maxsize = 100MB
 );
 go

 use JAClib
 ;
 go

 create schema customer;
 go

 create schema employee;
 go

 create schema material;
 go

