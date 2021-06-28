-- 1. Tamilkan produk yang terjual berdasarkan order date?
SELECT orderDate,ProductName
FROM Products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
ORDER BY orderDate;
===========CARA PENULISAN LAIN===================
SELECT orderDate,ProductName
FROM Products,orderdetails,orders
INNER JOIN orderdetails ON Products.productCode = orderdetails.productCode
INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
ORDER BY orderDate;
===========CARA PENULISAN LAIN===================
SELECT orderDate,ProductName
FROM Products,orderdetails,orders
WHERE Products.productCode = orderdetails.productCode 
AND orderdetails.orderNumber = orders.orderNumber
ORDER BY orderDate;

-- 2. Tampilkan semua order atas produk 1940 Ford Pickup Truck?
SELECT orderNumber,orderDate,ProductName
FROM Products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
WHERE productName = '1940 Ford Pickup Truck';
+-------------+------------+------------------------+
| orderNumber | orderDate  | ProductName            |
+-------------+------------+------------------------+
|       10103 | 2003-01-29 | 1940 Ford Pickup Truck |
|       10113 | 2003-03-26 | 1940 Ford Pickup Truck |
|       10126 | 2003-05-28 | 1940 Ford Pickup Truck |
|       10140 | 2003-07-24 | 1940 Ford Pickup Truck |
|       10150 | 2003-09-19 | 1940 Ford Pickup Truck |
|       10164 | 2003-10-21 | 1940 Ford Pickup Truck |
|       10174 | 2003-11-06 | 1940 Ford Pickup Truck |
|       10183 | 2003-11-13 | 1940 Ford Pickup Truck |
|       10194 | 2003-11-25 | 1940 Ford Pickup Truck |
|       10206 | 2003-12-05 | 1940 Ford Pickup Truck |
|       10215 | 2004-01-29 | 1940 Ford Pickup Truck |
|       10228 | 2004-03-10 | 1940 Ford Pickup Truck |
|       10245 | 2004-05-04 | 1940 Ford Pickup Truck |
|       10258 | 2004-06-15 | 1940 Ford Pickup Truck |
|       10270 | 2004-07-19 | 1940 Ford Pickup Truck |
|       10280 | 2004-08-17 | 1940 Ford Pickup Truck |
|       10291 | 2004-09-08 | 1940 Ford Pickup Truck |
|       10304 | 2004-10-11 | 1940 Ford Pickup Truck |
|       10312 | 2004-10-21 | 1940 Ford Pickup Truck |
|       10322 | 2004-11-04 | 1940 Ford Pickup Truck |
|       10333 | 2004-11-18 | 1940 Ford Pickup Truck |
|       10347 | 2004-11-29 | 1940 Ford Pickup Truck |
|       10357 | 2004-12-10 | 1940 Ford Pickup Truck |
|       10370 | 2005-01-20 | 1940 Ford Pickup Truck |
|       10381 | 2005-02-17 | 1940 Ford Pickup Truck |
|       10391 | 2005-03-09 | 1940 Ford Pickup Truck |
|       10411 | 2005-05-01 | 1940 Ford Pickup Truck |
|       10424 | 2005-05-31 | 1940 Ford Pickup Truck |
+-------------+------------+------------------------+

-- 3. Tampilkan nama customer dan order mumber dimana ordernya memiliki nilai lebih dari 25.000?
SELECT customerName, orderNumber, SUM(quantityOrdered * priceEach) AS NilaiOrder
FROM customers 
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber
HAVING NilaiOrder > 25000;

+------------------------------------+-------------+------------+
| customerName                       | orderNumber | NilaiOrder |
+------------------------------------+-------------+------------+
| Baane Mini Imports                 |       10103 |   50218.95 |
| Euro+ Shopping Channel             |       10104 |   40206.20 |
| Danish Wholesale Imports           |       10105 |   53959.21 |
| Euro+ Shopping Channel             |       10424 |   29310.30 |
-----------------------/sampai dengan/---------------------------
| La Rochelle Gifts                  |       10425 |   41623.44 |
+------------------------------------+-------------+------------+
192 rows

-- 4. Apakah ada produk yang terdapat di setiap ordernya?
SELECT productCode,COUNT(*) AS Banyak
FROM orderdetails
GROUP BY productCode
HAVING Banyak =(
SELECT COUNT(*) FROM orders
);
Empty set

-- 5. Tampilkan order yang memiliki harga jual kurang dari MSRP nya?
SELECT orderNumber,ProductName,priceEach,MSRP
FROM Products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
WHERE priceEach < MSRP;
+-------------+---------------------------------------------+-----------+--------+
| orderNumber | ProductName                                 | priceEach | MSRP   |
+-------------+---------------------------------------------+-----------+--------+
|       10123 | 1965 Aston Martin DB5                       |    120.71 | 124.44 |
|       10123 | 1999 Indy 500 Monte Carlo SS                |    114.84 | 132.00 |
|       10123 | 1948 Porsche Type 356 Roadster              |    117.26 | 141.28 |
|       10399 | 1960 BSA Gold Star DBD34                    |     75.41 |  76.17 |
--------------------------------/sampai dengan/-----------------------------------
|       10399 | 1997 BMW F650 ST                            |     97.89 |  99.89 |
+-------------+---------------------------------------------+-----------+--------+
2855 rows in set (0.009 sec)

-- 6. Laporkan produk yang terjual dengan keuntungan dua kali lipat?
SELECT productName,priceEach-buyPrice AS Keuntungan,buyPrice
FROM Products
JOIN orderdetails USING (productCode)
WHERE priceEach-buyPrice > buyPrice;
+-------------------------------------------+------------+----------+
| productName                               | Keuntungan | buyPrice |
+-------------------------------------------+------------+----------+
| 1952 Alpine Renault 1300                  |     115.72 |    98.58 |
| 2002 Yamaha YZR M1                        |      40.68 |    34.17 |
-------------------------/sampai dengan/-----------------------------
| American Airlines: MD-11S                 |      37.02 |    36.27 |
+-------------------------------------------+------------+----------+
463 rows in set (0.006 sec)

-- 7. Tampilkan produk yang terjual pada hari senin?
SELECT DAYNAME(orderDate),orderDate,ProductName
FROM Products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
WHERE DAYOFWEEK(orderDate) =2;
-- menggunakan funsi date and time dari mysql
-- DAYNAME and DAYOFWEEK
+--------------------+------------+---------------------------------------------+
| DAYNAME(orderDate) | orderDate  | ProductName                                 |
+--------------------+------------+---------------------------------------------+
| Monday             | 2003-01-06 | 1917 Grand Touring Sedan                    |
| Monday             | 2003-01-06 | 1911 Ford Town Car                          |
| Monday             | 2005-05-30 | 1917 Maxwell Touring Car                    |
----------------------------------/sampai dengan/--------------------------------
| Monday             | 2005-05-30 | 1936 Chrysler Airflow                       |
+--------------------+------------+---------------------------------------------+
407 rows in set (0.002 sec)

-- 8. Berapa jumlah produk yang masih berstatus 'On Hold'? 
SELECT SUM(quantityOrdered) AS Jumlah
FROM orders
JOIN orderdetails USING (orderNumber)
WHERE status ='On Hold';
+--------+
| Jumlah |
+--------+
|   1994 |
+--------+