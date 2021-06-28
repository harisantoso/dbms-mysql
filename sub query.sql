-- * Penggunaan sub query
-- sub query adalah query yg berada dalam query lainnya
-- atau sering disebut nested query

-- * nested query biasanya digunakan untuk menyelesaikan
-- permasalahan query atau sql yg lebih komplek

-- 1. Siapa kariawan yg melapor (reportsTo) ke Murphy Diane
 SELECT employeeNumber,firstName,lastName,reportsTo
    -> FROM employees
    -> ;
+----------------+-----------+-----------+-----------+
| employeeNumber | firstName | lastName  | reportsTo |
+----------------+-----------+-----------+-----------+
|           1002 | Diane     | Murphy    |      NULL |
|           1056 | Mary      | Patterson |      1002 |
|           1076 | Jeff      | Firrelli  |      1002 |
|           1088 | William   | Patterson |      1056 |
|           1102 | Gerard    | Bondur    |      1056 |
+----------------+-----------+-----------+-----------+

SELECT employeeNumber
    -> FROM employees
    -> WHERE firstName='Diane' AND lastName='Murphy';
+----------------+
| employeeNumber |
+----------------+
|           1002 |
+----------------+
-- subquery kariawan mana saja yg melapor berdasarkan employeeNumber
SELECT employeeNumber,firstName,lastName
FROM employees
WHERE reportsTo IN (
SELECT employeeNumber
FROM employees
WHERE firstName='Diane' AND lastName='Murphy');
+----------------+-----------+-----------+
| employeeNumber | firstName | lastName  |
+----------------+-----------+-----------+
|           1056 | Mary      | Patterson |
|           1076 | Jeff      | Firrelli  |
+----------------+-----------+-----------+

-- 2. Tampilkan Nama Produk Classic Cars yg harga belinya
-- diatas rata-rata 

-- menampilkan harga rata-rata terlebih dahulu
SELECT AVG(buyPrice)
FROM products
WHERE productLine='Classic Cars';
+---------------+
| AVG(buyPrice) |
+---------------+
|     64.446316 |
+---------------+
-- lalu menampilkan harga yg diatas rata2
SELECT productName,buyPrice FROM products
WHERE productLine='Classic Cars' AND buyPrice > (
SELECT AVG(buyPrice)
FROM products
WHERE productLine='Classic Cars');
+-----------------------------------+----------+
| productName                       | buyPrice |
+-----------------------------------+----------+
| 1952 Alpine Renault 1300          |    98.58 |
| 1972 Alfa Romeo GTA               |    85.68 |
| 1962 LanciaA Delta 16V            |   103.42 |
| 1968 Ford Mustang                 |    95.34 |
| 2001 Ferrari Enzo                 |    95.59 |
| 1969 Corvair Monza                |    89.14 |
| 1968 Dodge Charger                |    75.16 |
| 1969 Ford Falcon                  |    83.05 |
| 1993 Mazda RX-7                   |    83.51 |
| 1965 Aston Martin DB5             |    65.96 |
| 1995 Honda Civic                  |    93.89 |
| 1998 Chrysler Plymouth Prowler    |   101.51 |
| 1992 Ferrari 360 Spider red       |    77.90 |
| 1976 Ford Gran Torino             |    73.49 |
| 1970 Triumph Spitfire             |    91.92 |
| 1957 Corvette Convertible         |    69.93 |
| 1952 Citroen-15CV                 |    72.82 |
| 1956 Porsche 356A Coupe           |    98.30 |
| 1992 Porsche Cayenne Turbo Silver |    69.78 |
+-----------------------------------+----------+