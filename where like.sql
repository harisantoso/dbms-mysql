-- menampilkan firstName dan lastName employees 
SELECT firstName, lastName FROM employees;

-- mencari firstName yg berawalan huruf a/A
SELECT firstName FROM employees
WHERE firstName LIKE "A%";

-- mencari lastName yg berakhiran huruf on
SELECT lastName FROM employees
WHERE lastName LIKE "%on";

-- mencari firstName dintara huruf li
SELECT firstName FROM employees
WHERE firstName LIKE "%li%";

-- mencari product awalan huruf a/A
SELECT productName FROM products
WHERE productName LIKE "20%";

-- mencari product yg memiliki kata yamaha
SELECT productName FROM products
WHERE productName LIKE "%yamaha%";

-- mencari wile card firstName ditabel employe yg
-- memiliki tiga karakter hurup diawali huruf t
-- dan diakhiri huruf m (menggunaka underscroe lebuh spesifik)
SELECT firstName FROM employees
WHERE firstName LIKE "T_m";

-- untuk membalikan menggunaka NOT LIKE 
-- penggunaan LIKE ada dua wilecard yaitu "_" dan "%" 

