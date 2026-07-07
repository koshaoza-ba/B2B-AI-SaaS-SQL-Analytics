WITH MonthlyUsage AS (
    SELECT 
        company_id,
        EXTRACT(MONTH FROM usage_date) as month_num,
        SUM(tokens_consumed) as total_tokens
    FROM ai_usage_logs
    GROUP BY company_id, EXTRACT(MONTH FROM usage_date)
),
UsageTrends AS (
    SELECT 
        company_id,
        month_num,
        total_tokens,
        LAG(total_tokens, 1) OVER (PARTITION BY company_id ORDER BY month_num) as prev_month_tokens
    FROM MonthlyUsage
)
SELECT 
    c.company_name,
    u.total_tokens as june_tokens,
    u.prev_month_tokens as may_tokens,
    ROUND(((u.total_tokens - u.prev_month_tokens)::numeric / u.prev_month_tokens) * 100, 2) as usage_drop_percentage
FROM UsageTrends u
JOIN companies c ON u.company_id = c.company_id
WHERE u.month_num = 6 AND u.total_tokens < (u.prev_month_tokens * 0.5);
