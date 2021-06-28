-- Self Join 

SELECT employeeNumber,firstName,reportsTo,jobTitle
FROM employees;
-- hasilnya
+----------------+-----------+-----------+----------------------+
| employeeNumber | firstName | reportsTo | jobTitle             |
+----------------+-----------+-----------+----------------------+
|           1002 | Diane     |      NULL | President            |
|           1056 | Mary      |      1002 | VP Sales             |
|           1076 | Jeff      |      1002 | VP Marketing         |
|           1088 | William   |      1056 | Sales Manager (APAC) |
|           1102 | Gerard    |      1056 | Sale Manager (EMEA)  |
|           1143 | Anthony   |      1056 | Sales Manager (NA)   |
|           1165 | Leslie    |      1143 | Sales Rep            |
|           1621 | Mami      |      1056 | Sales Rep            |
|           1625 | Yoshimi   |      1621 | Sales Rep            |
|           1702 | Martin    |      1102 | Sales Rep            |
+----------------+-----------+-----------+----------------------+

-- Menampilkan nama atasan dari setiap employee-nya
SELECT a.firstName,a.jobTitle,b.firstName,b.jobTitle
FROM employees AS a INNER JOIN employees AS b
ON a.employeeNumber = b.reportsTo;

-- hasilnya kariawan yg memiliki bahawan
+-----------+----------------------+-----------+----------------------+
| firstName | jobTitle             | firstName | jobTitle             |
+-----------+----------------------+-----------+----------------------+
| Diane     | President            | Mary      | VP Sales             |
| Diane     | President            | Jeff      | VP Marketing         |
| Mary      | VP Sales             | William   | Sales Manager (APAC) |
| Mary      | VP Sales             | Gerard    | Sale Manager (EMEA)  |
| Mary      | VP Sales             | Anthony   | Sales Manager (NA)   |
| Anthony   | Sales Manager (NA)   | Leslie    | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Leslie    | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Julie     | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Steve     | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Foon Yue  | Sales Rep            |
| Anthony   | Sales Manager (NA)   | George    | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Loui      | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Gerard    | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Pamela    | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Larry     | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Barry     | Sales Rep            |
| William   | Sales Manager (APAC) | Andy      | Sales Rep            |
| William   | Sales Manager (APAC) | Peter     | Sales Rep            |
| William   | Sales Manager (APAC) | Tom       | Sales Rep            |
| Mary      | VP Sales             | Mami      | Sales Rep            |
| Mami      | Sales Rep            | Yoshimi   | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Martin    | Sales Rep            |
+-----------+----------------------+-----------+----------------------+

-- hasilnya kariawan yg tidak memiliki bahawan
SELECT a.firstName,a.jobTitle,b.firstName,b.jobTitle
FROM employees AS a LEFT JOIN employees AS b
ON a.employeeNumber = b.reportsTo;
+-----------+----------------------+-----------+----------------------+
| firstName | jobTitle             | firstName | jobTitle             |
+-----------+----------------------+-----------+----------------------+
| Diane     | President            | Mary      | VP Sales             |
| Diane     | President            | Jeff      | VP Marketing         |
| Mary      | VP Sales             | William   | Sales Manager (APAC) |
| Mary      | VP Sales             | Gerard    | Sale Manager (EMEA)  |
| Mary      | VP Sales             | Anthony   | Sales Manager (NA)   |
| Mary      | VP Sales             | Mami      | Sales Rep            |
| Jeff      | VP Marketing         | NULL      | NULL                 |
| William   | Sales Manager (APAC) | Andy      | Sales Rep            |
| William   | Sales Manager (APAC) | Peter     | Sales Rep            |
| William   | Sales Manager (APAC) | Tom       | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Loui      | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Gerard    | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Pamela    | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Larry     | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Barry     | Sales Rep            |
| Gerard    | Sale Manager (EMEA)  | Martin    | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Leslie    | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Leslie    | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Julie     | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Steve     | Sales Rep            |
| Anthony   | Sales Manager (NA)   | Foon Yue  | Sales Rep            |
| Anthony   | Sales Manager (NA)   | George    | Sales Rep            |
| Leslie    | Sales Rep            | NULL      | NULL                 |
| Leslie    | Sales Rep            | NULL      | NULL                 |
| Julie     | Sales Rep            | NULL      | NULL                 |
| Steve     | Sales Rep            | NULL      | NULL                 |
| Foon Yue  | Sales Rep            | NULL      | NULL                 |
| George    | Sales Rep            | NULL      | NULL                 |
| Loui      | Sales Rep            | NULL      | NULL                 |
| Gerard    | Sales Rep            | NULL      | NULL                 |
| Pamela    | Sales Rep            | NULL      | NULL                 |
| Larry     | Sales Rep            | NULL      | NULL                 |
| Barry     | Sales Rep            | NULL      | NULL                 |
| Andy      | Sales Rep            | NULL      | NULL                 |
| Peter     | Sales Rep            | NULL      | NULL                 |
| Tom       | Sales Rep            | NULL      | NULL                 |
| Mami      | Sales Rep            | Yoshimi   | Sales Rep            |
| Yoshimi   | Sales Rep            | NULL      | NULL                 |
| Martin    | Sales Rep            | NULL      | NULL                 |
+-----------+----------------------+-----------+----------------------+