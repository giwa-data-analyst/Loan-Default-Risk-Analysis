SELECT 
COUNT(*) AS total_rows,
COUNT(*) FILTER (WHERE fico IS NULL) AS missing_fico,
COUNT(*) FILTER (WHERE int_rate IS NULL) AS missing_int_rate
FROM loans_clean;
