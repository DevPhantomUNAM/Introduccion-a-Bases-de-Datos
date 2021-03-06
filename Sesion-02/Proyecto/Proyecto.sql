## Proyecto ## 
USE classicmodels;
SELECT * FROM employees;
## 1 
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los 
-- empleados cuyo nombre empiece con a.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'A%';

## 2
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on';

## 3
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on%';

## 4
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'T_m';

## 5 
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName NOT LIKE 'B%';

## 6
-- Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
SELECT productCode, productName FROM products WHERE productCode LIKE '%_20%';

## 7
-- Dentro de la tabla orderdetails, obten el total de cada orden.
USE classicmodels;
SELECT * FROM orderdetails;
SELECT orderNumber, sum(priceEach) AS totalOrdenes FROM orderdetails GROUP BY orderNumber;

SELECT orderNumber,productCode, (quantityOrdered*priceEach) as totalOrdenes FROM orderdetails GROUP BY orderNumber,orderNumber,productCode;

SELECT orderNumber, sum(TotalProducto) FROM (SELECT orderNumber,productCode, (quantityOrdered*priceEach) AS TotalProducto FROM orderdetails GROUP BY orderNumber,orderNumber,productCode) GROUP BY orderNumber;
-- Solucion

SELECT orderNumber, sum(priceEach*quantityOrdered) total FROM orderdetails GROUP BY orderNumber;



## 8
-- Dentro de la tabla orders obten el número de órdenes por año.
SELECT * FROM orders;
SELECT DATE_FORMAT(orderDate, '%Y') as 'AÑO', count(*) FROM orders GROUP BY 1;

## 9
-- Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
DESC employees;
SELECT * FROM employees;
SELECT * FROM offices;

SELECT * FROM employees WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');

## 10
-- Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
DESC customers;
DESC payments;
SELECT * FROM customers;
SELECT * FROM payments;

SELECT max(amount) AS 'MAXPAGO' FROM payments;
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount IN ( SELECT max(amount) FROM payments);  

## 11
-- Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount > ( SELECT avg(amount) FROM payments);  

## 12
-- Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT DISTINCT customerNumber FROM orders;
SELECT contactFirstName FROM customers WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders); 


## 13 ---------------------------------------------------------------------------------------------------------------
-- Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT * FROM orderdetails;
SELECT orderNumber, quantityOrdered, productCode FROM orderdetails ORDER BY orderNumber;
SELECT orderNumber, sum(quantityOrdered) AS 'COUNT' FROM orderdetails GROUP BY orderNumber ORDER BY COUNT; ## Obteniendo la cantidad d eproductos  por orden 

SELECT MAX(CountProduct), min(CountProduct), avg(CountProduct) FROM (SELECT orderNumber, sum(quantityOrdered) AS CountProduct FROM orderdetails GROUP BY orderNumber) AS Sub;

## 14
-- Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.

DESC orders;

SELECT * FROM orders;
SELECT * FROM customers;

SELECT  count(customerNumber) , state FROM customers GROUP BY state;

