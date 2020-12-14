### Reto 1 ###

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%';


### Reto 2 ###
-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
-- 1 ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) AS 'Promedio de Salarios' FROM puesto;

-- 2 ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) FROM articulo WHERE nombre LIKE '%Pasta%';

-- 3 ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) FROM puesto;
SELECT max(salario) FROM puesto;
-- Alias
SELECT max(salario), min(salario) FROM puesto;


-- 4 ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) FROM puesto ORDER BY id_puesto IN(SELECT id_puesto FROM puesto WHERE id_puesto > 995);



### Reto 3 ###
## Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# 1 ¿Cuántos registros hay por cada uno de los puestos?
SELECT * FROM puesto;

SELECT nombre, count(*) AS cantidad FROM puesto GROUP BY nombre ORDER BY cantidad;
SELECT nombre, count(*) AS cantidad FROM puesto GROUP BY nombre ORDER BY nombre;

# 2 ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS total FROM puesto GROUP BY nombre ORDER BY nombre;

# 3 ¿Cuál es el número total de ventas por vendedor?
 SELECT * FROM venta;
 SELECT id_empleado, count(clave) AS cantidadArticulos FROM venta GROUP BY id_empleado ORDER BY id_empleado;
 SELECT id_empleado, clave FROM venta ORDER BY id_empleado;
 
 # 4 ¿Cuál es el número total de ventas por artículo?
 SELECT id_articulo , count(id_articulo) AS CantidadTotal FROM venta GROUP BY id_articulo ORDER BY id_articulo;
 
 
 
