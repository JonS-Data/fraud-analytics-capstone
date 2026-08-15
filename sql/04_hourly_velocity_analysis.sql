SELECT
  EXTRACT(HOUR FROM CAST(Transaction_Time AS TIME)) AS transaction_hour,
  COUNT(*) AS total_transactions,
  SUM(Fraud_Flag) AS total_fraud_cases,
  ROUND(SUM(Fraud_Flag) * 100.0 / COUNT(*), 2) AS fraud_rate_pct,
  ROUND(SUM(Purchase_Amount), 2) AS total_sales_volume,
  ROUND(AVG(Purchase_Amount), 2) AS avg_sales_amount
FROM `fraud_analysis.fraud_records`
GROUP BY transaction_hour
ORDER BY transaction_hour ASC;
