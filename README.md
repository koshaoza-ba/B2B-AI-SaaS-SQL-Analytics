# B2B AI-SaaS Product Operations & Revenue Optimization Analytics

## 📌 Project Overview
This project simulates an IT Consulting optimization initiative for a B2B AI-powered Software-as-a-Service (SaaS) application. Using **PostgreSQL**, I engineered a relational database system designed to track enterprise API token consumption logs and align them with monthly recurring revenue contracts.

The objective was to solve two high-priority business threats:
1. **Contract Churn Risk:** Identifying enterprise clients whose product adoption dropped by >50% month-over-month.
2. **Revenue Leakage:** Spotting lower-tier clients exploiting resource parameters beyond contract scope.

## 🛠️ Tech Stack & SQL Concepts Used
- **Database Engine:** PostgreSQL
- **Advanced SQL Mechanics:** Common Table Expressions (CTEs), Window Functions (`LAG()`, `PARTITION BY`), Relational Joins, and Conditional Data Aggregation (`CASE WHEN`).

## 📈 Strategic Business Insights Generated

### 1. Proactive Customer Churn Identification
By executing a window function analysis tracking Month-over-Month (MoM) usage variance, the system successfully flagged accounts experiencing severe usage drops. This data allows Account Managers to intervene before a contract cancellation occurs.

### 2. Operational Revenue Leakage Mitigation
Using conditional logical filters, the framework isolated instances where startup and growth accounts were over-consuming infrastructure computing limits without trigger overage billing—unlocking pipeline upsell conversions.
