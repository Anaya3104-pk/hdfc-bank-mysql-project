CREATE DATABASE  HDFC_Bank;
USE HDFC_Bank;

-- 1. Branches Table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    manager_name VARCHAR(100),
    phone VARCHAR(15)
);

-- 2. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    pin_code VARCHAR(10),
    branch_id INT,
    registration_date DATE,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- 3. Accounts Table
CREATE TABLE Accounts (
    account_number VARCHAR(20) PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Current', 'Fixed Deposit', 'Recurring Deposit') NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    opening_date DATE NOT NULL,
    status ENUM('Active', 'Inactive', 'Closed') DEFAULT 'Active',
    interest_rate DECIMAL(5, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 4. Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer', 'Payment') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    description VARCHAR(200),
    balance_after DECIMAL(15, 2),
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

-- 5. Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type ENUM('Home Loan', 'Personal Loan', 'Car Loan', 'Education Loan', 'Business Loan') NOT NULL,
    loan_amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    tenure_months INT NOT NULL,
    emi_amount DECIMAL(15, 2) NOT NULL,
    loan_date DATE NOT NULL,
    status ENUM('Active', 'Closed', 'Defaulted') DEFAULT 'Active',
    outstanding_amount DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Credit Cards Table
CREATE TABLE Credit_Cards (
    card_number VARCHAR(16) PRIMARY KEY,
    customer_id INT NOT NULL,
    card_type ENUM('Classic', 'Gold', 'Platinum', 'Titanium') NOT NULL,
    credit_limit DECIMAL(15, 2) NOT NULL,
    outstanding_balance DECIMAL(15, 2) DEFAULT 0.00,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    status ENUM('Active', 'Blocked', 'Expired') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert Branches 
INSERT INTO Branches VALUES
(1, 'HDFC Andheri West', 'Mumbai', 'Maharashtra', 'Rajesh Kumar', '022-26732100'),
(2, 'HDFC Connaught Place', 'New Delhi', 'Delhi', 'Priya Sharma', '011-23417800'),
(3, 'HDFC MG Road', 'Bangalore', 'Karnataka', 'Arjun Reddy', '080-25587900'),
(4, 'HDFC Park Street', 'Kolkata', 'West Bengal', 'Amit Banerjee', '033-22297500'),
(5, 'HDFC Anna Salai', 'Chennai', 'Tamil Nadu', 'Lakshmi Iyer', '044-28527200'),
(6, 'HDFC Banjara Hills', 'Hyderabad', 'Telangana', 'Venkat Rao', '040-23547800'),
(7, 'HDFC Navrangpura', 'Ahmedabad', 'Gujarat', 'Neha Patel', '079-26587400'),
(8, 'HDFC Koregaon Park', 'Pune', 'Maharashtra', 'Sandeep Desai', '020-26137900'),
(9, 'HDFC Bandra East', 'Mumbai', 'Maharashtra', NULL, '022-26551234'),
(10, 'HDFC Saket', 'New Delhi', 'Delhi', 'Rohit Malhotra', NULL),
(11, 'HDFC Whitefield', 'Bangalore', 'Karnataka', NULL, '080-28765432'),
(12, 'HDFC Salt Lake', 'Kolkata', 'West Bengal', 'Sunil Ghosh', '033-23456789'),
(13, 'HDFC Adyar', 'Chennai', 'Tamil Nadu', NULL, '044-24567890'),
(14, 'HDFC Madhapur', 'Hyderabad', 'Telangana', 'Priyanka Reddy', '040-67891234'),
(15, 'HDFC Satellite', 'Ahmedabad', 'Gujarat', NULL, NULL),
(16, 'HDFC Viman Nagar', 'Pune', 'Maharashtra', 'Anil Kulkarni', '020-26789012'),
(17, 'HDFC Powai', 'Mumbai', 'Maharashtra', 'Meera Shah', '022-25678901'),
(18, 'HDFC Dwarka', 'New Delhi', 'Delhi', NULL, '011-28901234'),
(19, 'HDFC Indiranagar', 'Bangalore', 'Karnataka', 'Suresh Rao', '080-41234567'),
(20, 'HDFC Rajouri Garden', 'New Delhi', 'Delhi', 'Kavita Singh', '011-25123456');

-- Insert Customers 
INSERT INTO Customers VALUES
(1001, 'Amit', 'Sharma', '1985-03-15', 'Male', 'amit.sharma@email.com', '9876543210', '123 Marine Drive', 'Mumbai', 'Maharashtra', '400001', 1, '2020-01-15'),
(1002, 'Priya', 'Verma', '1990-07-22', 'Female', 'priya.verma@email.com', '9876543211', '45 Connaught Place', 'New Delhi', 'Delhi', '110001', 2, '2019-05-20'),
(1003, 'Rahul', 'Patel', '1988-11-10', 'Male', 'rahul.patel@email.com', '9876543212', '78 MG Road', 'Bangalore', 'Karnataka', '560001', 3, '2021-03-10'),
(1004, 'Sneha', 'Das', '1992-04-18', 'Female', NULL, '9876543213', '56 Park Street', 'Kolkata', 'West Bengal', '700016', 4, '2020-08-25'),
(1005, 'Vikram', 'Singh', '1987-09-05', 'Male', 'vikram.singh@email.com', NULL, '89 Anna Salai', 'Chennai', 'Tamil Nadu', '600002', 5, '2018-12-30'),
(1006, 'Anjali', 'Reddy', '1995-01-30', 'Female', 'anjali.reddy@email.com', '9876543215', NULL, 'Hyderabad', 'Telangana', NULL, 6, '2021-06-15'),
(1007, 'Karan', 'Mehta', '1983-06-12', 'Male', 'karan.mehta@email.com', '9876543216', '67 Navrangpura', 'Ahmedabad', 'Gujarat', '380009', 7, '2019-09-18'),
(1008, 'Pooja', 'Desai', '1991-12-25', 'Female', NULL, '9876543217', '12 Koregaon Park', 'Pune', 'Maharashtra', '411001', 8, '2020-11-22'),
(1009, 'Arjun', 'Nair', NULL, 'Male', 'arjun.nair@email.com', '9876543218', '90 Juhu', 'Mumbai', 'Maharashtra', '400049', 9, '2021-02-28'),
(1010, 'Divya', 'Kapoor', '1993-05-07', 'Female', 'divya.kapoor@email.com', '9876543219', '23 Rohini', 'New Delhi', 'Delhi', '110085', 10, '2020-07-14'),
(1011, 'Sanjay', 'Gupta', '1986-10-20', 'Male', 'sanjay.gupta@email.com', '9876543220', '45 Indiranagar', 'Bangalore', 'Karnataka', '560038', 11, '2019-04-05'),
(1012, 'Kavita', 'Joshi', '1994-02-28', 'Female', NULL, NULL, '78 Salt Lake', 'Kolkata', 'West Bengal', '700091', 12, '2021-01-10'),
(1013, 'Ravi', 'Kumar', '1984-07-16', 'Male', 'ravi.kumar@email.com', '9876543222', '56 T Nagar', 'Chennai', 'Tamil Nadu', '600017', 13, '2018-10-20'),
(1014, 'Neha', 'Agarwal', '1996-03-09', 'Female', 'neha.agarwal@email.com', '9876543223', '89 Gachibowli', 'Hyderabad', 'Telangana', '500032', 14, '2020-09-30'),
(1015, 'Manish', 'Shah', NULL, 'Male', 'manish.shah@email.com', '9876543224', '34 Vastrapur', 'Ahmedabad', 'Gujarat', '380015', 15, '2019-03-12'),
(1016, 'Deepak', 'Sharma', '1989-08-19', 'Male', NULL, '9876543225', NULL, 'Mumbai', 'Maharashtra', NULL, 17, '2020-06-18'),
(1017, 'Anita', 'Singh', '1992-11-05', 'Female', 'anita.singh@email.com', '9876543226', '67 Saket', 'New Delhi', 'Delhi', '110017', 18, '2021-04-22'),
(1018, 'Suresh', 'Patel', '1985-01-30', 'Male', 'suresh.patel@email.com', '9876543227', '89 Whitefield', 'Bangalore', 'Karnataka', '560066', 19, '2019-12-08'),
(1019, 'Meena', 'Verma', NULL, 'Female', NULL, NULL, '12 Adyar', 'Chennai', 'Tamil Nadu', '600020', 13, '2020-03-15'),
(1020, 'Rajesh', 'Kumar', '1987-06-25', 'Male', 'rajesh.kumar@email.com', '9876543228', '34 Madhapur', 'Hyderabad', 'Telangana', '500081', 14, '2021-07-30'),
(1021, 'Priya', 'Sharma', '1994-09-12', 'Female', 'priya.sharma2@email.com', '9876543229', '56 Satellite', 'Ahmedabad', 'Gujarat', '380015', 15, '2020-05-11'),
(1022, 'Rohit', 'Nair', '1990-02-14', 'Male', NULL, '9876543230', '78 Viman Nagar', 'Pune', 'Maharashtra', '411014', 16, '2019-11-25'),
(1023, 'Sneha', 'Patel', '1993-07-08', 'Female', 'sneha.patel@email.com', '9876543231', '90 Powai', 'Mumbai', 'Maharashtra', '400076', 17, '2021-01-17'),
(1024, 'Arun', 'Das', NULL, 'Male', 'arun.das@email.com', NULL, '23 Dwarka', 'New Delhi', 'Delhi', '110075', 18, '2020-08-09'),
(1025, 'Lakshmi', 'Reddy', '1988-04-22', 'Female', 'lakshmi.reddy@email.com', '9876543232', NULL, 'Hyderabad', 'Telangana', NULL, 14, '2019-06-14');

-- Insert Accounts 
INSERT INTO Accounts VALUES
('ACC1001001', 1001, 'Savings', 125000.00, '2020-01-15', 'Active', 3.50),
('ACC1002001', 1002, 'Current', 350000.00, '2019-05-20', 'Active', 2.50),
('ACC1003001', 1003, 'Savings', 85000.00, '2021-03-10', 'Active', 3.50),
('ACC1004001', 1004, 'Fixed Deposit', 500000.00, '2020-08-25', 'Active', 6.50),
('ACC1005001', 1005, 'Savings', 210000.00, '2018-12-30', 'Active', 3.50),
('ACC1006001', 1006, 'Savings', 45000.00, '2021-06-15', 'Active', NULL),
('ACC1007001', 1007, 'Current', 780000.00, '2019-09-18', 'Active', 2.50),
('ACC1008001', 1008, 'Savings', 95000.00, '2020-11-22', 'Active', 3.50),
('ACC1009001', 1009, 'Savings', 165000.00, '2021-02-28', 'Active', 3.50),
('ACC1010001', 1010, 'Recurring Deposit', 30000.00, '2020-07-14', 'Active', 5.50),
('ACC1011001', 1011, 'Current', 420000.00, '2019-04-05', 'Active', 2.50),
('ACC1012001', 1012, 'Savings', 72000.00, '2021-01-10', 'Active', 3.50),
('ACC1013001', 1013, 'Savings', 310000.00, '2018-10-20', 'Active', 3.50),
('ACC1014001', 1014, 'Savings', 28000.00, '2020-09-30', 'Inactive', NULL),
('ACC1015001', 1015, 'Fixed Deposit', 1200000.00, '2019-03-12', 'Active', 6.50),
('ACC1001002', 1001, 'Current', 250000.00, '2021-06-20', 'Active', 2.50),
('ACC1003002', 1003, 'Fixed Deposit', 300000.00, '2022-01-15', 'Active', 6.50),
('ACC1016001', 1016, 'Savings', 55000.00, '2020-06-18', 'Active', 3.50),
('ACC1017001', 1017, 'Savings', 180000.00, '2021-04-22', 'Active', 3.50),
('ACC1018001', 1018, 'Current', 520000.00, '2019-12-08', 'Active', 2.50),
('ACC1019001', 1019, 'Savings', 38000.00, '2020-03-15', 'Inactive', 3.50),
('ACC1020001', 1020, 'Savings', 145000.00, '2021-07-30', 'Active', NULL),
('ACC1021001', 1021, 'Fixed Deposit', 750000.00, '2020-05-11', 'Active', 6.50),
('ACC1022001', 1022, 'Savings', 92000.00, '2019-11-25', 'Active', 3.50),
('ACC1023001', 1023, 'Savings', 115000.00, '2021-01-17', 'Active', 3.50),
('ACC1024001', 1024, 'Current', 280000.00, '2020-08-09', 'Active', 2.50),
('ACC1025001', 1025, 'Savings', 67000.00, '2019-06-14', 'Active', 3.50),
('ACC1005002', 1005, 'Fixed Deposit', 800000.00, '2020-02-20', 'Active', 6.50),
('ACC1007002', 1007, 'Savings', 195000.00, '2021-03-15', 'Active', 3.50),
('ACC1013002', 1013, 'Current', 450000.00, '2020-11-10', 'Active', 2.50);

-- Insert Transactions 
INSERT INTO Transactions VALUES
(5001, 'ACC1001001', 'Deposit', 50000.00, '2024-01-05 10:30:00', 'Salary Credit', 125000.00),
(5002, 'ACC1002001', 'Withdrawal', 25000.00, '2024-01-08 14:20:00', 'ATM Withdrawal', 325000.00),
(5003, 'ACC1003001', 'Deposit', 15000.00, '2024-01-10 09:15:00', 'Cash Deposit', 85000.00),
(5004, 'ACC1005001', 'Payment', 8500.00, '2024-01-12 16:45:00', 'Credit Card Bill', 201500.00),
(5005, 'ACC1007001', 'Deposit', 120000.00, '2024-01-15 11:00:00', 'Business Income', 780000.00),
(5006, 'ACC1008001', 'Withdrawal', 10000.00, '2024-01-18 13:30:00', NULL, 85000.00),
(5007, 'ACC1009001', 'Transfer', 20000.00, '2024-01-20 10:00:00', 'Transfer to Friend', 145000.00),
(5008, 'ACC1011001', 'Deposit', 85000.00, '2024-01-22 15:15:00', 'Project Payment', 420000.00),
(5009, 'ACC1001001', 'Payment', 5000.00, '2024-01-25 12:00:00', 'Utility Bill', 120000.00),
(5010, 'ACC1013001', 'Deposit', 45000.00, '2024-01-28 09:30:00', 'Salary Credit', 310000.00),
(5011, 'ACC1002001', 'Withdrawal', 50000.00, '2024-02-02 14:00:00', 'Business Expense', 300000.00),
(5012, 'ACC1005001', 'Transfer', 15000.00, '2024-02-05 11:20:00', NULL, 195000.00),
(5013, 'ACC1006001', 'Deposit', 12000.00, '2024-02-08 10:45:00', 'Freelance Payment', 45000.00),
(5014, 'ACC1012001', 'Withdrawal', 8000.00, '2024-02-10 16:30:00', 'ATM Withdrawal', 64000.00),
(5015, 'ACC1014001', 'Deposit', 6000.00, '2024-02-12 09:00:00', 'Cash Deposit', 28000.00),
(5016, 'ACC1001002', 'Deposit', 75000.00, '2024-02-15 13:45:00', 'Business Income', 250000.00),
(5017, 'ACC1008001', 'Payment', 3500.00, '2024-02-18 12:15:00', 'Online Shopping', 91500.00),
(5018, 'ACC1009001', 'Deposit', 28000.00, '2024-02-20 10:30:00', NULL, 165000.00),
(5019, 'ACC1003001', 'Withdrawal', 12000.00, '2024-02-22 15:00:00', 'ATM Withdrawal', 73000.00),
(5020, 'ACC1007001', 'Transfer', 35000.00, '2024-02-25 11:45:00', 'Vendor Payment', 745000.00),
(5021, 'ACC1016001', 'Deposit', 8000.00, '2024-03-01 10:20:00', 'Salary Credit', 55000.00),
(5022, 'ACC1017001', 'Withdrawal', 15000.00, '2024-03-03 14:30:00', 'ATM Withdrawal', 165000.00),
(5023, 'ACC1018001', 'Deposit', 95000.00, '2024-03-05 09:45:00', 'Client Payment', 520000.00),
(5024, 'ACC1020001', 'Payment', 4500.00, '2024-03-07 16:15:00', 'Bill Payment', 140500.00),
(5025, 'ACC1022001', 'Deposit', 12000.00, '2024-03-10 11:30:00', 'Cash Deposit', 92000.00),
(5026, 'ACC1023001', 'Withdrawal', 8000.00, '2024-03-12 13:20:00', NULL, 107000.00),
(5027, 'ACC1024001', 'Deposit', 65000.00, '2024-03-15 10:00:00', 'Business Income', 280000.00),
(5028, 'ACC1025001', 'Transfer', 10000.00, '2024-03-18 15:45:00', 'Family Transfer', 57000.00),
(5029, 'ACC1001001', 'Deposit', 50000.00, '2024-03-20 09:30:00', 'Salary Credit', 170000.00),
(5030, 'ACC1003001', 'Deposit', 18000.00, '2024-03-22 14:15:00', 'Freelance Income', 91000.00),
(5031, 'ACC1005002', 'Deposit', 100000.00, '2024-03-25 10:45:00', NULL, 800000.00),
(5032, 'ACC1007002', 'Withdrawal', 12000.00, '2024-03-28 13:00:00', 'ATM Withdrawal', 183000.00),
(5033, 'ACC1013002', 'Deposit', 80000.00, '2024-04-01 11:20:00', 'Contract Payment', 450000.00),
(5034, 'ACC1011001', 'Payment', 25000.00, '2024-04-03 16:30:00', 'Vendor Payment', 395000.00),
(5035, 'ACC1017001', 'Deposit', 35000.00, '2024-04-05 09:15:00', 'Salary Credit', 200000.00);

-- Insert Loans 
INSERT INTO Loans VALUES
(2001, 1001, 'Home Loan', 5000000.00, 8.50, 240, 43391.00, '2020-06-15', 'Active', 4750000.00),
(2002, 1002, 'Car Loan', 800000.00, 9.25, 60, 16652.00, '2021-03-20', 'Active', 650000.00),
(2003, 1003, 'Personal Loan', 300000.00, 11.50, 36, 9891.00, '2022-01-10', 'Active', 220000.00),
(2004, 1005, 'Home Loan', 7500000.00, 8.25, 300, 57896.00, '2019-08-25', 'Active', 7100000.00),
(2005, 1007, 'Business Loan', 2000000.00, 10.75, 84, 31245.00, '2020-11-30', 'Active', 1650000.00),
(2006, 1008, 'Education Loan', 1200000.00, 9.50, 120, 15238.00, '2021-07-15', 'Active', NULL),
(2007, 1009, 'Car Loan', 1200000.00, 9.00, 60, 24885.00, '2022-03-05', 'Active', 980000.00),
(2008, 1011, 'Home Loan', 6000000.00, 8.40, 240, 49473.00, '2020-02-20', 'Active', 5650000.00),
(2009, 1013, 'Personal Loan', 500000.00, 11.25, 48, 13072.00, '2021-09-10', 'Active', 380000.00),
(2010, 1015, 'Business Loan', 3500000.00, 10.50, 96, 54123.00, '2020-05-18', 'Active', 2950000.00),
(2011, 1016, 'Personal Loan', 250000.00, 11.75, 24, 11875.00, '2021-08-12', 'Closed', 0.00),
(2012, 1017, 'Car Loan', 950000.00, 9.15, 60, 19728.00, '2022-01-05', 'Active', 820000.00),
(2013, 1018, 'Home Loan', 4500000.00, 8.35, 240, 37125.00, '2020-10-18', 'Active', NULL),
(2014, 1020, 'Education Loan', 800000.00, 9.25, 96, 10238.00, '2021-11-22', 'Active', 680000.00),
(2015, 1021, 'Personal Loan', 400000.00, 11.50, 36, 13188.00, '2022-04-15', 'Active', 310000.00),
(2016, 1022, 'Car Loan', 1100000.00, 9.00, 60, 22814.00, '2021-06-30', 'Active', 890000.00),
(2017, 1023, 'Personal Loan', 350000.00, 11.25, 48, 9151.00, '2022-02-20', 'Active', 280000.00),
(2018, 1003, 'Car Loan', 750000.00, 9.10, 60, 15581.00, '2021-12-10', 'Active', 620000.00),
(2019, 1007, 'Personal Loan', 600000.00, 11.50, 36, 19782.00, '2022-05-08', 'Active', NULL),
(2020, 1001, 'Education Loan', 1500000.00, 9.35, 120, 19048.00, '2020-09-25', 'Active', 1280000.00),
(2021, 1011, 'Car Loan', 850000.00, 9.05, 60, 17652.00, '2021-10-12', 'Defaulted', 720000.00),
(2022, 1013, 'Home Loan', 5500000.00, 8.45, 240, 45324.00, '2019-12-15', 'Active', 5150000.00),
(2023, 1005, 'Personal Loan', 450000.00, 11.75, 36, 14844.00, '2022-03-22', 'Active', 350000.00),
(2024, 1018, 'Business Loan', 2500000.00, 10.60, 84, 38906.00, '2021-05-18', 'Active', 2100000.00),
(2025, 1015, 'Car Loan', 1300000.00, 9.20, 60, 27022.00, '2021-11-08', 'Active', 1050000.00);

-- Insert Credit Cards 
INSERT INTO Credit_Cards VALUES
('4532123456781234', 1001, 'Platinum', 300000.00, 45000.00, '2021-01-15', '2026-01-31', 'Active'),
('4532123456785678', 1002, 'Titanium', 500000.00, 85000.00, '2020-05-20', '2025-05-31', 'Active'),
('4532123456789012', 1003, 'Gold', 150000.00, 28000.00, '2021-08-10', '2026-08-31', 'Active'),
('4532123456783456', 1005, 'Platinum', 350000.00, 62000.00, '2019-12-30', '2024-12-31', 'Active'),
('4532123456787890', 1007, 'Titanium', 600000.00, 120000.00, '2020-09-18', '2025-09-30', 'Active'),
('4532123456782345', 1008, 'Classic', 100000.00, 15000.00, '2021-11-22', '2026-11-30', 'Active'),
('4532123456786789', 1009, 'Gold', 200000.00, 38000.00, '2021-05-28', '2026-05-31', 'Active'),
('4532123456784567', 1010, 'Classic', 75000.00, 12000.00, '2020-12-14', '2025-12-31', 'Active'),
('4532123456788901', 1011, 'Platinum', 400000.00, 95000.00, '2020-04-05', '2025-04-30', 'Active'),
('4532123456781111', 1013, 'Gold', 250000.00, 48000.00, '2019-10-20', '2024-10-31', 'Expired'),
('4532123456782222', 1016, 'Classic', 80000.00, NULL, '2021-06-18', '2026-06-30', 'Active'),
('4532123456783333', 1017, 'Gold', 180000.00, 32000.00, '2021-09-22', '2026-09-30', 'Active'),
('4532123456784444', 1018, 'Platinum', 320000.00, 68000.00, '2020-12-08', '2025-12-31', 'Active'),
('4532123456785555', 1020, 'Gold', 160000.00, 28000.00, '2021-11-30', '2026-11-30', 'Active'),
('4532123456786666', 1021, 'Classic', 90000.00, 15000.00, '2020-08-11', '2025-08-31', 'Active'),
('4532123456787777', 1022, 'Gold', 175000.00, NULL, '2020-02-25', '2025-02-28', 'Active'),
('4532123456788888', 1023, 'Classic', 95000.00, 18000.00, '2021-04-17', '2026-04-30', 'Active'),
('4532123456789999', 1024, 'Platinum', 280000.00, 52000.00, '2021-01-09', '2026-01-31', 'Active'),
('4532123456780000', 1025, 'Gold', 145000.00, 25000.00, '2019-09-14', '2024-09-30', 'Expired'),
('4532123456781235', 1001, 'Gold', 200000.00, 35000.00, '2022-06-20', '2027-06-30', 'Active'),
('4532123456785679', 1003, 'Platinum', 350000.00, NULL, '2021-01-15', '2026-01-31', 'Active'),
('4532123456789013', 1005, 'Gold', 220000.00, 42000.00, '2021-07-20', '2026-07-31', 'Active'),
('4532123456783457', 1007, 'Classic', 120000.00, 22000.00, '2022-03-15', '2027-03-31', 'Active'),
('4532123456787891', 1011, 'Gold', 240000.00, 48000.00, '2021-10-12', '2026-10-31', 'Active'),
('4532123456782346', 1013, 'Platinum', 380000.00, 72000.00, '2020-11-10', '2025-11-30', 'Active'),
('4532123456786790', 1015, 'Titanium', 550000.00, 95000.00, '2020-05-18', '2025-05-31', 'Blocked'),
('4532123456784568', 1018, 'Gold', 190000.00, 35000.00, '2021-12-08', '2026-12-31', 'Active');

-- 1. List all customers who registered after 1st January 2020.
USE HDFC_BANK;
SELECT * FROM CUSTOMERS 
WHERE REGISTRATION_DATE  >= '2020-01-01';

-- 2. Display all transactions of type ‘Deposit’ made in February 2024, sorted by date (latest first)
SELECT *
FROM TRANSACTIONS
WHERE TRANSACTION_TYPE= 'DEPOSIT'
    AND MONTH(TRANSACTION_DATE) = 2
    AND YEAR(TRANSACTION_DATE) = 2024
ORDER BY 
   TRANSACTION_DATE DESC;
   
ALTER TABLE Customers
ADD COLUMN full_name VARCHAR(100);
UPDATE Customers
SET full_name = CONCAT(first_name, ' ', last_name);

-- 3. List customer names who have both Savings and Fixed Deposit accounts.
SELECT C.FULL_NAME
FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID 
WHERE A.ACCOUNT_TYPE IN ('SAVINGS' , 'FIXED DEPOSIT')
GROUP BY C.FULL_NAME
HAVING COUNT(DISTINCT A.ACCOUNT_TYPE)>1;

-- 4. Show the top 5 customers with the highest total account balances across all their accounts.
SELECT C.FULL_NAME,C.CUSTOMER_ID,SUM(A.BALANCE) AS TOTAL_BALANCE
FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.FULL_NAME,C.CUSTOMER_ID
ORDER BY TOTAL_BALANCE DESC LIMIT 5;

-- 5. Find customers who do not have any loan.**
SELECT C.CUSTOMER_ID,C.FULL_NAME,L.LOAN_ID,L.LOAN_AMOUNT
FROM CUSTOMERS C
LEFT JOIN LOANS L ON C.CUSTOMER_ID = L.CUSTOMER_ID
WHERE L.LOAN_ID IS NULL;

-- 6.Retrieve the most recent transaction for each account.
SELECT TRANSACTION_ID,ACCOUNT_NUMBER,TRANSACTION_TYPE,AMOUNT,TRANSACTION_DATE
FROM  (SELECT  TRANSACTION_ID,ACCOUNT_NUMBER,TRANSACTION_TYPE,AMOUNT,TRANSACTION_DATE,
ROW_NUMBER() OVER (PARTITION BY ACCOUNT_NUMBER ORDER BY TRANSACTION_DATE DESC) AS RECENT_TRANSACTION 
FROM TRANSACTIONS
)RECENT 
WHERE RECENT_TRANSACTION = 1
ORDER BY TRANSACTION_DATE;

-- 7.Rank customers in each branch based on their total transaction amount (highest first).
SELECT C.FULL_NAME,B.BRANCH_NAME,SUM(T.AMOUNT) AS TOTAL_TRANSACTION_AMOUNT,
RANK() OVER (PARTITION BY B.BRANCH_NAME ORDER BY SUM(T.AMOUNT) DESC) AS CUSTOMER_RANK
FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
JOIN BRANCHES B ON C.BRANCH_ID = B.BRANCH_ID
JOIN TRANSACTIONS T ON A.ACCOUNT_NUMBER = T.ACCOUNT_NUMBER
GROUP BY C.FULL_NAME,B.BRANCH_NAME
ORDER BY B.BRANCH_NAME,CUSTOMER_RANK;

-- 8.Show each customer’s previous transaction amount.
SELECT C.FULL_NAME,A.ACCOUNT_NUMBER,T.AMOUNT,
LAG(T.AMOUNT,1) OVER (PARTITION BY A.ACCOUNT_NUMBER ORDER BY T.TRANSACTION_DATE) AS PREV_TRANSACTION_AMOUNT
FROM ACCOUNTS A
JOIN CUSTOMERS C ON A.CUSTOMER_ID = C.CUSTOMER_ID
JOIN TRANSACTIONS T ON T.ACCOUNT_NUMBER = A.ACCOUNT_NUMBER
ORDER BY C.FULL_NAME,T.TRANSACTION_DATE;

-- 9. Generate a report showing for each customer name, their total number of accounts, total transactions, and total loans.
SELECT C.FULL_NAME,
COUNT(DISTINCT A.ACCOUNT_NUMBER) AS TOTAL_NUMBER_OF_ACCOUNTS,
COUNT(DISTINCT T.TRANSACTION_ID )AS TOTAL_TRANSACTION,
COUNT(DISTINCT LOAN_ID) AS TOTAL_LOANS
FROM  ACCOUNTS A
JOIN CUSTOMERS C ON A.CUSTOMER_ID = C.CUSTOMER_ID
JOIN TRANSACTIONS T ON A.ACCOUNT_NUMBER = T.ACCOUNT_NUMBER
JOIN LOANS L ON A.CUSTOMER_ID = L.CUSTOMER_ID
GROUP BY C.FULL_NAME
ORDER BY C.FULL_NAME ;

-- 10. Find customers whose total outstanding loan amount is greater than their total account balance.
SELECT C.FULL_NAME,SUM(L.OUTSTANDING_AMOUNT)AS TOTAL_OUTSTANDING_AMOUNT,SUM(A.BALANCE) AS TOTAL_ACCOUNT_BALANCE
FROM CUSTOMERS C 
JOIN 
LOANS L ON C.CUSTOMER_ID = L.CUSTOMER_ID 
JOIN
ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.FULL_NAME
HAVING TOTAL_OUTSTANDING_AMOUNT>TOTAL_ACCOUNT_BALANCE
ORDER BY TOTAL_OUTSTANDING_AMOUNT DESC;

-- 11. Find customers who have both active loans and active credit cards.
SELECT C.CUSTOMER_ID ,C.FULL_NAME
FROM CUSTOMERS C
WHERE C.CUSTOMER_ID IN  (
SELECT L.CUSTOMER_ID  
FROM LOANS L 
WHERE L.STATUS ="ACTIVE") 
AND C.CUSTOMER_ID IN
(SELECT CC.CUSTOMER_ID
FROM CREDIT_CARDS CC
WHERE CC.STATUS ="ACTIVE");

-- 12. Show all customers who have made at least one transaction above ₹50,000. 
SELECT C.CUSTOMER_ID,C.FULL_NAME
FROM CUSTOMERS C 
WHERE (
SELECT T.TRANSACTION_ID
FROM TRANSACTIONS T 
JOIN ACCOUNTS A ON T.ACCOUNT_NUMBER= A.ACCOUNT_NUMBER
WHERE 
C.CUSTOMER_ID=A.CUSTOMER_ID
AND T.AMOUNT >50000
);

SELECT * FROM TRANSACTIONS;
 SELECT * FROM ACCOUNTS;
 
-- 13. For each city, display the total number of customers, total accounts, and average balance.
SELECT B.CITY ,COUNT(C.CUSTOMER_ID) AS TOTAL_NO_OF_CUSTOMER,COUNT(A.ACCOUNT_NUMBER) AS TOTAL_NO_OF_ACCOUNTS,AVG(A.BALANCE)
FROM CUSTOMERS C 
JOIN BRANCHES B ON C.BRANCH_ID = B.BRANCH_ID
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY B.CITY;

-- 14. Find the top 3 customers per branch based on total balance.
SELECT *
 FROM
 ( SELECT C.FULL_NAME,
 B.BRANCH_NAME,
 SUM(A.BALANCE) AS TOTAL_BALANCE,
DENSE_RANK() OVER (PARTITION BY B.BRANCH_NAME ORDER BY SUM(A.BALANCE) DESC) AS RANK_
FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
JOIN BRANCHES B ON C.BRANCH_ID = B.BRANCH_ID
GROUP BY C.FULL_NAME,B.BRANCH_NAME ) RANKED
WHERE RANK_<=3
ORDER BY RANK_;

SELECT * FROM ACCOUNTS ;
SELECT * FROM BRANCHES;
SELECT * FROM CREDIT_CARDS;
SELECT * FROM TRANSACTIONS;
SELECT * FROM LOANS;
SELECT * FROM CUSTOMERS;


-- practice questions
-- 6. Show each branch name along with the total number of customers registered under it.
  SELECT  B.BRANCH_NAME,COUNT(C.CUSTOMER_ID) AS NO_OF_CUSTOMERS
  FROM CUSTOMERS C 
  JOIN BRANCHES B ON C.BRANCH_ID = B.BRANCH_ID
  GROUP BY  B.BRANCH_NAME;
   
-- 7. Display the average account balance for each account type.
SELECT AVG(BALANCE) AS AVERAGE_BALANCE,ACCOUNT_TYPE
FROM ACCOUNTS 
GROUP BY ACCOUNT_TYPE;



SELECT * FROM CUSTOMERS;   
SELECT * FROM ACCOUNTS;

-- 9. Retrieve the top 3 customers in each state based on their total account balance.
SELECT C.FULL_NAME,C.STATE,SUM(A.BALANCE) AS TOTAL_BALANCE
FROM CUSTOMERS C
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.STATE,C.FULL_NAME
ORDER BY TOTAL_BALANCE DESC LIMIT 3;


-- 9. Retrieve customer details and their loan type and loan amount.
SELECT C.*,L.LOAN_TYPE,LOAN_AMOUNT
FROM CUSTOMERS C 
JOIN LOANS L ON C.CUSTOMER_ID = L.CUSTOMER_ID;

-- 12.Show customers who have made transactions every month in the year 2024.
SELECT C.CUSTOMER_ID,C.FULL_NAME,T.TRANSACTION_DATE
FROM CUSTOMERS C 
JOIN ACCOUNTS A ON C.CUSTOMER_ID = A.CUSTOMER_ID
JOIN TRANSACTIONS T ON A.ACCOUNT_NUMBER = T.ACCOUNT_NUMBER
WHERE YEAR(T.TRANSACTION_DATE) = "2024"
GROUP BY C.CUSTOMER_ID,C.FULL_NAME,T.TRANSACTION_DATE;



-- 12.Display the customer name, branch name, and total loan amount for customers with loans above ₹10,00,000
SELECT C.FULL_NAME,B.BRANCH_NAME,SUM(L.LOAN_AMOUNT) AS TOTAL_LOAN_AMOUNT
FROM CUSTOMERS C 
JOIN 
BRANCHES B ON C.BRANCH_ID = B.BRANCH_ID 
JOIN 
LOANS L ON C.CUSTOMER_ID = L.CUSTOMER_ID
GROUP BY C.FULL_NAME,B.BRANCH_NAME 
HAVING TOTAL_LOAN_AMOUNT > 1000000
ORDER BY TOTAL_LOAN_AMOUNT DESC;

-- 13. Retrieve the most recent transaction (latest transaction_date) for each account.
SELECT 
    T.ACCOUNT_NUMBER,T.TRANSACTION_ID,T.TRANSACTION_TYPE,T.AMOUNT,T.TRANSACTION_DATE
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY account_NUMBER ORDER BY transaction_date DESC) AS RN
    FROM 
        Transactions 
) T
WHERE 
    T.RN= 1;
    


-- 15. Calculate the average loan interest rate for each loan type and display only those types with average interest rate above 9%.
SELECT AVG(INTEREST_RATE) AS AVG_INTEREST_RATE,LOAN_TYPE
FROM LOANS
GROUP BY LOAN_TYPE
HAVING AVG_INTEREST_RATE >9;







-- 3. Find all Active credit cards that will expire in 2025.
   SELECT * FROM CREDIT_CARDS
   WHERE STATUS ="ACTIVE"
   AND YEAR(EXPIRY_DATE) = 2025;

   
-- WINDOWS FUNCTION   

-- 6.Retrieve the most recent transaction for each account.
SELECT 
    ACCOUNT_NUMBER,
    MAX(TRANSACTION_DATE) AS MOST_RECENT_TRANSACTION
FROM TRANSACTIONS
GROUP BY ACCOUNT_NUMBER;





-- 1. Retrieve the names and cities of all branches located in Maharashtra.
SELECT * FROM BRANCHES
WHERE STATE = "MAHARASHTRA";

SELECT * FROM CREDIT_CARDS;

-- 3. Show account numbers, types, and balances of all accounts where balance exceeds ₹2,00,000.
SELECT ACCOUNT_NUMBER,ACCOUNT_TYPE,BALANCE 
FROM ACCOUNTS 
WHERE BALANCE > 200000;
   
   SELECT * FROM TRANSACTIONS 
   WHERE TRANSACTION_DATE BETWEEN  "2024-01-01" AND "2024-02-01";
   
   SELECT * FROM CUSTOMERS
   WHERE FULL_NAME LIKE ("%ESH%");

SELECT * FROM CUSTOMERS 
WHERE CITY IN("MUMBAI","DELHI","PUNE");

SELECT * FROM CUSTOMERS 
WHERE CITY NOT IN("MUMBAI","DELHI","PUNE");

SELECT * FROM ACCOUNTS;

SELECT BALANCE +(BALANCE*0.10) AS INCREASED_BALANCE
FROM ACCOUNTS;

SELECT COUNT(DISTINCT BRANCH_NAME ) AS TOTAL_BRANCHES
FROM BRANCHES;

SELECT * ,
row_number() OVER (PARTITION BY CUSTOMER_ID ORDER BY FIRST_NAME) AS ROW_NUM
FROM CUSTOMERS;

SELECT CUSTOMER_ID,BALANCE,ACCOUNT_TYPE,
LAG(BALANCE,1) OVER (ORDER BY ACCOUNT_NUMBER) AS PREV_BALANCE,
LEAD(BALANCE,1) OVER (ORDER BY ACCOUNT_NUMBER) AS NEXT_BALANCE
FROM ACCOUNTS;

SELECT UPPER(FULL_NAME) AS FULL_NAME FROM CUSTOMERS;
SELECT LOWER(FULL_NAME) AS FULL_NAME FROM CUSTOMERS;

START TRANSACTION;
DELETE FROM CUSTOMERS 
WHERE CUSTOMER_ID=1001;
ROLLBACK;
COMMIT;

SELECT LENGTH(FULL_NAME) AS LENGHT_OF_NAME FROM CUSTOMERS;

select * from transactions
order by amount desc limit 1 offset 1;
