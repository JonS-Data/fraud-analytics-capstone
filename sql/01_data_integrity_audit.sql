SELECT 
  COUNT(*) AS total_transactions,
  COUNT(DISTINCT Customer_ID) AS unique_customers,
  SUM(Fraud_Flag) AS total_fraud_cases,
  COUNTIF(Customer_Age IS NULL) AS missing_age_count,
  ROUND(SUM(Fraud_Flag) * 100.0 / COUNT(*), 2) AS overall_fraud_rate_pct
FROM `fraud_analysis.fraud_records`
