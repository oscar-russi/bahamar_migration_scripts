--add id for stage tables

USE [CrossPosting_test2]
GO

truncate table [stage].[IBS];
alter table [stage].[IBS]
add id int identity(1,1) primary key;

truncate table [stage].[MappingTable];
alter table [stage].[MappingTable]
add id int identity(1,1) primary key;

truncate table [stage].Opera;
alter table [stage].Opera
add id int identity(1,1) primary key;

truncate table [stage].Symphony;
alter table [stage].Symphony
add id int identity(1,1) primary key;

