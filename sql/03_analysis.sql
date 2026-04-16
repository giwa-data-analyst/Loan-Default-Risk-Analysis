SELECT 
COUNT(*) AS total_loans,
SUM(default_flag) AS total_defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate_percent
FROM loans_clean;
