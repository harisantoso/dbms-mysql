-- group by biasa digunakan untuk mengkelompokan data
-- berdasarkan kolom tertentu

1. COUNT
  - Menghitung cacah data
  - Hitung banyak karyawan di setiap kota

SELECT city,firstName,lastName
FROM employees JOIN offices USING (officeCode);

SELECT city,COUNT(*) AS 'Banyak Kariawan'
FROM employees JOIN offices USING (officeCode)
GROUP BY city;
| city          | Banyak Kariawan |
+---------------+-----------------+
| Boston        |               2 |
| London        |               2 |
| NYC           |               2 |
| Paris         |               5 |
| San Francisco |               6 |
| Sydney        |               4 |
| Tokyo         |               2 |
+---------------+-----------------+

2. SUM
  - Menghitung jumlah data
  - Hitung jumlah pemasukan per tahun
-- extrack tahun dari paymentDate
SELECT YEAR(paymentDate),amount
FROM payments;

-- mengkelompokan pemasukan tiap tahun
SELECT YEAR(paymentDate) AS 'Tahun', SUM(amount) AS 'Jml Pemasukan'
FROM payments
GROUP BY YEAR(paymentDate);
| Tahun | Jml Pemasukan |
+-------+---------------+
|  2003 |    3250217.70 |
|  2004 |    4313328.25 |
|  2005 |    1290293.28 |
+-------+---------------+

3. AVG
  - Menghitung rata-rata nilai
  - Hitung rata-rata harga beli tiap productLine
SELECT productLine,buyPrice
FROM products;

SELECT productLine,AVG(buyPrice)
FROM products
GROUP BY productLine;
+------------------+---------------+
| productLine      | AVG(buyPrice) |
+------------------+---------------+
| Classic Cars     |     64.446316 |
| Motorcycles      |     50.685385 |
| Planes           |     49.629167 |
| Ships            |     47.007778 |
| Trains           |     43.923333 |
| Trucks and Buses |     56.329091 |
| Vintage Cars     |     46.066250 |
+------------------+---------------+

4. MIN 
  - Mencari minimum nilai
  - Harga jual produk paling murah tiap productLine
SELECT productLine,MIN(buyPrice)
FROM products
GROUP BY productLine;
+------------------+---------------+
| productLine      | MIN(buyPrice) |
+------------------+---------------+
| Classic Cars     |         15.91 |
| Motorcycles      |         24.14 |
| Planes           |         29.34 |
| Ships            |         33.30 |
| Trains           |         26.72 |
| Trucks and Buses |         24.92 |
| Vintage Cars     |         20.61 |
+------------------+---------------+

5. MAX
  - Mencari maksimum nilai
  - Harga pembayaran terbesar tiap tahun
SELECT YEAR(paymentDate) AS 'Tahun', MAX(amount) AS 'Pembayaran Terbesar'
FROM payments
GROUP BY YEAR(paymentDate);
+-------+---------------------+
| Tahun | Pembayaran Terbesar |
+-------+---------------------+
|  2003 |           111654.40 |
|  2004 |           116208.40 |
|  2005 |           120166.58 |
+-------+---------------------+
