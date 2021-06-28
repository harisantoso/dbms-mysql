-- http://www.richardtwatson.com/dm6e/reader/classicmodels.html

-- 1. Tampilkan daftar office diurutkan berdasarkan coutry, state, city?
SELECT officeCode,country,state,city
FROM offices
ORDER BY country,state,city;
+------------+-----------+------------+---------------+
| officeCode | country   | state      | city          |
+------------+-----------+------------+---------------+
| 6          | Australia | NULL       | Sydney        |
| 4          | France    | NULL       | Paris         |
| 5          | Japan     | Chiyoda-Ku | Tokyo         |
| 7          | UK        | NULL       | London        |
| 1          | USA       | CA         | San Francisco |
| 2          | USA       | MA         | Boston        |
| 3          | USA       | NY         | NYC           |
+------------+-----------+------------+---------------+

-- 2. Ada berapa orng karyawan di perusahaan?
SELECT COUNT(*) FROM employees;
+----------+
| COUNT(*) |
+----------+
|       23 |
+----------+

SELECT COUNT(*) AS 'Banyak Kariawan' FROM employees;

-- 3. Berapa total pembayaran yg telah diterima?
SELECT SUM(amount) FROM payments;
+-------------+
| SUM(amount) |
+-------------+
|  8853839.23 |
+-------------+
-- cata format yg lebih mudah dilihat
SELECT FORMAT(SUM(amount),0) AS total FROM payments; 
+-----------+
| total     |
+-----------+
| 8,853,839 |
+-----------+
SELECT FORMAT(SUM(amount),2) AS total FROM payments; 
+--------------+
| total        |
+--------------+
| 8,853,839.23 |
+--------------+

-- 4. Tampilkan productLine yg mengandung kata Car?
SELECT productLine FROM productLines
WHERE productLine LIKE "%Car%";
+--------------+
| productLine  |
+--------------+
| Classic Cars |
| Vintage Cars |
+--------------+

-- 5. Laporkan pembayaran pada 28 Oktober 2004
SELECT FORMAT(SUM(amount),0) AS 'Laporkan pembayaran pada 28 Oktober 2004'
FROM payments 
WHERE paymentDate = '2004-10-28';
+-----------------------+      +-------------------------------------+ 
| FORMAT(SUM(amount),0) |  AS  | Laporkan pembayaran 28 Oktober 2004 |
+-----------------------+      +-------------------------------------+
| 47,411                |      | 47,411                              |
+-----------------------+      +-------------------------------------+

-- 6. Laporkan pembayaran yg lebih dari 100.000 pada tanggal tersebut
-- 28 Oktober 2004?
SELECT * FROM payments 
WHERE paymentDate = '2004-10-28' AND amount > 100000;
-- Empty set / tidak ada hasil

SELECT * FROM payments 
WHERE amount > 100000;
+----------------+-------------+-------------+-----------+
| customerNumber | checkNumber | paymentDate | amount    |
+----------------+-------------+-------------+-----------+
|            124 | AE215433    | 2005-03-05  | 101244.59 |
|            124 | KI131716    | 2003-08-15  | 111654.40 |
|            141 | ID10962     | 2004-12-31  | 116208.40 |
|            141 | JE105477    | 2005-03-18  | 120166.58 |
|            148 | KM172879    | 2003-12-26  | 105743.00 |
+----------------+-------------+-------------+-----------+

-- 7. Tampilkan produk untuk setiap productLine?
SELECT productLine,productName
FROM products 
ORDER BY productLine;
-- hanya ditampilkan sebagian
+------------------+---------------------------------------------+
| productLine      | productName                                 |
+------------------+---------------------------------------------+
| Classic Cars     | 1976 Ford Gran Torino                       |
| Classic Cars     | 1952 Citroen-15CV                           |
| Motorcycles      | 1982 Ducati 900 Monster                     |
| Motorcycles      | 2002 Yamaha YZR M1                          |
| Planes           | 1900s Vintage Tri-Plane                     |
| Planes           | P-51-D Mustang                              |
| Ships            | The Schooner Bluenose                       |
| Ships            | The Queen Mary                              |
| Trains           | Collectable Wooden Train                    |
| Trucks and Buses | 1996 Peterbilt 379 Stake Bed with Outrigger |
| Trucks and Buses | Diamond T620 Semi-Skirted Tanker            |
| Vintage Cars     | 1904 Buick Runabout                         |
| Vintage Cars     | 1928 Mercedes-Benz SSK                      |
+------------------+---------------------------------------------+
-- menampilan cara concat
SELECT productLine,GROUP_CONCAT(productName)
FROM products 
GROUP BY productLine;
ORDER BY productLine;
-- tampilan terlalu lebar kurang menarik

-- 8. Ada berapa produk di setiap productLine?
SELECT productLine,COUNT(*) AS 'Banyak Produk'
FROM products
GROUP BY productLine;
+------------------+---------------+
| productLine      | Banyak Produk |
+------------------+---------------+
| Classic Cars     |            38 |
| Motorcycles      |            13 |
| Planes           |            12 |
| Ships            |             9 |
| Trains           |             3 |
| Trucks and Buses |            11 |
| Vintage Cars     |            24 |
+------------------+---------------+

-- 9. Berapa pembayaran minimum yg diterima?
SELECT MIN(amount) FROM payments;
+-------------+
| MIN(amount) |
+-------------+
|      615.45 |
+-------------+

-- 10. Tampilkan pembayaran yg lebih besar, dari dua kali rata-rata pembayaran?
-- mencari rara-rata pembayaran terlebih dahulu
SELECT AVG(amount)*2 AS 'Rata-rata' FROM payments;
+--------------+
| Rata-rata    |
+--------------+
| 64863.291062 |
+--------------+

SELECT * FROM payments WHERE amount > (
SELECT AVG(amount)*2 AS rata FROM payments
);
+----------------+-------------+-------------+-----------+
| customerNumber | checkNumber | paymentDate | amount    |
+----------------+-------------+-------------+-----------+
|            114 | MA765515    | 2004-12-15  |  82261.22 |
|            124 | AE215433    | 2005-03-05  | 101244.59 |
|            124 | BG255406    | 2004-08-28  |  85410.87 |
|            124 | ET64396     | 2005-04-16  |  83598.04 |
|            124 | KI131716    | 2003-08-15  | 111654.40 |
|            141 | ID10962     | 2004-12-31  | 116208.40 |
|            141 | IN446258    | 2005-03-25  |  65071.26 |
|            141 | JE105477    | 2005-03-18  | 120166.58 |
|            148 | KM172879    | 2003-12-26  | 105743.00 |
|            167 | GN228846    | 2003-12-03  |  85024.46 |
|            239 | NQ865547    | 2004-03-15  |  80375.24 |
|            321 | DJ15149     | 2003-11-03  |  85559.12 |
|            323 | AL493079    | 2005-05-23  |  75020.13 |
+----------------+-------------+-------------+-----------+

-- 11. Berapa rata-rata keuntungan pada produk (MSRP - buyPrice)?
SELECT MSRP-buyPrice
FROM products;

SELECT AVG(MSRP-buyPrice) AS 'Rata-rata Keuntungan'
FROM products;
+----------------------+
| Rata-rata Keuntungan |
+----------------------+
|            46.043545 |
+----------------------+

-- 12. Berapa banyak produkLine unik (tanpa duplikat) yg dijual ClassicModels?
-- semua akan tampil producLine
SELECT productLine FROM products;

-- menggunakan distinct untuk menampilkan hanya yg unik saja
SELECT productLine FROM products;
+------------------+
| productLine      |
+------------------+
| Classic Cars     |
| Motorcycles      |
| Planes           |
| Ships            |
| Trains           |
| Trucks and Buses |
| Vintage Cars     |
+------------------+

-- 13. Tampilkan nama dan kota customer yg tidak memiliki Sales Representative?
-- cek terlebih dahulu
SELECT customerName,city,salesRepEmployeeNumber
FROM customers;

-- customer yg tidak memiliki Sales Representative
SELECT customerName,city,salesRepEmployeeNumber
FROM customers
WHERE SalesRepEmployeeNumber IS NULL;

-- 14. Tampilkan nama beserta jabatan dari employess dengan title VP atau manager?
SELECT * FROM employees
WHERE jobTitle LIKE "%VP%" OR jobTitle LIKE "%Manager%";
-- atau
SELECT CONCAT(firstName," ",lastName) AS 'Nama Lengkap', jobTitle
FROM employees
WHERE jobTitle LIKE "%VP%" OR jobTitle LIKE "%Manager%";
+-------------------+----------------------+
| Nama Lengkap      | jobTitle             |
+-------------------+----------------------+
| Mary Patterson    | VP Sales             |
| Jeff Firrelli     | VP Marketing         |
| William Patterson | Sales Manager (APAC) |
| Gerard Bondur     | Sale Manager (EMEA)  |
| Anthony Bow       | Sales Manager (NA)   |
+-------------------+----------------------+

-- 15. Order detail mana yg bernilai lebih dari 5.000?
SELECT * FROM orderdetails WHERE priceEach * quantityOrdered;
-- atau 
SELECT orderNumber,productCode, SUM(priceEach * quantityOrdered) AS total_order
FROM orderdetails
GROUP BY orderNumber
HAVING total_order > 5000;