-- 1. Tampilkan Rata-rata penjualan per bulan tertinggi dan 
-- terendah dari tahun 2003

-- Menampilkan penjualan tertinggi dan terendah tahun 2003
SELECT
    MONTH(paymentDate) AS 'Bulan',
    MIN(amount) AS 'Terendah',
    MAX(amount) AS 'Tertinggi'
FROM
    payments
WHERE
    YEAR(paymentDate) = 2003
GROUP BY
    MONTH(paymentDate);
+-------+----------+-----------+
| bulan | terendah | tertinggi |
+-------+----------+-----------+
|     1 |  5494.78 |  10549.01 |
|     2 | 40206.20 |  53959.21 |
|     3 | 22292.62 |  52151.81 |
|     4 |  1627.56 |  44380.15 |
|     5 |  3101.40 |  50824.66 |
|     6 | 14571.44 |  58841.35 |
|     7 |  2880.00 |  36251.03 |
|     8 |  1128.20 | 111654.40 |
|     9 |  6631.36 |  50342.74 |
|    10 |  1491.38 |  49539.37 |
|    11 |  9977.85 |  85559.12 |
|    12 |  3879.96 | 105743.00 |
+-------+----------+-----------+

-- Rata-rata penjualan tertinggi dan terendah tahun 2003
SELECT
    AVG(terendah) AS 'Rata-rata Terendah',
    AVG(tertinggi) AS 'Rata-rata Tertinggi'
FROM
    (
    SELECT
        MONTH(paymentDate) AS 'Bulan',
        MIN(amount) AS 'Terendah',
        MAX(amount) AS 'Tertinggi'
    FROM
        payments
    WHERE
        YEAR(paymentDate) = 2003
    GROUP BY
        MONTH(paymentDate)
) AS Table_Baru;
+--------------------+---------------------+
| Rata-rata Terendah | Rata-rata Tertinggi |
+--------------------+---------------------+
|        9440.229167 |        59149.654167 |
+--------------------+---------------------+