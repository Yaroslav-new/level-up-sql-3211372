-- Create a table in the database to store customer
-- responses to our anniversary invitation.

-- Associate a customer's ID number with the number of people
-- they plan to bring in their party.

-- Hint: SQLite offers the INTEGER and REAL datatypes

CREATE TABLE Anniversary (
    customer_id INTEGER PRIMARY KEY,  
    party_size INTEGER NOT NULL       
);