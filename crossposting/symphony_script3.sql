-- add unique values for each row in symphony
USE [CrossPosting_test2]
GO

WITH CTE AS (
    SELECT uniq, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM symphony0
)
UPDATE CTE
SET uniq = rn;

ALTER TABLE Symphony0
ADD CONSTRAINT PK_Symphony PRIMARY KEY (uniq);
