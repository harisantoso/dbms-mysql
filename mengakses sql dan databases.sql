-- mengakses sql
cd/xampp/mysql/bin

-- mengakses database
mysql -uroot

-- menampikan database
SHOW DATABASES;

-- membuat database
CREATE DATABASE toko;

CREATE IF NOT EXISTS DATABASE toko;

-- menghapus database
DROP DATABASE toko;

-- menggunakan database
USE nama_databases;
co: USE toko;

-- untuk melihat tebel yand ada di database
SHOW TABLES;