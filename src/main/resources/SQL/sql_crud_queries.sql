-- SQL for creating an employee
INSERT INTO Employee (empId, name, phoneNumber, username, password, email)
VALUES (?, ?, ?, ?, ?, ?);

-- SQL for updating an employee
UPDATE Employee SET name = ?, phoneNumber = ?, password = ?, email = ?
WHERE username = ?;

-- SQL for deleting an employee
DELETE FROM Employee WHERE username = ?;

-- SQL for retrieving an employee by username
SELECT * FROM Employee WHERE username = ?;

-- SQL for retrieving all employees
SELECT * FROM Employee;


