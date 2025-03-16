-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT DishID 
FROM Dishes 
WHERE Name = 'Quinoa Salmon Salad'
LIMIT 1;

SELECT CustomerID, FirstName, LastName, FavoriteDish 
FROM Customers 
WHERE FirstName = 'Cleo' 
  AND LastName = 'Goldwater'
LIMIT 1;

UPDATE Customers 
SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad' LIMIT 1)
WHERE FirstName = 'Cleo' 
  AND LastName = 'Goldwater';

SELECT Customers.FirstName, Customers.LastName, Dishes.Name AS FavoriteDish 
FROM Customers 
JOIN Dishes ON Customers.FavoriteDish = Dishes.DishID
WHERE Customers.FirstName = 'Cleo' 
  AND Customers.LastName = 'Goldwater';
