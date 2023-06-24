-- this script add a primary key to the symphony table
USE [CrossPosting_test2]
GO
ALTER TABLE symphony
ADD uniq int NOT NULL default 0;