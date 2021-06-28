-- insert data satuan 
INSERT INTO satuan VALUES (
NULL, "pcs"
);

-- dan
INSERT INTO satuan (satuanNama) VALUES ('KG');

-- memasukan beberapa data sekaligus
INSERT INTO satuan VALUES (
NULL, 'liter',
NULL, 'buah'
);

-- atau
INSERT INTO satuan (satuanId, satuanNama)
VALUES(NULL, 'liter'), (NULL, 'buah');

-- insert data supplier
INSERT INTO supplier (supplierId, supplierNama, SupplierAlamat) 
VALUES (NULL, 'PT Mekar Jaya', 'Jl. KS Tubun'), 
       (NULL, 'PT Coca Cola', 'Jl. Ringroad Utara');

-- insert data cabang dengan browser
INSERT INTO `cabang` (`cabangId`, `cabangNama`, `cabangAlamat`)
VALUES (NULL, 'Cabang Jakarta', 'Jl. Kaliurang KM 5');

