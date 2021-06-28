-- buat tabel barang 2

CREATE TABLE barang_2 (
  barangId INT NOT NULL AUTO_INCREMENT,
  barangNama VARCHAR(50) NOT NULL,
  harga_beli INT NOT NULL,
  harga_jual INT NOT NULL,
  supplierId INT,
  satuanId INT,
  INDEX (supplierId),
  INDEX (satuanId),
  FOREIGN KEY (supplierId) REFERENCES supplier (supplierId)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (satuanId) REFERENCES satuan (satuanId)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY (barangId)
);

-- menghapus tabel 
DROP TABLE barang_2;

-- mengubah struktur dari tabel
ALTER TABLE
-- menambahkan kolom
ALTER TABLE barang ADD COLUMN deskripsi TEXT;
-- menghapus kolom
ALTER TABLE barang DROP COLUMN deskripsi;
-- menambahkan dan penempatan kolom
ALTER TABLE barang ADD COLUMN deskripsi TEXT AFTER barangNama;
