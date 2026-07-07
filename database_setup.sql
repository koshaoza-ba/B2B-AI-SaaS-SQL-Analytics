-- DELETE TABLES IF THEY ALREADY EXIST (CLEAN START)
DROP TABLE IF EXISTS ai_usage_logs;
DROP TABLE IF EXISTS companies;

-- 1. CREATE THE COMPANIES TABLE
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    tier VARCHAR(20),            
    monthly_contract_value INT   
);

-- 2. CREATE THE LOGS TABLE 
CREATE TABLE ai_usage_logs (
    log_id INT PRIMARY KEY,
    company_id INT REFERENCES companies(company_id),
    usage_date DATE,
    tokens_consumed INT,         
    api_call_status VARCHAR(20)  
);

-- 3. INSERT EXPANDED METRIC DATA
INSERT INTO companies VALUES 
(1, 'TechCorp Solutions', 'Enterprise', 5000),
(2, 'Alpha AI Inc', 'Growth', 2000),
(3, 'Delta Consulting', 'Startup', 500),
(4, 'BetaData Systems', 'Enterprise', 4500),
(5, 'Apex Global', 'Growth', 2200),
(6, 'Quantum Tech', 'Startup', 450);

INSERT INTO ai_usage_logs VALUES
-- May 2026 Baseline Data
(1, 1, '2026-05-10', 80000, 'Success'),
(2, 2, '2026-05-11', 40000, 'Success'),
(3, 3, '2026-05-12', 12000, 'Success'),
(4, 4, '2026-05-13', 75000, 'Success'),
(5, 5, '2026-05-14', 38000, 'Success'),
(6, 6, '2026-05-15', 8000, 'Success'),
-- June 2026 Target Analysis Data
(7, 1, '2026-06-10', 35000, 'Success'),  -- CHURN RISK: TechCorp usage dropped by >50%
(8, 2, '2026-06-11', 42000, 'Success'),  
(9, 3, '2026-06-12', 95000, 'Success'),  -- REVENUE LEAKAGE: Delta (Startup) is using Enterprise-level tokens
(10, 4, '2026-06-13', 78000, 'Success'), 
(11, 5, '2026-06-14', 15000, 'Success'), -- CHURN RISK: Apex Global usage dropped by >50%
(12, 6, '2026-06-15', 9000, 'Success');
