-- this script add a primary key to the symphony table
USE [CrossPosting_test2]
GO
ALTER TABLE symphony
ADD uniq int NOT NULL default 0;

WITH CTE AS (
    SELECT uniq, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM symphony
)
UPDATE CTE
SET uniq = rn;

ALTER TABLE Symphony
ADD CONSTRAINT PK_Symphony PRIMARY KEY (uniq);
