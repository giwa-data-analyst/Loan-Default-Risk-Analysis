CREATE TABLE loans_clean AS
SELECT *,
CASE 
    WHEN not_fully_paid = 1 THEN 1
    ELSE 0
END AS default_flag
FROM loans_raw;

