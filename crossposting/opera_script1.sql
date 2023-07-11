--create a clone table from Opera
use CrossPosting_test2;
SELECT *
INTO Opera0
FROM Opera;
ALTER TABLE Opera0
ADD CONSTRAINT Opera0_PK UNIQUE (Hotel, TRX_NO);