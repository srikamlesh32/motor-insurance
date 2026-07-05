create database	mass;
use mass;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10)
);

INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Gender, DOB, Phone, Email, Address, City, State, Pincode)
VALUES
(101, 'Kamalesh', 'S', 'Male', '2002-05-15', '9876543210', 'kamalesh@gmail.com', '12 Anna Nagar', 'Chennai', 'Tamil Nadu', '600040'),

(102, 'Arun', 'Kumar', 'Male', '1998-08-20', '9876543211', 'arun@gmail.com', '45 MG Road', 'Coimbatore', 'Tamil Nadu', '641001'),

(103, 'Priya', 'R', 'Female', '2000-03-10', '9876543212', 'priya@gmail.com', '18 Gandhi Street', 'Madurai', 'Tamil Nadu', '625001'),

(104, 'Rahul', 'M', 'Male', '1997-12-25', '9876543213', 'rahul@gmail.com', '22 Nehru Nagar', 'Salem', 'Tamil Nadu', '636007'),

(105, 'Divya', 'S', 'Female', '2001-06-18', '9876543214', 'divya@gmail.com', '9 Lake View', 'Trichy', 'Tamil Nadu', '620001'),

(106, 'Vignesh', 'P', 'Male', '1999-09-30', '9876543215', 'vignesh@gmail.com', '34 Temple Road', 'Erode', 'Tamil Nadu', '638001'),

(107, 'Sneha', 'K', 'Female', '1996-04-14', '9876543216', 'sneha@gmail.com', '55 Park Avenue', 'Vellore', 'Tamil Nadu', '632004'),

(108, 'Karthik', 'R', 'Male', '1995-11-11', '9876543217', 'karthik@gmail.com', '101 Main Road', 'Tirunelveli', 'Tamil Nadu', '627001'),

(109, 'Anitha', 'P', 'Female', '2002-01-08', '9876543218', 'anitha@gmail.com', '67 North Street', 'Thoothukudi', 'Tamil Nadu', '628001'),

(110, 'Suresh', 'B', 'Male', '1994-07-22', '9876543219', 'suresh@gmail.com', '89 South Street', 'Chennai', 'Tamil Nadu', '600020');

select * from customer;

 CREATE TABLE Vehicle (
    Vehicle_ID INT PRIMARY KEY,
    Customer_ID INT,
    Vehicle_No VARCHAR(20),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Manufacture_Year INT,
    Fuel_Type VARCHAR(20),
    Vehicle_Value DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Vehicle
(Vehicle_ID, Customer_ID, Vehicle_No, Brand, Model, Manufacture_Year, Fuel_Type, Vehicle_Value)
VALUES
(201, 101, 'TN01AB1234', 'Hyundai', 'i20', 2022, 'Petrol', 850000.00),
(202, 102, 'TN58CD5678', 'Honda', 'City', 2021, 'Petrol', 1200000.00),
(203, 103, 'TN45EF9012', 'Toyota', 'Innova', 2020, 'Diesel', 1800000.00),
(204, 104, 'TN10GH3456', 'Maruti Suzuki', 'Swift', 2023, 'Petrol', 750000.00),
(205, 105, 'TN22JK7890', 'Tata', 'Nexon', 2022, 'Diesel', 1100000.00),
(206, 106, 'TN33LM1122', 'Mahindra', 'XUV300', 2021, 'Diesel', 1400000.00),
(207, 107, 'TN44NP3344', 'Kia', 'Seltos', 2023, 'Petrol', 1600000.00),
(208, 108, 'TN55QR5566', 'Renault', 'Kiger', 2022, 'Petrol', 900000.00),
(209, 109, 'TN66ST7788', 'Volkswagen', 'Polo', 2020, 'Petrol', 950000.00),
(210, 110, 'TN77UV9900', 'Skoda', 'Slavia', 2024, 'Petrol', 1750000.00);

select * from vehicle;

CREATE TABLE Policy (
    Policy_ID INT PRIMARY KEY,
    Customer_ID INT,
    Vehicle_ID INT,
    Policy_Type VARCHAR(50),
    Premium_Amount DECIMAL(10,2),
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);
INSERT INTO Policy VALUES
(301,101,201,'Comprehensive',15000.00,'2025-01-01','2025-12-31','Active'),
(302,102,202,'Third Party',10000.00,'2025-02-01','2026-01-31','Active'),
(303,103,203,'Zero Depreciation',18000.00,'2025-03-01','2026-02-28','Expired'),
(304,104,204,'Comprehensive',16000.00,'2025-04-01','2026-03-31','Active'),
(305,105,205,'Third Party',9000.00,'2025-05-01','2026-04-30','Pending'),
(306,106,206,'Comprehensive',20000.00,'2025-06-01','2026-05-31','Active'),
(307,107,207,'Zero Depreciation',22000.00,'2025-07-01','2026-06-30','Active'),
(308,108,208,'Third Party',9500.00,'2025-08-01','2026-07-31','Expired'),
(309,109,209,'Comprehensive',17500.00,'2025-09-01','2026-08-31','Active'),
(310,110,210,'Zero Depreciation',25000.00,'2025-10-01','2026-09-30','Pending');
select * from policy;




CREATE TABLE Claim_Details (
    Claim_ID INT PRIMARY KEY,
    Policy_ID INT,
    Claim_Date DATE,
    Claim_Amount DECIMAL(10,2),
    Claim_Status VARCHAR(20),
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);


INSERT INTO Claim_Details
(Claim_ID, Policy_ID, Claim_Date, Claim_Amount, Claim_Status)
VALUES
(401, 301, '2025-03-15', 25000.00, 'Approved'),
(402, 302, '2025-04-20', 15000.00, 'Pending'),
(403, 303, '2025-05-10', 30000.00, 'Rejected'),
(404, 304, '2025-06-05', 45000.00, 'Approved'),
(405, 305, '2025-07-18', 12000.00, 'Pending'),
(406, 306, '2025-08-12', 50000.00, 'Approved'),
(407, 307, '2025-09-25', 35000.00, 'Rejected'),
(408, 308, '2025-10-08', 18000.00, 'Approved'),
(409, 309, '2025-11-14', 40000.00, 'Pending'),
(410, 310, '2025-12-20', 55000.00, 'Approved');

select * from claim_details;


CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Policy_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(20),
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);

INSERT INTO Payment
(Payment_ID, Policy_ID, Payment_Date, Amount, Payment_Mode)
VALUES
(501, 301, '2025-01-01', 15000.00, 'UPI'),
(502, 302, '2025-02-01', 10000.00, 'Credit Card'),
(503, 303, '2025-03-01', 18000.00, 'Debit Card'),
(504, 304, '2025-04-01', 16000.00, 'Net Banking'),
(505, 305, '2025-05-01', 9000.00, 'Cash'),
(506, 306, '2025-06-01', 20000.00, 'UPI'),
(507, 307, '2025-07-01', 22000.00, 'Credit Card'),
(508, 308, '2025-08-01', 9500.00, 'Debit Card'),
(509, 309, '2025-09-01', 17500.00, 'Net Banking'),
(510, 310, '2025-10-01', 25000.00, 'UPI');


select * from payment;



CREATE TABLE Agent (
    Agent_ID INT PRIMARY KEY,
    Agent_Name VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50),
    Commission DECIMAL(10,2)
);

INSERT INTO Agent
(Agent_ID, Agent_Name, Phone, Email, City, Commission)
VALUES
(601, 'Ramesh Kumar', '9876543210', 'ramesh@gmail.com', 'Chennai', 5000.00),
(602, 'Suresh Babu', '9876543211', 'suresh@gmail.com', 'Coimbatore', 6500.00),
(603, 'Priya Sharma', '9876543212', 'priya@gmail.com', 'Madurai', 5500.00),
(604, 'Karthik Raj', '9876543213', 'karthik@gmail.com', 'Trichy', 7000.00),
(605, 'Anitha Devi', '9876543214', 'anitha@gmail.com', 'Salem', 6000.00),
(606, 'Vignesh Kumar', '9876543215', 'vignesh@gmail.com', 'Erode', 7500.00),
(607, 'Deepa Lakshmi', '9876543216', 'deepa@gmail.com', 'Tirunelveli', 6800.00),
(608, 'Arun Prakash', '9876543217', 'arun@gmail.com', 'Vellore', 7200.00),
(609, 'Meena Rani', '9876543218', 'meena@gmail.com', 'Thanjavur', 5800.00),
(610, 'Hari Krishnan', '9876543219', 'hari@gmail.com', 'Nagapattinam', 8000.00);

select * from agent;


CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(50),
    Branch_City VARCHAR(50),
    Manager_Name VARCHAR(50),
    Contact_No VARCHAR(15)
);

INSERT INTO Branch
(Branch_ID, Branch_Name, Branch_City, Manager_Name, Contact_No)
VALUES
(701, 'Chennai Branch', 'Chennai', 'Rajesh Kumar', '9876501111'),
(702, 'Coimbatore Branch', 'Coimbatore', 'Suresh Babu', '9876502222'),
(703, 'Madurai Branch', 'Madurai', 'Priya Devi', '9876503333'),
(704, 'Trichy Branch', 'Trichy', 'Karthik Raj', '9876504444'),
(705, 'Salem Branch', 'Salem', 'Anitha Sharma', '9876505555'),
(706, 'Erode Branch', 'Erode', 'Vignesh Kumar', '9876506666'),
(707, 'Vellore Branch', 'Vellore', 'Deepa Lakshmi', '9876507777'),
(708, 'Thanjavur Branch', 'Thanjavur', 'Hari Prasad', '9876508888'),
(709, 'Tirunelveli Branch', 'Tirunelveli', 'Meena Rani', '9876509999'),
(710, 'Nagapattinam Branch', 'Nagapattinam', 'Arun Prakash', '9876510000');

select * from branch;


CREATE TABLE Insurance_Company (
    Company_ID INT PRIMARY KEY,
    Company_Name VARCHAR(100),
    Head_Office VARCHAR(100),
    Contact_No VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Insurance_Company
(Company_ID, Company_Name, Head_Office, Contact_No, Email)
VALUES
(801, 'LIC General Insurance', 'Mumbai', '18002669876', 'support@licgi.co.in'),
(802, 'ICICI Lombard', 'Mumbai', '18002666', 'customersupport@icicilombard.com'),
(803, 'HDFC ERGO', 'Mumbai', '18002700700', 'care@hdfcergo.com'),
(804, 'Bajaj Allianz', 'Pune', '18002095858', 'customercare@bajajallianz.co.in'),
(805, 'Reliance General Insurance', 'Mumbai', '180030090009', 'rgicl.services@relianceada.com'),
(806, 'TATA AIG', 'Mumbai', '18002667780', 'customersupport@tataaig.com'),
(807, 'SBI General Insurance', 'Mumbai', '18001021111', 'customer.care@sbigeneral.in'),
(808, 'IFFCO Tokio', 'Gurugram', '18001035499', 'support@iffcotokio.co.in'),
(809, 'United India Insurance', 'Chennai', '180042533333', 'customercare@uiic.co.in'),
(810, 'New India Assurance', 'Mumbai', '18002091415', 'support@newindia.co.in');

select * from insurance_company;

CREATE TABLE Accident_Details (
    Accident_ID INT PRIMARY KEY,
    Vehicle_ID INT,
    Accident_Date DATE,
    Accident_Location VARCHAR(100),
    Damage_Level VARCHAR(20),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);


INSERT INTO Accident_Details
(Accident_ID, Vehicle_ID, Accident_Date, Accident_Location, Damage_Level)
VALUES
(901, 201, '2025-02-10', 'Chennai', 'Minor'),
(902, 202, '2025-03-15', 'Coimbatore', 'Major'),
(903, 203, '2025-04-20', 'Madurai', 'Moderate'),
(904, 204, '2025-05-18', 'Trichy', 'Minor'),
(905, 205, '2025-06-12', 'Salem', 'Major'),
(906, 206, '2025-07-08', 'Erode', 'Moderate'),
(907, 207, '2025-08-25', 'Vellore', 'Minor'),
(908, 208, '2025-09-14', 'Thanjavur', 'Major'),
(909, 209, '2025-10-05', 'Tirunelveli', 'Moderate'),
(910, 210, '2025-11-22', 'Nagapattinam', 'Minor');

select * from accident_details;


SELECT * FROM Customer
WHERE City = 'Chennai';


SELECT * FROM Policy
ORDER BY Premium_Amount DESC;


SELECT Policy_Type, COUNT(*)
FROM Policy
GROUP BY Policy_Type;

SELECT Policy_Type, COUNT(*)
FROM Policy
GROUP BY Policy_Type
HAVING COUNT(*) >= 2;


SELECT COUNT(*) FROM Customer;

SELECT SUM(Premium_Amount) FROM Policy;

SELECT AVG(Premium_Amount) FROM Policy;

SELECT MAX(Premium_Amount) FROM Policy;

SELECT MIN(Premium_Amount) FROM Policy;



-- Customer + their Vehicle details
SELECT c.Customer_ID, c.First_Name, c.Last_Name, v.Vehicle_No, v.Brand, v.Model
FROM Customer c
JOIN Vehicle v ON c.Customer_ID = v.Customer_ID;

-- Customer + Policy + Vehicle (3-table join)
SELECT c.First_Name, c.Last_Name, v.Vehicle_No, p.Policy_Type, p.Premium_Amount, p.Status
FROM Customer c
JOIN Vehicle v ON c.Customer_ID = v.Customer_ID
JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID;

-- Policy + Claim details together
SELECT p.Policy_ID, p.Policy_Type, cd.Claim_ID, cd.Claim_Amount, cd.Claim_Status
FROM Policy p
JOIN Claim_Details cd ON p.Policy_ID = cd.Policy_ID;

-- Vehicle + Accident details
SELECT v.Vehicle_No, v.Brand, v.Model, a.Accident_Date, a.Accident_Location, a.Damage_Level
FROM Vehicle v
JOIN Accident_Details a ON v.Vehicle_ID = a.Vehicle_ID;

-- Full chain: Customer -> Vehicle -> Policy -> Claim
SELECT c.First_Name, v.Vehicle_No, p.Policy_Type, cd.Claim_Amount, cd.Claim_Status
FROM Customer c
JOIN Vehicle v ON c.Customer_ID = v.Customer_ID
JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID
JOIN Claim_Details cd ON p.Policy_ID = cd.Policy_ID;

-- LEFT JOIN to find customers with NO claims filed yet
SELECT c.Customer_ID, c.First_Name, p.Policy_ID, cd.Claim_ID
FROM Customer c
JOIN Vehicle v ON c.Customer_ID = v.Customer_ID
JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID
LEFT JOIN Claim_Details cd ON p.Policy_ID = cd.Policy_ID
WHERE cd.Claim_ID IS NULL;



-- Total premium collected per policy status
SELECT Status, SUM(Premium_Amount) AS Total_Premium
FROM Policy
GROUP BY Status;

-- Number of vehicles per Brand
SELECT Brand, COUNT(*) AS Total_Vehicles
FROM Vehicle
GROUP BY Brand;

-- Total claim amount per Claim_Status
SELECT Claim_Status, SUM(Claim_Amount) AS Total_Claimed, COUNT(*) AS No_of_Claims
FROM Claim_Details
GROUP BY Claim_Status;

-- Average vehicle value by Fuel_Type
SELECT Fuel_Type, AVG(Vehicle_Value) AS Avg_Value
FROM Vehicle
GROUP BY Fuel_Type;

-- Total payment received, grouped by Payment_Mode
SELECT Payment_Mode, SUM(Amount) AS Total_Amount, COUNT(*) AS No_of_Payments
FROM Payment
GROUP BY Payment_Mode;

-- Number of accidents by Damage_Level
SELECT Damage_Level, COUNT(*) AS Accident_Count
FROM Accident_Details
GROUP BY Damage_Level;


-- Customers whose vehicle value is above average
SELECT First_Name, Last_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID FROM Vehicle
    WHERE Vehicle_Value > (SELECT AVG(Vehicle_Value) FROM Vehicle)
);

-- Policies where the claim amount is more than the premium paid
SELECT p.Policy_ID, p.Premium_Amount, cd.Claim_Amount
FROM Policy p
JOIN Claim_Details cd ON p.Policy_ID = cd.Policy_ID
WHERE cd.Claim_Amount > p.Premium_Amount;

-- Vehicle with the highest value (using subquery)
SELECT * FROM Vehicle
WHERE Vehicle_Value = (SELECT MAX(Vehicle_Value) FROM Vehicle);

-- Customers who have not made any payment
SELECT * FROM Customer
WHERE Customer_ID NOT IN (
    SELECT v.Customer_ID
    FROM Vehicle v
    JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID
    JOIN Payment pay ON p.Policy_ID = pay.Policy_ID
);

-- Customers whose vehicle value is above average
SELECT First_Name, Last_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID FROM Vehicle
    WHERE Vehicle_Value > (SELECT AVG(Vehicle_Value) FROM Vehicle)
);

-- Policies where the claim amount is more than the premium paid
SELECT p.Policy_ID, p.Premium_Amount, cd.Claim_Amount
FROM Policy p
JOIN Claim_Details cd ON p.Policy_ID = cd.Policy_ID
WHERE cd.Claim_Amount > p.Premium_Amount;

-- Vehicle with the highest value (using subquery)
SELECT * FROM Vehicle
WHERE Vehicle_Value = (SELECT MAX(Vehicle_Value) FROM Vehicle);

-- Customers who have not made any payment
SELECT * FROM Customer
WHERE Customer_ID NOT IN (
    SELECT v.Customer_ID
    FROM Vehicle v
    JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID
    JOIN Payment pay ON p.Policy_ID = pay.Policy_ID
);



-- Policies expiring within next 6 months (from End_Date)
SELECT Policy_ID, Policy_Type, End_Date
FROM Policy
WHERE End_Date BETWEEN '2026-01-01' AND '2026-06-30';

-- Customers born after 2000 (Gen Z customers)
SELECT First_Name, Last_Name, DOB
FROM Customer
WHERE DOB > '2000-01-01';

-- Claims filed in the year 2025, sorted by amount
SELECT * FROM Claim_Details
WHERE YEAR(Claim_Date) = 2025
ORDER BY Claim_Amount DESC;

-- Active policies with Comprehensive type only
SELECT * FROM Policy
WHERE Status = 'Active' AND Policy_Type = 'Comprehensive';


CREATE VIEW Customer_Policy_Summary AS
SELECT c.Customer_ID, c.First_Name, c.Last_Name, v.Vehicle_No, p.Policy_Type, p.Premium_Amount, p.Status
FROM Customer c
JOIN Vehicle v ON c.Customer_ID = v.Customer_ID
JOIN Policy p ON v.Vehicle_ID = p.Vehicle_ID;

SELECT * FROM Customer_Policy_Summary;


-- Update policy status to Expired if End_Date has passed
UPDATE Policy
SET Status = 'Expired'
WHERE End_Date < CURDATE();

-- Delete a claim that was rejected (example)
DELETE FROM Claim_Details
WHERE Claim_Status = 'Rejected' AND Claim_ID = 403;