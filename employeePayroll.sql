******************************************* UC 1 *******************************************

mysql> create database payroll_services;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_services   |
| performance_schema |
| sakila             |
| sampledatabase     |
| sampledatabase2    |
| sampledatabase3    |
| sys                |
| world              |
+--------------------+
10 rows in set (0.00 sec)


mysql> use payroll_services;
Database changed


******************************************* UC 2 *******************************************

mysql> CREATE TABLE Employee_Payroll
    -> (id int not null auto_increment,
    -> name varchar(50) not null,
    -> salary Double not null,
    -> StartDate Date not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> DESCRIBE Employee_Payroll;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | NO   |     | NULL    |                |
| salary    | double      | NO   |     | NULL    |                |
| StartDate | date        | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)


******************************************* UC 3 *******************************************

mysql> INSERT INTO Employee_Payroll (name,salary,StartDate) VALUES
    -> ('Hitesh',45000,'2021-03-31'),
    -> ('Pratish',50000,'2020-04-11'),
    -> ('Abinash',80000,'2022-02-18');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0


******************************************* UC 4 *******************************************

mysql> select * from Employee_Payroll;
+----+---------+--------+------------+
| id | name    | salary | StartDate  |
+----+---------+--------+------------+
|  1 | Hitesh  |  45000 | 2021-03-31 |
|  2 | Pratish |  50000 | 2020-04-11 |
|  3 | Abinash |  80000 | 2022-02-18 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)


******************************************* UC 5 *******************************************

mysql> SELECT salary FROM Employee_Payroll WHERE name = 'Hitesh';
+--------+
| salary |
+--------+
|  45000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT salary FROM Employee_Payroll WHERE StartDate BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+--------+
| salary |
+--------+
|  45000 |
|  50000 |
|  80000 |
+--------+
3 rows in set (0.00 sec)


******************************************* UC 6 *******************************************

mysql> ALTER TABLE Employee_Payroll ADD gender char(1) NOT NULL;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE Employee_Payroll;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | NO   |     | NULL    |                |
| salary    | double      | NO   |     | NULL    |                |
| StartDate | date        | NO   |     | NULL    |                |
| gender    | char(1)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> UPDATE Employee_Payroll SET gender = 'M' WHERE name = 'Hitesh';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Employee_Payroll SET gender = 'M' WHERE name = 'Pratish';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Employee_Payroll SET gender = 'F' WHERE name = 'Abinash';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Employee_Payroll;
+----+---------+--------+------------+--------+
| id | name    | salary | StartDate  | gender |
+----+---------+--------+------------+--------+
|  1 | Hitesh  |  45000 | 2021-03-31 | M      |
|  2 | Pratish |  50000 | 2020-04-11 | M      |
|  3 | Abinash |  80000 | 2022-02-18 | F      |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)


******************************************* UC 7 *******************************************

mysql> select sum(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       95000 |
+-------------+
1 row in set (0.01 sec)

mysql> select sum(salary) from Employee_Payroll Where gender = 'F' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       80000 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| avg(salary) |
+-------------+
|       47500 |
+-------------+
1 row in set (0.00 sec)

mysql> select min(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| min(salary) |
+-------------+
|       45000 |
+-------------+
1 row in set (0.00 sec)

mysql> select max(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| max(salary) |
+-------------+
|       50000 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(salary) from Employee_Payroll Where gender = 'M' group by gender;
+---------------+
| count(salary) |
+---------------+
|             2 |
+---------------+
1 row in set (0.00 sec)

mysql> select count(salary) from Employee_Payroll Where gender = 'F' group by gender;
+---------------+
| count(salary) |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)


******************************************* UC 8 *******************************************

mysql> ALTER TABLE Employee_Payroll ADD phone_number VARCHAR(250) AFTER name;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD address VARCHAR(250) AFTER phone_number;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD department VARCHAR(250) AFTER address;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ALTER address SET DEFAULT 'TBD';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE Employee_Payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(50)  | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| address      | varchar(250) | YES  |     | NULL    |                |
| department   | varchar(250) | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| StartDate    | date         | NO   |     | NULL    |                |
| gender       | char(1)      | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)


******************************************* UC 9 *******************************************

mysql> ALTER TABLE Employee_Payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Employee_Payroll;
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
| id | name    | phone_number | address | department | basic_pay | deductions | taxable_pay | tax | net_pay | StartDate  | gender |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
|  1 | Hitesh  | NULL         | NULL    | NULL       |     45000 |          0 |           0 |   0 |       0 | 2021-03-31 | M      |
|  2 | Pratish | NULL         | NULL    | NULL       |     50000 |          0 |           0 |   0 |       0 | 2020-04-11 | M      |
|  3 | Abinash | NULL         | NULL    | NULL       |     80000 |          0 |           0 |   0 |       0 | 2022-02-18 | F      |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
3 rows in set (0.00 sec)


******************************************* UC 10 *******************************************

INSERT INTO Employee_Payroll (id,name,phone_number,address,department,basic_pay,deductions,taxable_pay,tax,net_pay,StartDate,gender) VALUES
    -> (4, 'Terissa', 7846821730, 'Amberpet', 'Sales', 45000, 2000, 1500, 5000, 50000, '2022-05-30','F'),
    -> (5, 'Terissa', 7846821730, 'Amberpet', 'Marketing', 45000, 2000, 1500, 5000, 50000, '2022-05-30','F');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employee_Payroll;
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
| id | name    | phone_number | address  | department | basic_pay | deductions | taxable_pay | tax  | net_pay | StartDate  | gender |
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
|  1 | Hitesh  | NULL         | NULL     | NULL       |     45000 |          0 |           0 |    0 |       0 | 2021-03-31 | M      |
|  2 | Pratish | NULL         | NULL     | NULL       |     50000 |          0 |           0 |    0 |       0 | 2020-04-11 | M      |
|  3 | Abinash | NULL         | NULL     | NULL       |     80000 |          0 |           0 |    0 |       0 | 2022-02-18 | F      |
|  4 | Terissa | 7846821730   | Amberpet | Sales      |     45000 |       2000 |        1500 | 5000 |   50000 | 2022-05-30 | F      |
|  5 | Terissa | 7846821730   | Amberpet | Marketing  |     45000 |       2000 |        1500 | 5000 |   50000 | 2022-05-30 | F      |
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
5 rows in set (0.00 sec)


******************************************* UC 12 *******************************************


mysql> CREATE TABLE departments(
    -> dept_id INT NOT NULL,
    -> dept_name varchar(150) NOT NULL,
    -> emp_id INT NOT NULL,
    -> PRIMARY KEY(dept_id),
    -> FOREIGN KEY (emp_id) REFERENCES employee_payroll (id));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE payroll(
    -> payroll_id INT NOT NULL,
    -> basic_pay double NOT NULL,
    -> PRIMARY KEY(payroll_id),
    -> emp_id INT NOT NULL,
    -> FOREIGN KEY (emp_id) REFERENCES employee_payroll(id));
Query OK, 0 rows affected (0.03 sec)

