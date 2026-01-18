-- =========================
-- Little Lemon Database
-- =========================

DROP DATABASE IF EXISTS LittleLemonDB;
CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

-- Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(200) NOT NULL,
    Email VARCHAR(200),
    Phone VARCHAR(50)
);

-- Restaurant Tables
CREATE TABLE RestaurantTables (
    TableNo INT PRIMARY KEY,
    Capacity INT NOT NULL
);

-- Bookings
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNo INT NOT NULL,
    CustomerID INT NOT NULL,
    CONSTRAINT fk_booking_table
        FOREIGN KEY (TableNo) REFERENCES RestaurantTables(TableNo),
    CONSTRAINT fk_booking_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu Items
CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    ItemType VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL
);

-- Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    BookingID INT,
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orders_booking
        FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Order Items
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderitems_menuitem
        FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

