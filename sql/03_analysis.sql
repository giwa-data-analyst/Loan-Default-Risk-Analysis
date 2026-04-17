
-- LOAN DEFAULT ANALYSIS

-- 1. Overall Default Rate
-- ------------------------
SELECT 
COUNT(*) AS total_loans,
SUM(default_flag) AS total_defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate_percent
FROM loans_clean;


-- 2. Default Rate by Credit Score (FICO)
-- ---------------------------------------
SELECT 
CASE 
    WHEN fico < 650 THEN 'Low'
    WHEN fico BETWEEN 650 AND 700 THEN 'Medium'
    ELSE 'High'
END AS fico_category,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate
FROM loans_clean
GROUP BY fico_category
ORDER BY default_rate DESC;


-- 3. Default Rate by Loan Purpose
-- ---------------------------------
SELECT 
purpose,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate
FROM loans_clean
GROUP BY purpose
ORDER BY default_rate DESC;


-- 4. Income vs Default
-- ----------------------------
SELECT 
CASE 
    WHEN log_annual_inc < 10 THEN 'Low Income'
    WHEN log_annual_inc BETWEEN 10 AND 11 THEN 'Medium Income'
    ELSE 'High Income'
END AS income_group,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate
FROM loans_clean
GROUP BY income_group
ORDER BY default_rate DESC;


-- 5. DTI (Debt-to-Income) Risk Analysis
-- ----------------------------------------------
SELECT 
CASE 
    WHEN dti < 10 THEN 'Low DTI'
    WHEN dti BETWEEN 10 AND 20 THEN 'Medium DTI'
    ELSE 'High DTI'
END AS dti_group,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults,
ROUND(SUM(default_flag)*100.0 / COUNT(*),2) AS default_rate
FROM loans_clean
GROUP BY dti_group
ORDER BY default_rate DESC;

