-- Oreder BY 


-- berdasarkan productLine
SELECT productLine, productName, buyPrice 
FROM products ORDER BY productLine;

-- berdasarkan buyPrice 
SELECT productLine, productName, buyPrice 
FROM products ORDER BY buyPrice;

-- berdasarkan buyPrice dari yg terbesar ke terkecil DESC
-- atau sebaliknya menggunakn ASC
SELECT productLine, productName, buyPrice 
FROM products ORDER BY buyPrice DESC;

-- Multiple Oreder 
-- megurutkan berdasarkan productLine lalu productName
SELECT productLine, productName, buyPrice 
FROM products ORDER BY productLine ASC, productName ASC;

-- MSRP adalah manufacture sugestion ritle price
-- atau harga jual yg direkomdasikan
SELECT productLine, productName, buyPrice, MSRP
FROM products;

-- menghitung keuntungan dari harga jual 
SELECT productLine, productName, MSRP-buyPrice AS Untung
FROM products;

-- menghitung keuntungan dari harga jual yg paling besar ke paling kecil
SELECT productLine, productName, buyPrice, MSRP, MSRP-buyPrice AS Untung
FROM products ORDER BY Untung DESC;

-- menghitung keuntungan dari harga jual yg paling besar ke paling kecil
-- dengan limit 10 
SELECT productLine, productName, buyPrice, MSRP, MSRP-buyPrice AS Untung
FROM products ORDER BY Untung DESC LIMIT 0,10;

-- custom Oreder menggunaka FIELD
-- mengurutka lebih spesifik productLine
SELECT productLine, productName, buyPrice, MSRP, MSRP-buyPrice AS Untung
FROM products 
ORDER BY FIELD(productLine, 'Ships','Planes', 'Vintage Cars', 'Trucks and Buses', 'Motorcycles', 'Trains', 'Classic Cars')
DESC LIMIT 0,30;

SELECT productLine, productName, buyPrice, MSRP, MSRP-buyPrice AS Untung
FROM products
ORDER BY FIELD(productLine, 'Ships','Planes', 'Vintage Cars', 'Trucks and Buses', 'Motorcycles', 'Trains', 'Classic Cars')
LIMIT 0,20;

SELECT productLine, productName, buyPrice, MSRP, MSRP-buyPrice AS Untung
FROM products
ORDER BY FIELD(productLine, 'Ships','Planes', 'Vintage Cars', 'Trucks and Buses', 'Motorcycles', 'Trains', 'Classic Cars')
DESC LIMIT 0,20;
