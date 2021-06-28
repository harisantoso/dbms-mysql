-- inner join 
SELECT firstName,lastName, city
FROM employees INNER JOIN offices
ON employees.officeCode = offices.officeCode

-- cara singkat melakukan inner join
-- USING digunakan ketika nama labelnya sama dan saling berhubungan
SELECT firstName,lastName, city
FROM employees INNER JOIN offices
USING (officeCode);

-- contoh lain 
SELECT firstName,lastName,customerName
FROM employees INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
LIMIT 15;

-- menggabungkan dua kolom antara firstName dan lastName
-- menggunakan concat
SELECT CONCAT(firstName,'',lastName) AS 'Full Name',customerName
FROM employees INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
LIMIT 15;