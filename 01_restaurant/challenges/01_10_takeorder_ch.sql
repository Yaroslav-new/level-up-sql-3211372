-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

INSERT INTO Customers (FirstName, LastName, Address) 
SELECT 'Loretta', 'Hundey', '6939 Elka Place'
WHERE NOT EXISTS (
    SELECT 1 FROM Customers WHERE LastName = 'Hundey' AND Address = '6939 Elka Place'
);

INSERT INTO Orders (CustomerID, OrderDate) 
VALUES (
    (SELECT CustomerID FROM Customers WHERE LastName = 'Hundey' AND Address = '6939 Elka Place'),
    '2022-09-20 14:00:00'
);

INSERT INTO OrdersDishes (OrderID, DishID)
SELECT 
    (SELECT OrderID FROM Orders 
     WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE LastName = 'Hundey' AND Address = '6939 Elka Place')
     ORDER BY OrderDate DESC LIMIT 1),
    DishID
FROM Dishes
WHERE Name IN ('House Salad', 'Mini Cheeseburgers', 'Tropical Blue Smoothie');

SELECT Dishes.*
FROM Dishes 
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID 
WHERE OrdersDishes.OrderID = (
    SELECT OrderID FROM Orders 
    WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE LastName = 'Hundey' AND Address = '6939 Elka Place')
    ORDER BY OrderDate DESC LIMIT 1
);

SELECT SUM(Dishes.Price) AS TotalCost
FROM Dishes 
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID 
WHERE OrdersDishes.OrderID = (
    SELECT OrderID FROM Orders 
    WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE LastName = 'Hundey' AND Address = '6939 Elka Place')
    ORDER BY OrderDate DESC LIMIT 1
);