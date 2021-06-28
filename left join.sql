-- menampilkan seluruh customer dengan transaksi
SELECT customerNumber,customerName,orderNumber
FROM customers LEFT JOIN  orders
USING (customerNumber);

-- bisa dengan
SELECT customers.customerNumber, customers.customerName, orders.orderNumber
FROM customers LEFT JOIN  orders
ON customers.customerNumber = orders.customerNumber;

-- bisa dengan
SELECT customers.customerNumber, customerName, orders.orderNumber
FROM customers LEFT JOIN  orders
ON customers.customerNumber = orders.customerNumber limit 10;

-- ERROR 1052 (23000): Column 'customerNumber' in field list is ambiguous
SELECT customerNumber,customerName,orderNumber
FROM customers LEFT JOIN  orders
ON customers.customerNumber = orders.customerNumber;

-- menampilkan seluruh customer dengan transaksi null
SELECT customerNumber,customerName,orderNumber
FROM customers LEFT JOIN  orders
USING (customerNumber)
WHERE orderNumber IS NULL;