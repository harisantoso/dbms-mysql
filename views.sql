-- Membuat view
-- 10 Besar Produk Terjual

SELECT productName,SUM(quantityOrdered) AS Jumlah
FROM products JOIN orderdetails USING (productCode)
GROUP BY productCode
ORDER BY jumlah DESC
LIMIT 10;
+-----------------------------------------+--------+
| productName                             | Jumlah |
+-----------------------------------------+--------+
| 1992 Ferrari 360 Spider red             |   1808 |
| 1937 Lincoln Berline                    |   1111 |
| American Airlines: MD-11S               |   1085 |
| 1941 Chevrolet Special Deluxe Cabriolet |   1076 |
| 1930 Buick Marquette Phaeton            |   1074 |
| 1940s Ford truck                        |   1061 |
| 1969 Harley Davidson Ultimate Chopper   |   1057 |
| 1957 Chevy Pickup                       |   1056 |
| 1964 Mercedes Tour Bus                  |   1053 |
| 1956 Porsche 356A Coupe                 |   1052 |
+-----------------------------------------+--------+
-- membuat query di atas menjai view 
CREATE VIEW Top10Produk AS
SELECT productName,SUM(quantityOrdered) AS Jumlah
FROM products JOIN orderdetails USING (productCode)
GROUP BY productCode
ORDER BY Jumlah DESC
LIMIT 10;

-- SHOW TABLES;
+-------------------------+
| Tables_in_classicmodels |
+-------------------------+
| customers               |
| employees               |
| offices                 |
| orderdetails            |
| orders                  |
| payments                |
| productlines            |
| products                |
| top10produk             |
+-------------------------+

-- SHOW FULL TABLES;
+-------------------------+------------+
| Tables_in_classicmodels | Table_type |
+-------------------------+------------+
| customers               | BASE TABLE |
| employees               | BASE TABLE |
| offices                 | BASE TABLE |
| orderdetails            | BASE TABLE |
| orders                  | BASE TABLE |
| payments                | BASE TABLE |
| productlines            | BASE TABLE |
| products                | BASE TABLE |
| top10produk             | VIEW       |
+-------------------------+------------+

SELECT * FROM top10produk;
+-----------------------------------------+--------+
| productName                             | Jumlah |
+-----------------------------------------+--------+
| 1992 Ferrari 360 Spider red             |   1808 |
| 1937 Lincoln Berline                    |   1111 |
| American Airlines: MD-11S               |   1085 |
| 1941 Chevrolet Special Deluxe Cabriolet |   1076 |
| 1930 Buick Marquette Phaeton            |   1074 |
| 1940s Ford truck                        |   1061 |
| 1969 Harley Davidson Ultimate Chopper   |   1057 |
| 1957 Chevy Pickup                       |   1056 |
| 1964 Mercedes Tour Bus                  |   1053 |
| 1956 Porsche 356A Coupe                 |   1052 |
+-----------------------------------------+--------+

SELECT * FROM top10produk WHERE jumlah > 1500;
+-----------------------------+--------+
| productName                 | Jumlah |
+-----------------------------+--------+
| 1992 Ferrari 360 Spider red |   1808 |
+-----------------------------+--------+