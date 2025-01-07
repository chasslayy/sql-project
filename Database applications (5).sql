-- Entity 1: Product
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Category VARCHAR(100),
    Stock_Quantity INT NOT NULL,
    Reorder_Level INT NOT NULL,
    Supplier_ID INT,
    Warehouse_ID INT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(Warehouse_ID)
);

-- Entity 2: Supplier
CREATE TABLE Supplier (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact_Person VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

-- Entity 3: Warehouse
CREATE TABLE Warehouse (
    Warehouse_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(100),
    Capacity INT,
    Manager VARCHAR(100)
);

-- Entity 4: Order
CREATE TABLE `Order` (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Date DATE NOT NULL,
    Delivery_Address TEXT NOT NULL,
    Status VARCHAR(50),
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Entity 5: Order_Details
CREATE TABLE Order_Details (
    Detail_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Price_Per_Unit DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Entity 6: Customer
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Delivery_Address TEXT NOT NULL
);

-- Entity 7: Employee
CREATE TABLE Employee (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Department VARCHAR(50)
);

-- Entity 8: Supplier_Performance
CREATE TABLE Supplier_Performance (
    Performance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_ID INT,
    On_Time_Delivery BOOLEAN,
    Quality DECIMAL(3, 2),
    Pricing_Competitiveness DECIMAL(3, 2),
    Remarks TEXT,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Entity 9: OrderReturn
CREATE TABLE OrderReturn (
    Return_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Customer_ID INT,
    Reason TEXT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Populate Supplier
INSERT INTO Supplier (Name, Contact_Person, Phone, Email, Address)
VALUES ('Best Supplies Co.', 'John Doe', '123-456-7890', 'john@supplyco.com', '123 Supply St, NY');

-- Populate Warehouse
INSERT INTO Warehouse (Location, Capacity, Manager)
VALUES ('New York', 500, 'Alice Johnson');

-- Populate Customer
INSERT INTO Customer (Name, Phone, Email, Delivery_Address)
VALUES ('Jane Smith', '987-654-3210', 'jane.smith@example.com', '456 Maple Ave, NY');

-- Populate Product
INSERT INTO Product (Name, Description, Category, Stock_Quantity, Reorder_Level, Supplier_ID, Warehouse_ID, Price)
VALUES ('Laptop', 'High-end laptop', 'Electronics', 50, 10, 1, 1, 1200.00);

pip install flask mysql-connector-python

shopease/
├── app.py               # Main application file
├── templates/           # HTML templates
│   ├── base.html
│   ├── products.html
│   ├── orders.html
├── static/              # Static files (CSS, JS)

