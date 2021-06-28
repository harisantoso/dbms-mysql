-- membuat tabel
CREATE TABLE satuan (
  satuanId INT NOT NULL AUTO_INCREMENT,
  satuanNama VARCHAR(30) NOT NULL,
  PRIMARY KEY(satuanId)
);


-- membuat tabel supplier gaya phpmyadmin
CREATE TABLE `toko`.`supplier`(
    `supplierId` INT NOT NULL AUTO_INCREMENT,
    `supplierNama` VARCHAR(50) NOT NULL,
    `supplierAlamat` TEXT NOT NULL,
    PRIMARY KEY(`supplierId`)
) ENGINE = INNODB

-- membuat tabel cabang
CREATE TABLE cabang (
  cabangId int(11) NOT NULL AUTO_INCREMENT,
  cabangNama varchar(50) NOT NULL,
  cabangAlamat text NOT NULL,
  PRIMARY KEY (cabangId)
);

-- menampilkan tabel-tabel pada database
SHOW TABLES;

-- melihat tabel yg sudah kita buat
DESCRIBE satuan;