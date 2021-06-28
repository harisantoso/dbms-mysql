-- query yg paling simple
SELECT * FROM products;

DESCRIBE products;
+--------------------+---------------+------+-----+---------+-------+
| Field              | Type          | Null | Key | Default | Extra |
+--------------------+---------------+------+-----+---------+-------+
| productCode        | varchar(15)   | NO   | PRI | NULL    |       |
| productName        | varchar(70)   | NO   |     | NULL    |       |
| productLine        | varchar(50)   | NO   | MUL | NULL    |       |
| productScale       | varchar(10)   | NO   |     | NULL    |       |
| productVendor      | varchar(50)   | NO   |     | NULL    |       |
| productDescription | text          | NO   |     | NULL    |       |
| quantityInStock    | smallint(6)   | NO   |     | NULL    |       |
| buyPrice           | decimal(10,2) | NO   |     | NULL    |       |
| MSRP               | decimal(10,2) | NO   |     | NULL    |       |
+--------------------+---------------+------+-----+---------+-------+

SELECT productCode, productName FROM products;

-- membatasi hasil pencarian
SELECT productCode, productName FROM products LIMIT 10;

-- mengganti nama colom dengan alia
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk'
FROM products LIMIT 10;

-- mengambil data n sampai data ke n 
-- Co: mengambil data ke 10 diambil 10 data 
SELECT productCode, productName FROM products LIMIT 10,10;