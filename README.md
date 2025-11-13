# HDFC Bank MySQL Database Project

A professionally structured MySQL database project designed to simulate core banking operations for **HDFC Bank**, including customer management, accounts, transactions, loans, and credit cards.  
This project is ideal for learning relational database design, SQL queries, normalization, and data handling in real-world financial systems.

---

## 🚀 Features

### ✔ Well-designed relational schema  
Covers essential banking modules:
- **Branches**
- **Customers**
- **Accounts**
- **Transactions**
- **Loans**
- **Credit Cards**

### ✔ Realistic sample data  
Includes customer profiles, account balances, card details, loans, and transaction records.

### ✔ Clean, readable SQL  
- Proper use of primary and foreign keys  
- Normalized structure  
- Clear naming conventions  
- Accurate datatypes for banking operations  

### ✔ Practical queries  
Ideal for:
- College DBMS projects  
- SQL practice  
- Interviews & demos  
- Building backend systems

---

## 🗂️ Database Structure (Overview)

| Table Name      | Description |
|-----------------|-------------|
| **Branches**        | Stores branch details and contact info |
| **Customers**       | Customer personal + banking details |
| **Accounts**        | Savings, current, FD, RD account info |
| **Transactions**    | Deposits, withdrawals, transfers, payments |
| **Loans**           | Home, personal, car, education, business loans |
| **Credit_Cards**    | Card type, limit, outstanding balance |

---

## 🛠️ How to Run This Project

### **1. Install MySQL**
Download from:  
https://dev.mysql.com/downloads/

### **2. Import the database**
Open terminal and run:

```bash
mysql -u root -p < DB.sql
