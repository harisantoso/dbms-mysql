-- beberapa fungsi agregasi di mysql
1. COUNT
  - Menghitung cacah data

  - Hitung banyak karyawan yang berasal dari Boston
SELECT firstName, lastName
FROM employees JOIN offices
USING (officeCode)
WHERE city ='Boston';
+-----------+-----------+
| firstName | lastName  |
+-----------+-----------+
| Julie     | Firrelli  |
| Steve     | Patterson |
+-----------+-----------+

SELECT COUNT(*)
FROM employees JOIN offices
USING (officeCode)
WHERE city ='Boston';

SELECT COUNT(*) AS 'Banyaknya Kariawan'
FROM employees JOIN offices
USING (officeCode)
WHERE city ='Boston';

+----------+    +--------------------+
| COUNT(*) |    | Banyaknya Kariawan |
+----------+    +--------------------+
|        2 |    |                  2 |
+----------+    +--------------------+

2. SUM
  - Menghitung jumlah data
  - Hitung jumlah pemasukan pada tahun 2003
SELECT amount,paymentDate
FROM payments
WHERE YEAR(paymentDate) = 2003;

SELECT SUM(amount) AS 'jml Pembayaran 2003'
FROM payments
WHERE YEAR(paymentDate) = 2003;
+---------------------+
| jml Pembayaran 2003 |
+---------------------+
|          3250217.70 |
+---------------------+

3. AVG
  - Menghitung rata-rata nilai
  - Hitung rata-rata harga beli kendaraan motorcylces
SELECT AVG(buyPrice) AS 'rata-rata harga motor'
FROM products
WHERE productLine = 'Motorcycles';
+-----------------------+
| rata-rata harga motor |
+-----------------------+
|             50.685385 |
+-----------------------+

4. MIN 
  - Mencari minimum nilai
  - Harga jual produk paling murah
SELECT MIN(MSRP)
FROM products;
+-----------+
| MIN(MSRP) |
+-----------+
|     33.19 |
+-----------+

5. MAX
  - Mencari maksimum nilai
  - Harga jual produk classic cars paling mahal
SELECT MAX(MSRP)
FROM products
WHERE productLine='Classic Cars';
+-----------+
| MAX(MSRP) |
+-----------+
|    214.30 |
+-----------+