/*
Foundation Year in Computer Science.
Database Development.
Candidate Number: ------.
Note: Any inserted data is from a data generator.
*/

/*
CD C:\xampp\mysql\bin
mysql -u root -p
*/

--------------------------------------------------------------------------------
-- Creating Database and Tables
--------------------------------------------------------------------------------

show databases;
drop database eTroniczDB;
create database eTroniczDB;
show databases;
use eTroniczDB;

create table Branch(
  BranchID int primary key,
  AddressLine1 varchar(255) not null,
  AddressLine2 varchar(255),
  AddressLine3 varchar(255),
  Location varchar(255),
  Email varchar(255) not null unique,
  BranchName varchar(255) not null,
  TelephoneNumber varchar(255) not null
);

create table Customer(
  FirstName varchar(255) not null,
  LastName varchar(255) not null,
  AddressLine1 varchar(255) not null,
  AddressLine2 varchar(255),
  AddressLine3 varchar(255),
  DateOfBirth date not null,
  TelephoneNumber varchar(255) not null,
  Email varchar(255) not null unique,
  BranchID int not null,
  foreign key (BranchID) references Branch(BranchID),
  CustomerID int primary key
);

create table Employee(
  FirstName varchar(255) not null,
  LastName varchar(255) not null,
  EmployeeID int primary key,
  DateOfBirth date not null,
  BranchID int not null,
  foreign key (BranchID) references Branch(BranchID),
  HireDate date not null
);

create table Transaction(
  DateAndTime datetime not null,
  TransactionNumber int primary key,
  AccountNumber int not null,
  EmployeeID int,
  foreign key (EmployeeID) references Employee(EmployeeID),
  BranchID int not null,
  foreign key (BranchID) references Branch(BranchID)
);

create table ShippingCompany(
  CompanyName varchar(255) not null,
  CompanyID int primary key,
  AddressLine1 varchar(255) not null,
  AddressLine2 varchar(255),
  AddressLine3 varchar(255),
  ContactFirstName varchar(255) not null,
  ContactLastName varchar(255) not null,
  TelephoneNumber varchar(255) not null,
  Email varchar(255) not null unique
);

create table Supplier(
  SupplierID int primary key,
  Name varchar(255) not null,
  AddressLine1 varchar(255) not null,
  AddressLine2 varchar(255),
  AddressLine3 varchar(255),
  RegionType varchar(255) not null,
  ContactFirstName varchar(255) not null,
  ContactLastName varchar(255) not null,
  TelephoneNumber varchar(255) not null,
  Email varchar(255) not null unique
);

create table ProductType(
  ProductTypeID int primary key,
  StartDate date not null,
  EndDate date not null
);

create table Product(
  ProductName varchar(255) not null,
  ProductNameID int primary key,
  SupplierID int not null,
  foreign key (SupplierID) references Supplier(SupplierID),
  Price float not null,
  Description varchar(255)
);

create table TransactionProduct(
  TransactionNumber int not null,
  foreign key (TransactionNumber) references Transaction(TransactionNumber),
  Quantity int not null,
  ProductTypeID int not null,
  foreign key (ProductTypeID) references ProductType(ProductTypeID)
);

create table Shipment(
  CompanyID int not null,
  foreign key (CompanyID) references ShippingCompany(CompanyID),
  TransactionNumber int,
  foreign key (TransactionNumber) references Transaction(TransactionNumber),
  ShipmentID int primary key,
  BranchID int not null,
  foreign key (BranchID) references Branch(BranchID)
);

--------------------------------------------------------------------------------
-- Describe Commands
--------------------------------------------------------------------------------

describe Branch;
describe Customer;
describe Employee;
describe Transaction;
describe ShippingCompany;
describe Supplier;
describe ProductType;
describe Product;
describe TransactionProduct;
describe Shipment;

--------------------------------------------------------------------------------
-- Inserting Data
--------------------------------------------------------------------------------

--  Branch
INSERT INTO `Branch` (`BranchID`,`AddressLine1`,`AddressLine2`,`AddressLine3`,
  `Location`,`Email`,`BranchName`,`TelephoneNumber`)
VALUES
  (10001,"Ap #896-3727 Nunc Rd.","Builth Wells","D25 8RS","Lancashire","ut@google.couk",
    "Lacus Nulla Tincidunt Institute","(026) 4596 4659"),
  (10002,"5036 Ut, Rd.","Coldstream","CF40 5HO","Selkirkshire","nulla.donec@outlook.ca",
    "Ac Nulla LLP","055 6981 6782"),
  (10003,"486-8395 Donec Rd.","Warwick","HF9 6GL","Dorset","libero.mauris@icloud.org",
    "Et Magna Praesent Corporation","0862 243 7131"),
  (10004,"5537 Nam Rd.","Holywell","LX8 6RL","Derbyshire","urna.justo.faucibus@icloud.couk",
    "Nunc Interdum Industries","076 5334 3257"),
  (10005,"Ap #281-1579 Adipiscing Street","Dingwall","V5 5EA","Suffolk","in.lorem.donec@hotmail.couk",
    "Risus Donec Egestas Ltd","0854 401 9261");


-- Customer
INSERT INTO `Customer` (`FirstName`,`LastName`,`AddressLine1`,`AddressLine2`,`AddressLine3`,
  `DateOfBirth`,`TelephoneNumber`,`Email`,`CustomerID`,`BranchID`)
VALUES
  ("Cheryl","Richard","994-6996 Ut, Ave","Kinross","CJ61 7HD","2024-3-22","055 2375 1915",
    "velit@icloud.com",10001,10004),
  ("Courtney","Mills","477-2392 Lacus. Road","Beverley","T52 3FF","2024-1-25","0967 436 2556",
    "curabitur.sed.tortor@google.net",10002,10005),
  ("Gray","Sullivan","189-2482 Nullam St.","Dunfermline","SB27 5NU","2023-10-12","(018312) 41558",
  "elit.nulla.facilisi@aol.couk",10003,10002),
  ("Bethany","Vance","7409 Elementum St.","Dufftown","DZ5O 2RF","2000-3-21","076 6468 3800",
    "augue.malesuada@yahoo.ca",10004,10005),
  ("Demetria","House","6905 Vitae Road","Prestatyn","B2 5UQ","2003-8-7","0500 773063",
    "inceptos.hymenaeos@yahoo.net",10005,10004),
  ("Erasmus","Pena","P.O. Box 160, 2681 Pellentesque. Rd.","Skegness","NY5V 6GR","2022-5-16","076 4135 8857",
    "eleifend.non@protonmail.com",10006,10003),
  ("Nasim","Langley","Ap #123-1973 Consectetuer Road","Clovenfords","BH5W 0BT","2023-7-22","0800 745 5018",
    "ac.turpis@aol.ca",10007,10004),
  ("Isaac","Goodwin","5964 Etiam Rd.","Portsoy","SX5 9NL","2022-9-17","076 4467 9533",
    "convallis.ligula.donec@yahoo.edu",10008,10002),
  ("Rama","Durham","Ap #485-1138 Metus Road","Castle Douglas","VQ3 5HL","2022-5-26","056 6049 2392",
    "ac@yahoo.couk",10009,10003),
  ("Olivia","Cooper","331 Enim Street","New Radnor","OL4Y 7KH","2022-6-8","0360 828 6071",
    "feugiat.tellus.lorem@icloud.edu",10010,10002);

-- Employee
INSERT INTO `Employee` (`FirstName`,`LastName`,`EmployeeID`,`DateOfBirth`,`BranchID`,`HireDate`)
VALUES
  ("Trevor","Stout",10001,"2023-8-5",10002,"2022-7-31"),
  ("Hasad","Mathews",10002,"2023-11-26",10004,"2024-4-3"),
  ("Brock","Silva",10003,"2023-8-29",10001,"2023-11-11"),
  ("Chester","Houston",10004,"2023-5-23",10003,"2023-11-18"),
  ("Igor","Joseph",10005,"2024-3-18",10004,"2023-12-1");

-- Transaction
INSERT INTO `Transaction` (`DateAndTime`,`TransactionNumber`,`AccountNumber`,`EmployeeID`,`BranchID`)
VALUES
  ("2022-11-9",10001,84086,10002,10004),
  ("2023-1-8",10002,35989,10002,10004),
  ("2023-7-1",10003,77334,10005,10003),
  ("2024-4-25",10004,15860,10002,10003),
  ("2022-12-14",10005,43287,10001,10004),
  ("2022-12-14",10006,28198,10004,10002),
  ("2023-2-14",10007,94287,10003,10004),
  ("2023-5-16",10008,66360,10002,10004),
  ("2023-7-25",10009,74431,10004,10004),
  ("2024-2-24",10010,28163,10004,10003);

-- ShippingCompany
INSERT INTO `ShippingCompany` (`CompanyName`,`CompanyID`,`AddressLine1`,`AddressLine2`,`AddressLine3`,
  `ContactFirstName`,`ContactLastName`,`TelephoneNumber`,`Email`)
VALUES
  ("Egestas Incorporated",10001,"7976 Diam. Street","Cumbernauld","QJ4 5PK","Amir","Mccarty","07873 524978",
    "malesuada.augue@protonmail.couk"),
  ("Arcu Vestibulum Ut Foundation",10002,"7447 Nulla Rd.","Balfour","PG6W 8UU","Trevor","Garrett","076 9969 2579",
    "vivamus.nisi@outlook.com"),
  ("Fringilla Corporation",10003,"987-3078 Aliquam Rd.","St. Neots","CQ89 7UZ","Barclay","Peters","(010312) 11426",
  "lorem@icloud.org"),
  ("Ac Mattis Semper Consulting",10004,"273-3634 Elit Street","Rhyl","K87 2MS","Marvin","Thompson","07670 857492",
    "tempus@google.org"),
  ("Sodales Industries",10005,"P.O. Box 904, 2091 Mollis Rd.","Laurencekirk","S88 7NI","Cara","Randall","0317 758 2169",
    "cras.eu.tellus@google.org");

-- Supplier
INSERT INTO `Supplier` (`SupplierID`,`Name`,`AddressLine1`,`AddressLine2`,`AddressLine3`,
  `RegionType`,`ContactFirstName`,`ContactLastName`,`TelephoneNumber`,`Email`)
VALUES
  (10001,"Quis Massa Incorporated","Ap #327-8650 Curae Rd.","Selkirk","TE6U 4YG","Caithness",
    "Peter","Mcneil","0855 293 4121","lorem@outlook.net"),
  (10002,"Ligula Aliquam LLP","Ap #277-1171 Nullam St.","Bathgate","GI4 3HJ","Fife","Cole",
    "Taylor","056 4164 6931","consectetuer.adipiscing.elit@google.ca"),
  (10003,"Maecenas Malesuada LLP","777-4265 Nunc Rd.","Clovenfords","KD2Q 4OF","Norfolk",
    "Kathleen","Dixon","0845 46 42","sociis.natoque.penatibus@icloud.com"),
  (10004,"Lorem LLP","416 Aenean Rd.","East Kilbride","U2W 5XF","Selkirkshire",
    "Clare","Koch","(021) 2376 5630","nunc.nulla.vulputate@aol.com"),
  (10005,"A Magna PC","P.O. Box 507, 7169 Posuere Rd.","Southend","QB91 3OH","Shropshire",
    "Dora","Hess","(0111) 876 5726","donec.tempor@protonmail.com");

-- ProductType
INSERT INTO `ProductType` (`ProductTypeID`,`StartDate`,`EndDate`)
VALUES
  (10001,"2022-5-29","2026-1-3"),
  (10002,"2023-4-24","2026-2-11"),
  (10003,"2022-12-23","2025-1-20"),
  (10004,"2024-2-3","2025-3-23"),
  (10005,"2023-11-8","2024-11-30");

-- Product
INSERT INTO `Product` (`ProductName`,`ProductNameID`,`SupplierID`,`Price`,`Description`)
VALUES
  ("Lorem LLP",10001,10004,"1,092.11","luctus felis purus ac tellus. Suspendisse"),
  ("Sed Leo Institute",10002,10001,"161.67","mauris, rhoncus id, mollis nec, cursus a, enim."),
  ("Integer Corp.",10003,10003,"33.60","Vivamus non lorem vitae odio"),
  ("Semper Cursus Ltd",10004,10003,"909.71","orci, in consequat enim diam vel arcu. Curabitur"),
  ("Molestie Tortor Company",10005,10002,"1,039.15","Vivamus molestie dapibus ligula. Aliquam erat volutpat."),
  ("Viverra Maecenas Iaculis LLC",10006,10003,"1,264.64","Donec non justo. Proin non massa non ante bibendum ullamcorper."),
  ("Metus Institute",10007,10004,"94.19","porta elit, a feugiat tellus lorem eu metus."),
  ("Ac Turpis Incorporated",10008,10001,"1,469.17","et magnis dis parturient montes,"),
  ("Cursus Foundation",10009,10003,"1,274.32","sem, consequat nec, mollis vitae, posuere at, velit."),
  ("Quis Associates",10010,10002,"729.05","purus sapien, gravida");

-- TransactionProduct
INSERT INTO `TransactionProduct` (`TransactionNumber`,`Quantity`,`ProductTypeID`)
VALUES
  (54510,4,10002),
  (46745,6,10003),
  (59280,9,10003),
  (47478,9,10001),
  (62702,4,10004),
  (41623,6,10004),
  (24435,1,10004),
  (81259,9,10002),
  (21055,8,10003),
  (39192,2,10002);

--Shipment
INSERT INTO `Shipment` (`CompanyID`,`TransactionNumber`,`ShipmentID`,`BranchID`)
VALUES
  (10005,10003,10001,10005),
  (10001,10008,10002,10002),
  (10003,10006,10003,10005),
  (10005,10006,10004,10004),
  (10004,10010,10005,10004);

--------------------------------------------------------------------------------
-- Queries
--------------------------------------------------------------------------------

-- A - Queries.

-- 1. Customer Mailing List for email ordered by Branch.
-- This query gets the customers details ordered by branch to then send them mail by email or by post
select CustomerID, FirstName, LastName, Email, AddressLine1, AddressLine2, AddressLine3, BranchID
from Customer
order by BranchID;

-- 2. Production of daily branch sales report.
/*
This query produces a report of daily branch sales by joining the Transaction,
Employee, TransactionProduct, Product, and Supplier tables. It filters the
results to only show transactions that occurred today and orders them by branch ID and transaction date.
*/
SELECT t.TransactionNumber, t.DateAndTime, e.FirstName, e.LastName, s.Name,
 t.AccountNumber, tp.Quantity, p.Price, tp.Quantity * p.Price as TotalValue
FROM Transaction t
JOIN Employee e ON t.EmployeeID = e.EmployeeID
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
JOIN Product p ON tp.ProductTypeID = p.ProductNameID
JOIN Supplier s ON p.SupplierID = s.SupplierID
WHERE DATE(t.DateAndTime) = CURRENT_DATE
ORDER BY t.BranchID, t.DateAndTime;

-- 3. Production of a statement of transactions for a particular account.
/*
This query retrieves the transaction number, account number, and transaction
date and time from the Transaction table for a specific account number,
ordered by the transaction date and time.
*/
select TransactionNumber, AccountNumber, DateAndTime,
from Transaction
where AccountNumber = 77334 -- This is one of the account numbers in the database
order by DateAndTime

-- 4. Listing all the transactions carried out by a employee.
/*
This query retrieves all transactions carried out by an employee with a
specific last name, ordered by transaction date and time in descending order.
*/
SELECT t.*
FROM Transaction t
JOIN Employee e ON t.EmployeeID = e.EmployeeID
WHERE e.LastName = 'Houston' -- This is one of the last names of an employee
ORDER BY t.DateAndTime DESC;

-- 5. Finding the total sales of a product on a particular date.
/*
This query calculates the total sales of a specific product on a particular
date by joining the Transaction, TransactionProduct, and Product tables,
filtering for the specified date and product.
*/
SELECT p.ProductName, SUM(tp.Quantity) as TotalQuantity, SUM(tp.Quantity * p.Price) as TotalValue
FROM Transaction t
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
JOIN Product p ON tp.ProductTypeID = p.ProductNameID
WHERE DATE(t.DateAndTime) = '2022-12-14' AND p.ProductNameID = 10001;

-- B - Further Queries.

-- Sales analysis and statistics.

-- Most successful store on a particular day.
/*
This query retrieves the branch ID with the highest total sales on a specific
 date by joining the Transaction, TransactionProduct, and Product tables,
 filtering for the specified date, and grouping the results by branch ID.
*/
SELECT t.BranchID, SUM(tp.Quantity * p.Price) as TotalSales
FROM Transaction t
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
JOIN Product p ON tp.ProductTypeID = p.ProductNameID
WHERE DATE(t.DateAndTime) = '2022-12-14'
GROUP BY t.BranchID
ORDER BY TotalSales DESC
LIMIT 1;

--  Most successsful store in selling a new product group/type.
/*
This query retrieves the branch ID with the highest total quantity sold for
a specific product type by joining the Transaction and TransactionProduct
tables, filtering for the specified product type, and grouping the results by branch ID.
*/
SELECT t.BranchID, SUM(tp.Quantity) as TotalQuantity
FROM Transaction t
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
WHERE tp.ProductTypeID = 10001
GROUP BY t.BranchID
ORDER BY TotalQuantity DESC
LIMIT 1;

-- Accounts not active in the last month.
/*
This query gets all the account numbers where the date is below the last transaction date.
This query does not order the data in an particular way.
*/
SELECT DISTINCT AccountNumber
FROM Transaction
WHERE DateAndTime < DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH);

-- Customers that have made 5 or more transactions whithin a period of 6 months
/*
This query lists account numbers with 5 or more transactions in the past 6 months.
 It groups the data by account number and it dosent order it in any way.
*/
SELECT t.AccountNumber, COUNT(*) as TransactionCount
FROM Transaction t
WHERE t.DateAndTime >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
GROUP BY t.AccountNumber
HAVING TransactionCount >= 5;

-- A bonus award
/*
This query lists employees with total sales exceeding a certain amount which
is 1000 in the past month, making them eligible for a bonus award or amount for pay.
It groups the data by employee IDs and dosent order it.
*/
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(tp.Quantity * p.Price) as TotalSales
FROM Transaction t
JOIN Employee e ON t.EmployeeID = e.EmployeeID
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
JOIN Product p ON tp.ProductTypeID = p.ProductNameID
WHERE DATE(t.DateAndTime) >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
GROUP BY e.EmployeeID
HAVING TotalSales > 1000;

-- Update Prices / decrease price by 25%
/*
This query updates the prices of products with a specific product name ID, reducing their prices by 25%.
*/
UPDATE Product
SET Price = Price * 0.75
WHERE ProductNameID = 10001;
-- Expected: Rows Matched: x Changed: x Warnings: 0
/*
APART OF PREVIOUS SQL CODE AND EXPLANATION
*/
SELECT *
FROM Product
WHERE ProductNameID = 10001
ORDER BY Price DESC;

-- Other Useful Queries

-- List the average transaction value per branch.
/*
This query calculates the average transaction price for each branch by using
and average command and the price and quantity of the transactions. It then
groups the data by the branch IDs.
*/
SELECT t.BranchID, AVG(tp.Quantity * p.Price) as AvgTransactionValue
FROM Transaction t
JOIN TransactionProduct tp ON t.TransactionNumber = tp.TransactionNumber
JOIN Product p ON tp.ProductTypeID = p.ProductNameID
GROUP BY t.BranchID;

-- List suppliers and the amount of products they are selling
/*
This query retrieves the supplier name and the number of products they are
selling, ordering the results by product count in descending order.
*/
SELECT s.Name, COUNT(p.ProductNameID) as ProductCount
FROM Supplier s
JOIN Product p ON s.SupplierID = p.SupplierID
GROUP BY s.Name
ORDER BY ProductCount DESC;

-- List employees that have worked for a specific period of time. For example more than a year.
/*
This query lists the employee IDs, first names, and last names of employees
who have worked for more than a year.
*/
SELECT EmployeeID, FirstName, LastName
FROM Employee
WHERE HireDate <= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR);
