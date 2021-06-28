-- 1. Tampilkan sales representatif dari setiap customer?
SELECT customerName,CONCAT(firstName," ",lastName) AS employeeName
FROM customers JOIN employees
ON salesRepEmployeeNumber = employeeNumber

-- 2. Tampilkan total pembayaran dari Atelier graphique?
SELECT SUM(amount)
FROM customers JOIN payments
USING (customerNumber)
WHERE customerName = "Atelier graphique";
+-------------+
| SUM(amount) |
+-------------+
|    22314.36 |
+-------------+

-- 3. Tampilkan total pembayaran per tanggal?
SELECT paymentDate,SUM(amount) AS total
FROM payments
GROUP BY paymentDate LIMITE 5;
+-------------+----------+
| paymentDate | total    |
+-------------+----------+
| 2003-01-16  | 10223.83 |
| 2003-01-28  | 10549.01 |
| 2003-01-30  |  5494.78 |
| 2003-02-16  | 50218.95 |
| 2003-02-20  | 53959.21 |
+-------------+----------+

-- 4. Tampilkan produk yang belum pernah terjual?
-- ini produk yg pernah terjual
SELECT productCode FROM orderdetails;
-- menghilangkan yg double kode produk
SELECT DISTINCT productCode FROM orderdetails;

-- cara 1st
-- produk yg belum pernah terjual
SELECT productCode,productName
FROM products
WHERE productCode NOT IN (
SELECT productCode FROM orderdetails
);
+-------------+-------------------+
| productCode | productName       |
+-------------+-------------------+
| S18_3233    | 1985 Toyota Supra |
+-------------+-------------------+

-- cara 2td
SELECT productCode,productName,orderNumber
FROM products
LEFT JOIN orderdetails USING (productCode)
WHERE orderNumber IS NULL;
+-------------+-------------------+-------------+
| productCode | productName       | orderNumber |
+-------------+-------------------+-------------+
| S18_3233    | 1985 Toyota Supra |        NULL |
+-------------+-------------------+-------------+

-- 5. Tampilkan jumlah yang terbayar per tiap customer?
SELECT customerNumber,customerName,SUM(amount) AS Total
FROM customers JOIN payments
USING (customerNumber)
GROUP BY customerNumber

-- 6. Berapa order yang sudah pernah dibuat oleh Herkku Gifts? 
SELECT COUNT(*) AS 'Jumlah Order'
FROM customers JOIN orders USING (customerNumber)
WHERE customerName = 'Herkku Gifts';
+--------------+
| Jumlah Order |
+--------------+
|            3 |
+--------------+

SELECT customerName,orderNumber AS 'order'
FROM customers JOIN orders USING (customerNumber)
WHERE customerName = 'Herkku Gifts';
+--------------+-------+
| customerName | order |
+--------------+-------+
| Herkku Gifts | 10181 |
| Herkku Gifts | 10188 |
| Herkku Gifts | 10289 |
+--------------+-------+

-- 7. Tampilkan karyawan di Boston?
SELECT CONCAT(firstName,' ',lastName) AS 'Nama Lengkap',city AS 'Tempat Kerja'
FROM employees JOIN offices USING (officeCode)
WHERE city = 'Boston';
+-----------------+--------------+
| Nama Lengkap    | Tempat Kerja |
+-----------------+--------------+
| Julie Firrelli  | Boston       |
| Steve Patterson | Boston       |
+-----------------+--------------+

-- 8. Tampilakn pembayaran atas customer yang lebih dari 100.000?
SELECT customerName,amount
FROM customers JOIN payments
USING (customerNumber)
WHERE amount>100000
ORDER BY amount DESC;
+------------------------------+-----------+
| customerName                 | amount    |
+------------------------------+-----------+
| Euro+ Shopping Channel       | 120166.58 |
| Euro+ Shopping Channel       | 116208.40 |
| Mini Gifts Distributors Ltd. | 111654.40 |
| Dragon Souveniers, Ltd.      | 105743.00 |
| Mini Gifts Distributors Ltd. | 101244.59 |
+------------------------------+-----------+

-- 9. Tampilkan Nilai dari order ynag statusnya 'On Hold'?
SELECT SUM(quantityOrdered * priceEach) AS 'Nilai Order'
FROM orders JOIN orderdetails USING (orderNumber)
WHERE status = 'On Hold';
+-------------+
| Nilai Order |
+-------------+
|   169575.61 |
+-------------+

-- detailnya
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS 'Nilai Order'
FROM orders JOIN orderdetails USING (orderNumber)
WHERE status = 'On Hold'
GROUP BY orderNumber;
+-------------+-------------+
| orderNumber | Nilai Order |
+-------------+-------------+
|       10334 |    23014.17 |
|       10401 |    43525.04 |
|       10407 |    52229.55 |
|       10414 |    50806.85 |
+-------------+-------------+

-- 10. Tampilkan junlah order 'On Hold' untuk tiap customer?
SELECT customerName, COUNT(*) AS 'StatusOnHold'
FROM customers JOIN orders USING (customerNumber)
WHERE status = 'On Hold'
GROUP BY customerNumber;
+---------------------------+--------------+
| customerName              | StatusOnHold |
+---------------------------+--------------+
| Volvo Model Replicas, Co  |            1 |
| Tekni Collectables Inc.   |            1 |
| Gifts4AllAges.com         |            1 |
| The Sharp Gifts Warehouse |            1 |
+---------------------------+--------------+