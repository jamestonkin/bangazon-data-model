DELETE FROM EmployeesTrainingPrograms;
DELETE FROM TrainingPrograms;
DELETE FROM Computers;
DELETE FROM Employees;
DELETE FROM Departments;
DELETE FROM ProductTypes;
DELETE FROM Products;
DELETE FROM PaymentTypes;
DELETE FROM Customers;
DELETE FROM Orders;

DROP TABLE IF EXISTS EmployeesTrainingPrograms;
DROP TABLE IF EXISTS TrainingPrograms;
DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Departments (
    DepartmentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL,
	Budget INT NOT NULL
);

INSERT INTO Departments VALUES (null, 'IT', 200000);
INSERT INTO Departments VALUES (null, 'Operations', 175000);
INSERT INTO Departments VALUES (null, 'Human Resources', 50000);

SELECT * FROM Departments

CREATE TABLE TrainingPrograms (
    TrainingProgramId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL,
    StartDate TEXT NOT NULL,
    EndDate TEXT NOT NULL,
	MaxStudents INT NOT NULL
);

INSERT INTO TrainingPrograms VALUES (null, 'Leadership', '4-24-2017', '4-28-2017', 15);
INSERT INTO TrainingPrograms VALUES (null, 'First Aid', '5-01-2017', '5-28-2017', 10);
INSERT INTO TrainingPrograms VALUES (null, 'Ladder Safety', '4-24-2017', '4-25-2017', 5);

SELECT * FROM TrainingPrograms

CREATE TABLE Employees (
	EmployeeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FirstName TEXT NOT NULL,
	LastName TEXT NOT NULL,
	DeptId INTEGER NOT NULL,
	FOREIGN KEY (DeptId) REFERENCES Departments(DepartmentId)
);

INSERT INTO Employees VALUES (null, 'James', 'Tonkin', 1);
INSERT INTO Employees VALUES (null, 'Nick', 'Nash', 2);
INSERT INTO Employees VALUES (null, 'Dean', 'Smith', 3);

SELECT * FROM Employees

CREATE TABLE Computers (
	ComputerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	PurchaseDate TEXT NOT NULL,
	DecomDate TEXT NOT NULL,
	EmployeeId INTEGER NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

INSERT INTO Computers VALUES (null, '3-15-2015', 'Active', 3);
INSERT INTO Computers VALUES (null, '6-30-2016', 'Active', 2);
INSERT INTO Computers VALUES (null, '1-10-2017', 'Active', 1);

SELECT * FROM Computers

CREATE TABLE EmployeesTrainingPrograms (
	EmployeeTrainingProgramId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	EmployeeId INT NOT NULL,
	TrainingProgramId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
	FOREIGN KEY (TrainingProgramId) REFERENCES TrainingPrograms(TrainingProgramId)
);

INSERT INTO EmployeesTrainingPrograms VALUES (null, 1, 3);
INSERT INTO EmployeesTrainingPrograms VALUES (null, 2, 1);
INSERT INTO EmployeesTrainingPrograms VALUES (null, 3, 2);

SELECT * FROM EmployeesTrainingPrograms

CREATE TABLE ProductTypes (
	ProductTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL
);

INSERT INTO ProductTypes VALUES (null, 'Furniture');
INSERT INTO ProductTypes VALUES (null, 'Chemical');
INSERT INTO ProductTypes VALUES (null, 'Auto Parts');

SELECT * FROM ProductTypes

CREATE TABLE Customers (
	CustomerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	LastName TEXT NOT NULL,
	FirstName TEXT NOT NULL,
	DateCreated TEXT NOT NULL,
	Active INT NOT NULL
);

INSERT INTO Customers VALUES (null, 'Ramis', 'Harold', '2-07-2014', 0);
INSERT INTO Customers VALUES (null, 'Murray', 'Bill', '12-10-2016', 1);
INSERT INTO Customers VALUES (null, 'Akroyd', 'Dan', '10-21-2017', 1);

SELECT * FROM Customers

CREATE TABLE PaymentTypes (
	PaymentTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	AccountNumber INT NOT NULL,
	CustomerID INT NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

INSERT INTO PaymentTypes VALUES (null, 0001000200030004, 1);
INSERT INTO PaymentTypes VALUES (null, 0001000250030004, 2);
INSERT INTO PaymentTypes VALUES (null, 0001000298030004, 3);

SELECT * FROM PaymentTypes

CREATE TABLE Products (
	ProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Title TEXT NOT NULL,
	Price INT NOT NULL,
	Description TEXT NOT NULL,
	ProductTypeID INT NOT NULL,
	FOREIGN KEY (ProductTypeId) REFERENCES ProductTypes(ProductTypeId)
);

INSERT INTO Products VALUES (null, "Couch", 599, "Seats 3, Brown in Color", 1);
INSERT INTO Products VALUES (null, "Bleach", 3, "1 Gallon of standard bleach", 2);
INSERT INTO Products VALUES (null, "Tree Air Freshener", 3, "Pack of 3 Air Fresheners", 3);

SELECT * FROM Products

CREATE TABLE Orders (
	OrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	CustomerId INT NOT NULL,
	PaymentTypeID INT NOT NULL,
	ProductId INT NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
	FOREIGN KEY (PaymentTypeId) REFERENCES PaymentTypes(PaymentTypeId),
	FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);	

INSERT INTO Orders VALUES (null, 1, 1, 3);
INSERT INTO Orders VALUES (null, 2, 2, 1);
INSERT INTO Orders VALUES (null, 3, 3, 2);

SELECT * FROM Orders
