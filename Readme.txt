# Banking Transaction Reconciliation & Fraud Monitoring System

## Project Overview

This project demonstrates an enterprise-style Banking ETL and Analytics solution using:

- Oracle Database
- Informatica Intelligent Cloud Services (IICS)
- Power BI
- SQL
- GitHub

The system processes banking transaction data, performs fraud detection, validates reconciliation issues, handles rejected transactions, generates branch-level analytics, and visualizes insights through interactive Power BI dashboards.

---

# Architecture

```text
Oracle Database
        ↓
Informatica IICS ETL
        ↓
Oracle Reporting Tables
        ↓
Power BI Dashboard
```

---

# Business Objective

The objective of this project is to simulate a real-world banking data pipeline capable of:

- Processing banking transactions
- Detecting suspicious/fraudulent activities
- Validating transaction reconciliation
- Identifying invalid/rejected transactions
- Generating branch-level KPIs
- Visualizing banking insights using Power BI

---

# Technologies Used

| Technology | Purpose |
|---|---|
| Oracle Database | Source & Reporting Database |
| Informatica IICS | ETL & Workflow Orchestration |
| SQL | Data Processing |
| Power BI | Dashboard & Analytics |
| GitHub | Version Control |

---

# Database Schema

## Source Tables

### CUSTOMER

Stores customer details.

| Column | Description |
|---|---|
| CUSTOMER_ID | Unique customer ID |
| CUSTOMER_NAME | Customer name |
| ACCOUNT_TYPE | Type of account |
| BRANCH_NAME | Customer branch |
| CUSTOMER_STATUS | Active/Inactive |

---

### ACCOUNT

Stores account information.

| Column | Description |
|---|---|
| ACCOUNT_ID | Unique account ID |
| CUSTOMER_ID | Customer reference |
| ACCOUNT_NUMBER | Account number |
| ACCOUNT_BALANCE | Current balance |
| ACCOUNT_STATUS | Active/Closed |

---

### BANK_TRANSACTION

Stores banking transaction details.

| Column | Description |
|---|---|
| TRANSACTION_ID | Transaction ID |
| ACCOUNT_ID | Account reference |
| TRANSACTION_AMOUNT | Transaction amount |
| TRANSACTION_DATE | Transaction date |
| TRANSACTION_TYPE | Credit/Debit |

---

## Target Tables

### TGT_FRAUD_ALERT

Stores detected fraud records.

### TGT_RECONCILIATION_ISSUE

Stores reconciliation mismatches.

### TGT_REJECT_TRANSACTIONS

Stores invalid/rejected transactions.

### TGT_BRANCH_TRANSACTION_SUMMARY

Stores branch-level aggregated metrics.

---

# ETL Workflow

## 1. Transaction Load Mapping

### Features

- Loads valid transactions
- Rejects invalid records
- Filters closed accounts
- Handles negative transactions

### Transformations Used

- Source
- Expression
- Filter
- Router
- Target

---

## 2. Fraud Detection Mapping

### Features

- Detects suspicious transactions
- Identifies high-value fraud patterns
- Generates fraud scores

### Fraud Conditions

- High transaction amount
- Negative transactions
- Suspicious transaction patterns

### Transformations Used

- Source
- Expression
- Filter
- Target

---

## 3. Reconciliation Mapping

### Features

- Compares transaction records
- Detects mismatches
- Tracks reconciliation failures

### Transformations Used

- Source
- Joiner
- Expression
- Filter
- Target

---

## 4. Branch Performance Mapping

### Features

- Branch-wise aggregation
- Total transactions
- Total transaction amount
- Average transaction amount
- Maximum transaction amount

### Transformations Used

- Source
- Joiner
- Aggregator
- Target

---

# Informatica Taskflow

## Main Taskflow

```text
Start
   ↓
Load_Transactions
   ↓
 ┌───────────────┐
 ↓               ↓
Fraud        Reconciliation
Detection      Process
 └───────┬───────┘
         ↓
Branch_Performance
         ↓
End
```

---

# Power BI Dashboard

## Dashboard Pages

### 1. Executive Summary

KPIs:
- Total Transactions
- Total Fraud Alerts
- Total Reject Transactions
- Total Branches

---

### 2. Fraud Monitoring Dashboard

Visuals:
- Fraud Distribution Pie Chart
- Fraud Score Analysis
- Fraud Reason Analytics

---

### 3. Branch Performance Dashboard

Visuals:
- Branch Transaction Analysis
- Total Amount by Branch
- Branch KPI Tables

---

### 4. Transaction Analytics Dashboard

Visuals:
- Transaction Type Distribution
- Transaction Trend Analysis
- Transaction Volume Monitoring

---

### 5. Customer Analytics Dashboard

Visuals:
- Account Type Analysis
- Customer Status Analysis
- Branch-wise Customer Distribution

---

# Project Features

- Enterprise ETL Workflow
- Fraud Monitoring System
- Banking Reconciliation Engine
- Reject Transaction Handling
- Branch Performance Reporting
- Parallel Workflow Execution
- Interactive Power BI Dashboard
- Oracle Integration
- Informatica Taskflow Orchestration

---

# Folder Structure

```text
BANKING-ETL-IICS-PROJECT/
│
├── SQL/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   ├── validation_queries.sql
│
├── Informatica/
│   ├── Mapping_Screenshots/
│   ├── Taskflow_Screenshots/
│
├── PowerBI/
│   ├── Banking_ETL_Dashboard.pbix
│   ├── Dashboard_Screenshots/
│
├── Documentation/
│   ├── Architecture.png
│   ├── Workflow_Explanation.pdf
│
├── README.md
│
└── Screenshots/
```

---

# Sample Validation Queries

## Fraud Alerts

```sql
SELECT * FROM TGT_FRAUD_ALERT;
```

---

## Reject Transactions

```sql
SELECT * FROM TGT_REJECT_TRANSACTIONS;
```

---

## Branch Performance

```sql
SELECT * FROM TGT_BRANCH_TRANSACTION_SUMMARY;
```

---

# Future Enhancements

- Snowflake Data Warehouse Integration
- Real-Time Streaming ETL
- Predictive Fraud Detection using ML
- Automated Email Notifications
- Role-Based Dashboard Security
- Cloud Deployment
- REST API Integration

---

# Learning Outcomes

This project demonstrates practical experience in:

- ETL Development
- Data Warehousing
- Workflow Orchestration
- Banking Analytics
- Fraud Detection Systems
- Power BI Dashboard Design
- Oracle SQL Development
- Enterprise Data Integration

---

# Conclusion

This project successfully simulates an enterprise banking analytics platform capable of processing transactions, detecting fraud, validating reconciliation issues, generating business KPIs, and visualizing insights using Power BI.

The implementation demonstrates end-to-end ETL architecture using Oracle and Informatica IICS with interactive analytics dashboards.

---

# Author

Yogi

---

# License

This project is developed for educational and portfolio purposes.