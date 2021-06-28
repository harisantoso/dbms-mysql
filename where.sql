-- memfilter data menggunakan where

SELECT productCode, productName, productLine, buyPrice
FROM products;

-- penggunaan where
-- jika hanya ingin melihat Motorcycles pada productLint
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine = 'Motorcycles';

-- menggunakan operator lain
-- menampilkan yg bukan productLine motorcycles
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine != 'Motorcycles';

-- ingin melihat buyPrice nya kurang dari 50
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE buyPrice < 50;

-- kondisi AND adalah kedua kondisi harus benar.
-- jika ingin mempunyai dua kondisi.
-- mencari motorcycles dan harganya kurang dari 50
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine = 'Motorcycles' AND buyPrice < 50;

-- kondisi OR adalah salah satu kondisi benar maka
-- akan ditampilkan
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine = 'Planes' OR buyPrice < 50;

-- menampilkan dua productLine
-- menggunakan IN untuk memfilter lebih dari satu kodisi
-- pada kolom yg sama.
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine IN ('Planes', 'Ship');

-- menampilkan buyPrice diantara dua bilangan
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE buyPrice BETWEEN 50 AND 70;

-- menampilkan buyPrice diantara dua bilangan dan
-- productLine nya Ships
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE buyPrice BETWEEN 50 AND 60 AND productLine = 'Ships';