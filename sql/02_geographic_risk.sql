SELECT
  Location,
  COUNT(*) AS total_transactions,
  SUM(Fraud_Flag) AS total_fraud_cases,
  ROUND(SUM(Fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_pct,
  COUNTIF(Customer_Age IS NULL) AS missing_age_count,
  ROUND(COUNTIF(Customer_age IS NULL) * 100 / COUNT(*), 2) AS missing_age_pct,
  ROUND(SUM(Purchase_Amount), 2) AS total_sales_volume,
  ROUND(AVG(Purchase_Amount), 2) AS avg_sales_amount
FROM `fraud_analysis.fraud_records`
GROUP BY Location
ORDER BY total_fraud_cases DESC, total_transactions DESC;
