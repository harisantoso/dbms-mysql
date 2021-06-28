-- membuat tabel barang
-- tabel yg mempunyai kunci foreign key

CREATE TABLE barang (
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

-- CATATAN 
RESTRICT = tabel parent tidak bisa dihapus selama data
masih ada di tabel chile nya.
CASCADE = tabel data di tabel parent di hapus maka
data tabel chile akan terhapus juga.