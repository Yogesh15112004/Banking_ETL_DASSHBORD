CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(100) NOT NULL,
    ACCOUNT_TYPE VARCHAR2(50),
    BRANCH_NAME VARCHAR2(100),
    CUSTOMER_STATUS VARCHAR2(20)
);

CREATE TABLE ACCOUNT (
    ACCOUNT_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    ACCOUNT_NUMBER VARCHAR2(30) UNIQUE,
    ACCOUNT_BALANCE NUMBER(12,2),
    ACCOUNT_STATUS VARCHAR2(20),

    CONSTRAINT FK_CUSTOMER
    FOREIGN KEY (CUSTOMER_ID)
    REFERENCES CUSTOMER(CUSTOMER_ID)
);

CREATE TABLE BANK_TRANSACTION (
    TRANSACTION_ID NUMBER PRIMARY KEY,
    ACCOUNT_ID NUMBER,
    TRANSACTION_AMOUNT NUMBER(12,2),
    TRANSACTION_DATE DATE,
    TRANSACTION_TYPE VARCHAR2(20),

    CONSTRAINT FK_ACCOUNT
    FOREIGN KEY (ACCOUNT_ID)
    REFERENCES ACCOUNT(ACCOUNT_ID)
);

CREATE TABLE FRAUD_ALERT (
    ALERT_ID NUMBER PRIMARY KEY,
    TRANSACTION_ID NUMBER,
    FRAUD_REASON VARCHAR2(200),
    FRAUD_SCORE NUMBER(5,2),
    ALERT_STATUS VARCHAR2(20)
);

CREATE TABLE RECONCILIATION_ISSUE (
    ISSUE_ID NUMBER PRIMARY KEY,
    TRANSACTION_ID NUMBER,
    SOURCE_SYSTEM VARCHAR2(100),
    ISSUE_DESCRIPTION VARCHAR2(300),
    ISSUE_STATUS VARCHAR2(20)
);

CREATE TABLE REJECT_TRANSACTIONS (
    TRANSACTION_ID NUMBER,
    ERROR_MESSAGE VARCHAR2(300),
    REJECT_DATE DATE DEFAULT SYSDATE
);

CREATE TABLE ETL_AUDIT_LOG (
    LOAD_ID NUMBER,
    MAPPING_NAME VARCHAR2(100),
    TOTAL_RECORDS NUMBER,
    SUCCESS_RECORDS NUMBER,
    FAILED_RECORDS NUMBER,
    LOAD_DATE DATE
);

CREATE TABLE BRANCH_TRANSACTION_SUMMARY (
    BRANCH_NAME VARCHAR2(100),
    TOTAL_TRANSACTIONS NUMBER,
    TOTAL_AMOUNT NUMBER(12,2),
    AVERAGE_AMOUNT NUMBER(12,2),
    MAX_TRANSACTION NUMBER(12,2)
);

CREATE INDEX IDX_ACCOUNT_ID
ON BANK_TRANSACTION(ACCOUNT_ID);

CREATE INDEX IDX_TRANSACTION_DATE
ON BANK_TRANSACTION(TRANSACTION_DATE);

CREATE INDEX IDX_CUSTOMER_ID
ON ACCOUNT(CUSTOMER_ID);

SELECT TABLE_NAME
FROM USER_TABLES;

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO CUSTOMER (
            CUSTOMER_ID,
            CUSTOMER_NAME,
            ACCOUNT_TYPE,
            BRANCH_NAME,
            CUSTOMER_STATUS
        )
        VALUES (
            i,
            'Customer_' || i,

            CASE
                WHEN MOD(i,2)=0 THEN 'Savings'
                ELSE 'Current'
            END,

            CASE
                WHEN MOD(i,5)=0 THEN 'Chennai'
                WHEN MOD(i,5)=1 THEN 'Bangalore'
                WHEN MOD(i,5)=2 THEN 'Hyderabad'
                WHEN MOD(i,5)=3 THEN 'Mumbai'
                ELSE 'Delhi'
            END,

            CASE
                WHEN MOD(i,10)=0 THEN 'INACTIVE'
                ELSE 'ACTIVE'
            END
        );

    END LOOP;

    COMMIT;
END;
/
BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO ACCOUNT (
            ACCOUNT_ID,
            CUSTOMER_ID,
            ACCOUNT_NUMBER,
            ACCOUNT_BALANCE,
            ACCOUNT_STATUS
        )
        VALUES (
            i,
            i,
            'ACC' || TO_CHAR(100000+i),

            CASE
                WHEN MOD(i,20)=0 THEN -5000
                ELSE ROUND(DBMS_RANDOM.VALUE(1000,500000),2)
            END,

            CASE
                WHEN MOD(i,15)=0 THEN 'CLOSED'
                ELSE 'ACTIVE'
            END
        );

    END LOOP;

    COMMIT;
END;
/

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO BANK_TRANSACTION (
            TRANSACTION_ID,
            ACCOUNT_ID,
            TRANSACTION_AMOUNT,
            TRANSACTION_DATE,
            TRANSACTION_TYPE
        )
        VALUES (
            i,

            MOD(i,300)+1,

            CASE
                WHEN MOD(i,25)=0 THEN -2500
                WHEN MOD(i,20)=0 THEN 250000
                ELSE ROUND(DBMS_RANDOM.VALUE(500,75000),2)
            END,

            SYSDATE - MOD(i,90),

            CASE
                WHEN MOD(i,2)=0 THEN 'CREDIT'
                ELSE 'DEBIT'
            END
        );

    END LOOP;

    COMMIT;
END;
/

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO FRAUD_ALERT (
            ALERT_ID,
            TRANSACTION_ID,
            FRAUD_REASON,
            FRAUD_SCORE,
            ALERT_STATUS
        )
        VALUES (
            i,

            i,

            CASE
                WHEN MOD(i,20)=0 THEN 'High Value Transaction'
                WHEN MOD(i,25)=0 THEN 'Negative Transaction'
                ELSE 'Suspicious Pattern'
            END,

            ROUND(DBMS_RANDOM.VALUE(40,100),2),

            CASE
                WHEN MOD(i,5)=0 THEN 'OPEN'
                ELSE 'RESOLVED'
            END
        );

    END LOOP;

    COMMIT;
END;
/

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO RECONCILIATION_ISSUE (
            ISSUE_ID,
            TRANSACTION_ID,
            SOURCE_SYSTEM,
            ISSUE_DESCRIPTION,
            ISSUE_STATUS
        )
        VALUES (
            i,

            i,

            CASE
                WHEN MOD(i,2)=0 THEN 'API_SYSTEM'
                ELSE 'CORE_BANKING'
            END,

            CASE
                WHEN MOD(i,10)=0 THEN 'Amount Mismatch'
                WHEN MOD(i,15)=0 THEN 'Missing Transaction'
                ELSE 'Duplicate Entry'
            END,

            CASE
                WHEN MOD(i,4)=0 THEN 'OPEN'
                ELSE 'CLOSED'
            END
        );

    END LOOP;

    COMMIT;
END;
/

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO ETL_AUDIT_LOG (
            LOAD_ID,
            MAPPING_NAME,
            TOTAL_RECORDS,
            SUCCESS_RECORDS,
            FAILED_RECORDS,
            LOAD_DATE
        )
        VALUES (
            i,

            'MAPPING_' || i,

            300,

            ROUND(DBMS_RANDOM.VALUE(250,300)),

            ROUND(DBMS_RANDOM.VALUE(0,50)),

            SYSDATE - MOD(i,30)
        );

    END LOOP;

    COMMIT;
END;
/

INSERT INTO BRANCH_TRANSACTION_SUMMARY
(
    BRANCH_NAME,
    TOTAL_TRANSACTIONS,
    TOTAL_AMOUNT,
    AVERAGE_AMOUNT,
    MAX_TRANSACTION
)

SELECT
    C.BRANCH_NAME,
    COUNT(BT.TRANSACTION_ID),
    SUM(BT.TRANSACTION_AMOUNT),
    AVG(BT.TRANSACTION_AMOUNT),
    MAX(BT.TRANSACTION_AMOUNT)

FROM CUSTOMER C
JOIN ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID

JOIN BANK_TRANSACTION BT
ON A.ACCOUNT_ID = BT.ACCOUNT_ID

GROUP BY C.BRANCH_NAME;

COMMIT;


SELECT COUNT(*) FROM CUSTOMER;

SELECT COUNT(*) FROM ACCOUNT;

SELECT COUNT(*) FROM BANK_TRANSACTION;

SELECT COUNT(*) FROM FRAUD_ALERT;

SELECT COUNT(*) FROM RECONCILIATION_ISSUE;

SELECT COUNT(*) FROM ETL_AUDIT_LOG;


CREATE TABLE API_TRANSACTION (
    API_TRANSACTION_ID NUMBER PRIMARY KEY,
    ACCOUNT_ID NUMBER,
    TRANSACTION_AMOUNT NUMBER(12,2),
    TRANSACTION_DATE DATE,
    TRANSACTION_TYPE VARCHAR2(20)
);

BEGIN
    FOR i IN 1..300 LOOP

        INSERT INTO API_TRANSACTION (
            API_TRANSACTION_ID,
            ACCOUNT_ID,
            TRANSACTION_AMOUNT,
            TRANSACTION_DATE,
            TRANSACTION_TYPE
        )
        VALUES (
            i,

            MOD(i,300)+1,

            CASE
                WHEN MOD(i,10)=0 THEN 999999
                ELSE ROUND(DBMS_RANDOM.VALUE(500,75000),2)
            END,

            SYSDATE - MOD(i,30),

            CASE
                WHEN MOD(i,2)=0 THEN 'CREDIT'
                ELSE 'DEBIT'
            END
        );

    END LOOP;

    COMMIT;
END;
/