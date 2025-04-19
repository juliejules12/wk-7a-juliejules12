-- Drop tables if they exist to avoid errors
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderItems;

-- ========================================
-- Step 1: Create the Orders table
-- This removes the partial dependency by storing OrderID and CustomerName separately
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert unique OrderID and CustomerName pairs into Orders
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- ========================================
-- Step 3: Create the OrderItems table
-- OrderItems will store OrderID, Product, and Quantity
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert order item details (product and quantity)
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
