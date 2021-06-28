-- 1. Hitung jumlah pemasukan pada tahun 2013
SELECT MONTH(paymentDate) AS bulan, Sum(amount) AS jumlah
FROM payments
WHERE YEAR(paymentDate)=2003
GROUP BY MONTH(paymentDate);
+-------+-----------+
| bulan | jumlah    |
+-------+-----------+
|     1 |  26267.62 |
|     2 | 144384.36 |
|     3 | 199704.48 |
|     4 | 136313.92 |
|     5 | 159881.97 |
|     6 | 180218.98 |
|     7 | 158247.00 |
|     8 | 246204.86 |
|     9 | 161206.23 |
|    10 | 316857.96 |
|    11 | 694292.68 |
|    12 | 826637.64 |
+-------+-----------+

-- 2. di setiap bulan yang kurang dari 150.000
SELECT MONTH(paymentDate) AS bulan, Sum(amount) AS jumlah
FROM payments
WHERE YEAR(paymentDate)=2003
GROUP BY MONTH(paymentDate)
HAVING jumlah<150000;


-- * HAVING adalah filtering yg dilakukan setelah -
-- query yg diatasnya dilajanakan.
-- biasanya digunakan untuk mefilter query-query yg memiliki
-- fungsi agregasi

-- * WHERE adalah filtering yg dilakukan pertamakali
-- sebelum seluruh query dijalankan