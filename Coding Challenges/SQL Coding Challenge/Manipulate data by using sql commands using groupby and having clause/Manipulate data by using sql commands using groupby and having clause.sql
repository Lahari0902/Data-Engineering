-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary) VALUES
(1, 'Arjun', 'Reddy', 30, 'HR', 55000),
(2, 'Manoj', 'Nair', 25, 'IT', 60000),
(3, 'Lakshmi', 'Iyer', 40, 'Finance', 70000),
(4, 'Venkatesh', 'Raj', 35, 'IT', 65000),
(5, 'Sneha', 'Menon', 28, 'HR', 58000);

---------Manipulate data by using sql commands using groupby and having clause---------
--1. Get the total salary expense for each department (GROUP BY)
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

--2. List departments where the number of employees is greater than 1 (GROUP BY and HAVING)
SELECT Department, COUNT(EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(EmployeeID) > 1;

--3. Get the number of employees in each department who earn more than 55,000 (WHERE and GROUP BY)
SELECT Department, COUNT(EmployeeID) AS EmployeesAbove55K
FROM Employees
WHERE Salary > 55000
GROUP BY Department;

--4. Find the departments where the total salary exceeds 100,000 (GROUP BY and HAVING)
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 100000;

--5. Departments where the total salary exceeds 100,000, and the average salary of employees in those departments 
--is greater than 60,000. Only include departments with more than one employee (GROUP BY, HAVING and WHERE)
SELECT Department, SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary, COUNT(EmployeeID) AS EmployeeCount
FROM Employees
WHERE Salary > 50000  -- Only consider employees earning more than 50,000
GROUP BY Department
HAVING SUM(Salary) > 100000 AND AVG(Salary) > 60000 AND COUNT(EmployeeID) > 1;
