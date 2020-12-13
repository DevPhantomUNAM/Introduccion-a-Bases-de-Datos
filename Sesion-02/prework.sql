#### PREWORK ###

## Busqueda de patrones 

SELECT * FROM empleado;

-- Seleccionamos los empleaods cuyo apellido apterno empieze con S
SELECT * FROM empleado WHERE apellido_paterno LIKE 'S%';

SELECT 
* 
FROM empleado 
WHERE apellido_paterno 
LIKE 'S%'
order by apellido_paterno;

-- Esta consulta, obtiene el campo nombre de la tabla persona siempre y cuando el
-- apellido materno, contenga la subcadena am.
select *
from empleado
where apellido_paterno like '%am%';



SELECT *
FROM empleado
WHERE apellido_paterno LIKE 'Halle_';



## Funciones de Agrupamiento

USE tienda;

select * from puesto;


-- Sumamos los salarios de la tabla puesto donde los salarioos sean mayor a 5000
SELECT sum(salario) AS 'Salario Total'
FROM puesto
WHERE salario > 5000;

-- Total de studiant3es en la tabla students
select count(nombre) as 'studiantes'
from student;

select max(salario) from puesto;
select min(salario) from puesto;

-- Salario maximo y salario minimo de la tabla pusto
select max(salario) as 'Salario Maximo0', min(salario) as 'Salario minimo' from puesto;

-- Promedio de salario
select avg(salario) as 'Promedio Salario' from puesto;


## Agrupaciones GROUP BY

select nombre as 'Puesto' from puesto GROUP BY nombre;

select nombre as 'Puesto' , count(*) from puesto GROUP BY nombre;

-- Cuales son los puestos con más gente
select 
nombre as 'Puesto' , 
count(*) as trabajadores
from puesto 
group by nombre
order by trabajadores DESC;


## SUBCONSULTAS

use classicmodels;

SELECT * FROM orderdetails;

DESC orders;
DESC offices;
DESC orderdetails;
DESC products;
-- Utiliozaremos los productos que se vendan por un precio arriba de 98
SELECT productCode FROM products WHERE buyPrice > 98;

-- Y ahora quiero saber cuantos productos fueron ordenados utilizando la tabla ORDEREDETAILS

SELECT * 
FROM orderdetails 
WHERE productCode 
IN (SELECT productCode FROM products WHERE buyPrice > 98);
































