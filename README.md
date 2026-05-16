# Banking Analytics Dashboard

## Project Overview

This project is a Banking Analytics Dashboard developed using Power BI to analyze banking transactions, customer behavior, fraud activities, and branch-level financial performance.

The dashboard provides interactive business intelligence insights for banking operations through KPI monitoring, fraud analytics, transaction analysis, and branch performance visualization.

---

# Dashboard Architecture

```text
Banking Dataset
        ↓
Power BI Desktop
        ↓
Interactive Banking Analytics Dashboard
```

---

# Technologies Used

| Technology | Purpose |
|---|---|
| Power BI | Dashboard Development |
| DAX | KPI Calculations |
| SQL Dataset | Banking Transaction Data |
| Data Visualization | Business Intelligence |

---

# Dashboard Features

## Executive KPI Monitoring

The dashboard includes key banking KPIs such as:

- Total Customers
- Total Fraud Accounts
- Total Branches
- Transaction Monitoring

---

# Dashboard Visualizations

## 1. Total Customers KPI

Displays the total number of customers in the banking system.

### Metric

```DAX
Total Customers =
COUNT(CUSTOMER[CUSTOMER_ID])
```

---

## 2. Total Fraud Accounts KPI

Displays the total number of suspicious or fraud-related accounts.

### Metric

```DAX
Total Fraud Accounts =
COUNT(TGT_FRAUD_ALERT[ALERT_ID])
```

---

## 3. Total Branches KPI

Displays the number of banking branches included in the analysis.

### Metric

```DAX
Total Branches =
DISTINCTCOUNT(CUSTOMER[BRANCH_NAME])
```

---

# Dashboard Analytics

## Transaction Type Distribution

### Visualization

- Donut Chart

### Purpose

Analyzes transaction distribution between:

- Credit Transactions
- Debit Transactions

### Insight

Provides understanding of transaction behavior patterns across the banking system.

---

## Transaction Trend Analysis

### Visualization

- Line Chart

### Purpose

Tracks transaction amounts over transaction dates.

### Insight

Identifies transaction spikes, seasonal trends, and transaction flow patterns.

---

## Customer Account Type Analysis

### Visualization

- Horizontal Bar Chart

### Account Types Included

- Current
- Savings

### Purpose

Analyzes customer distribution across account types.

---

## Fraud Reason Analysis

### Visualization

- Pie Chart

### Fraud Categories

- Suspicious Transactions
- High Value Transactions
- Negative Transactions

### Purpose

Analyzes fraud distribution across different fraud categories.

---

## Fraud Account Monitoring

### Visualization

- Horizontal Bar Chart

### Purpose

Displays fraud score analysis for suspicious banking accounts.

### Insight

Identifies high-risk fraud patterns and suspicious account activity.

---

## Branch Transaction Analysis

### Visualization

- Pie Chart

### Branches Included

- Bangalore
- Chennai
- Delhi
- Hyderabad
- Mumbai

### Purpose

Analyzes branch-wise transaction amount contribution.

### Insight

Identifies high-performing banking branches.

---

# Interactive Filters

The dashboard contains dynamic filters for:

| Filter |
|---|
| Branch Name |
| Transaction Type |

These filters allow interactive exploration of dashboard insights.

---

# Dataset Information

The dataset contains banking-related records including:

| Column | Description |
|---|---|
| CUSTOMER_ID | Customer identifier |
| ACCOUNT_TYPE | Savings/Current account |
| BRANCH_NAME | Branch location |
| TRANSACTION_AMOUNT | Transaction value |
| TRANSACTION_DATE | Transaction timestamp |
| TRANSACTION_TYPE | Credit/Debit |
| FRAUD_REASON | Fraud category |
| FRAUD_SCORE | Fraud severity score |

---

# Dashboard Layout

```text
---------------------------------------------------------
| KPI Cards                                              |
---------------------------------------------------------
| Filters | Transaction Trends | Customer Analytics     |
---------------------------------------------------------
| Fraud Analysis | Fraud Accounts | Branch Analytics    |
---------------------------------------------------------
```

---

# Dashboard Preview

## Banking Analytics Dashboard

![Banking Analytics Dashboard](Screenshots/Dashboard.png)

---

# Business Insights Generated

- Transaction behavior monitoring
- Fraud activity analysis
- Branch performance analysis
- Customer account segmentation
- Financial trend monitoring
- Risk and fraud identification
- Branch contribution analysis

---

# Power BI Features Used

- KPI Cards
- Donut Charts
- Pie Charts
- Line Charts
- Bar Charts
- Interactive Filters
- DAX Measures
- Dashboard Themes
- Business Intelligence Visuals

---

# DAX Measures Used

## Total Customers

```DAX
Total Customers =
COUNT(CUSTOMER[CUSTOMER_ID])
```

---

## Total Fraud Accounts

```DAX
Total Fraud Accounts =
COUNT(TGT_FRAUD_ALERT[ALERT_ID])
```

---

## Total Branches

```DAX
Total Branches =
DISTINCTCOUNT(CUSTOMER[BRANCH_NAME])
```

---

## Total Transaction Amount

```DAX
Total Transaction Amount =
SUM(BANK_TRANSACTION[TRANSACTION_AMOUNT])
```

---

# Folder Structure

```text
Banking_Analytics_Dashboard/
│
├── Dataset/
│   └── banking_dataset.csv
│
├── PowerBI/
│   └── Banking_Analytics_Dashboard.pbix
│
├── Screenshots/
│   └── Dashboard.png
│
├── Documentation/
│   └── Project_Architecture.png
│
└── README.md
```

---

# Future Enhancements

- Real-time banking analytics
- Machine learning fraud detection
- Snowflake cloud integration
- Predictive banking analytics
- Automated fraud alerts
- Cloud dashboard deployment
- Advanced customer segmentation

---

# Learning Outcomes

This project demonstrates practical experience in:

- Power BI dashboard development
- Banking analytics
- Fraud monitoring systems
- DAX calculations
- KPI reporting
- Interactive business intelligence dashboards
- Financial data visualization

---

# Conclusion

This project successfully demonstrates a professional Banking Analytics Dashboard capable of monitoring banking transactions, identifying fraud activities, analyzing customer behavior, and generating branch-level business insights using Power BI.

The dashboard provides an interactive and enterprise-style analytics solution for banking operations monitoring.

---

# Author

Yogi

---

# License

This project is created for educational, learning, and portfolio purposes.
