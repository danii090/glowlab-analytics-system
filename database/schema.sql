CREATE DATABASE GlowLab;
GO

USE GlowLab;
GO

-- Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL
);

-- Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(150),
    Email VARCHAR(150),
    City VARCHAR(100)
);

-- Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Order Details
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    Stock INT,
    LastUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);