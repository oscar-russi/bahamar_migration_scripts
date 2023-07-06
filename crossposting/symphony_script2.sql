-- this script add a primary key to the symphony table
USE [CrossPosting_test2]
GO
ALTER TABLE symphony0
ADD uniq int NOT NULL default 0;