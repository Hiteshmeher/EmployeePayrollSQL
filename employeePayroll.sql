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