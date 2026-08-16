# E-Commerce & Retail Fraud Analysis

---

## What This Project Is About

I built this project to analyze **2,133 global retail transactions** to see where fraudulent charges are actually coming from, how much money was lost, and what kind of rules could stop them. 

Instead of jumping straight into a complex ML model, I wanted to focus on core **Fraud Operations & Risk Monitoring**:
* Finding out which cities and customer tiers have the highest fraud rates
* Checking how much dollar volume was lost to fraud
* Seeing if transaction time (velocity) shows bot or card testing behavior
* Cleaning and validating the raw data in BigQuery with SQL
* Building a clean, interactive Tableau dashboard to track everything visually

**Tools Used:** Google BigQuery (SQL), Tableau Public

---

## Questions I Wanted to Answer

1. What is the overall fraud rate and total money lost across the dataset?
2. Are certain cities or loyalty tiers getting hit harder than others?
3. What times of the day see the most fraud activity?
4. Are there any data quality issues or missing values in the raw dataset?
5. What simple rules or step-up verification steps could help prevent these losses?

---

## Dataset Breakdown

The dataset covers retail transactions across 20 global cities:
* **2,133 total rows**
* `Transaction_ID` — Unique ID for the order
* `Customer_ID` — Unique ID for the customer
* `Transaction_Time` — Time the transaction went through
* `Purchase_Amount` — Order value in USD ($)
* `Product_Category` — Type of item bought
* `Location` — City where the transaction happened
* `Device_Type` — Device used (`Desktop`, `Laptop`, `Mobile`, `Tablet`)
* `Customer_Loyalty_Tier` — Customer tier (`Bronze`, `Silver`, `Gold`, `Platinum`, `VIP`)
* `Fraud_Flag` — Target variable (`0 = Normal`, `1 = Fraud`)

---

## Data Quality & Cleaning Checks

Before running the main queries, I ran validation checks in SQL to inspect the data:
* Verified transaction counts and distinct customer IDs
* Checked data types and confirmed `Fraud_Flag` only contained `0` and `1`
* Checked for `NULL` values across demographic fields

**Audit Note:** Found **106 rows missing customer age** (`Customer_Age IS NULL`). Most of these missing values came from transactions in Tokyo (10.53% missing) and Monaco (9.09% missing).

---

## Portfolio Summary

| Metric | Value |
| :--- | :--- |
| **Total Transactions** | 2,133 |
| **Fraud Transactions** | 66 |
| **Fraud Rate (%)** | 3.09% |
| **Total Transaction Volume** | $372,451.82 |
| **Total Fraud Dollar Loss** | $11,005.65 |
| **Economic Fraud Loss Rate** | 2.95% |
| **Average Sales Amount (All Transactions)** | $174.61 |
| **Average Sales Amount (Fraud Only)** | $166.75 |

---

## Key Takeaways

### 1. High-Risk Cities
* **Las Vegas** had the highest fraud rate by far at **7.84%** (more than double the baseline average of 3.09%).
* APAC cities also showed higher risk profiles, including **Shanghai (5.13%)**, **Sydney (4.69%)**, and **Singapore (4.46%)**.
* The lowest-risk cities were **Paris (0.00%)**, **Geneva (0.00%)**, and **Rome (0.93%)**.

### 2. VIP Accounts & Account Takeover (ATO)
* Bronze accounts had the most fraud cases in total (24 cases), which makes sense since it's the largest user group.
* However, **VIP accounts had the highest percentage fraud rate at 5.41%**, pointing to possible targeted account takeover (ATO) attacks.

### 3. Early Morning Spikes
* Fraud jumped noticeably during early morning hours, hitting **7.95% at 4:00 AM** and **5.88% at Midnight**, compared to normal daytime rates (~1.16%–3.85%).

---

## Tableau Dashboard


![Dashboard Preview](assets/dashboard_preview.png)

---

## Helpful Fraud Prevention Suggestions
1. Step Up OTP/2FA Verification: Prompt SMS verification or 2FA on orders over $150 originating from high-risk locations like Las Vegas and APAC hubs
2. Rate Limiting: Add rate limits between 12:00 AM and 5:00 AM to catch automated scripting
3. Helping High Profile: Require re-authentication whenever a VIP user changes their shipping address or places rapid orders.
