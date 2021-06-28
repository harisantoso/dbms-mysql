-- update ditunjukan untuk sebuah data atau beberapa data
-- dalam sebuah tabel.
-- harus dibedakan dangan update struktur,
-- jika update struktur itu query ddl dengan menggunakan "ALTER",
-- yaitu untuk mengupdate struktur tabel.

-- jika update data yaitu query dml untuk mengupdate sebuah atau 
-- beberapa data didalam sebuah tabel, dengan menggunakan "UPDATE".

-- pada browser di localhost php myadmin
-- menggunakan pektik(`) bukan kurip satu(')
UPDATE barang SET `harga_beli` = 4500 WHERE barangId = 1;