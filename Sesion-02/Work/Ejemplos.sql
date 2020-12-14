USE tienda; 

### Ejemplo 1 ###
-- Personas que empiezan su nombre con M
SELECT * FROM empleado WHERE nombre LIKE 'M%';

-- Personas cuyo nombre terminan con a
SELECT * FROM empleado WHERE nombre LIKE '%a';

-- Personas cuyo nombre empieza con M y termina con a
SELECT * FROM empleado WHERE nombre LIKE 'M%a';

SELECT * FROM empleado WHERE nombre LIKE 'Melo_a';

# Comando para buscar que empiezen con C, continuen 2 caracteres, sigue K y despues n caracteres
SELECT * FROM articulo WHERE nombre LIKE 'C__k%';
SELECT * FROM articulo WHERE nombre LIKE 'C__%';



### Ejemplo 2 ###
SELECT (1 + 7) * (10 / (6 - 4));

# Promedio de una columna AVG 
SELECT precio FROM articulo;
SELECT avg(precio) FROM articulo;

# Numero de registros de una columna
SELECT count(*) FROM articulo;

# Valor Máximo de una columna 
SELECT max(precio) FROM articulo;

# Valor Minimo de una columna 
SELECT min(precio) FROM articulo;

# Suma de una columna 
SELECT sum(precio) FROM articulo;

SELECT sum(precio) FROM articulo WHERE id_articulo <5;







### Ejemplo 3 ###
#Ahora revisaremos el concepto de agrupamiento. Para hacer un agrupamiento se usa la cláusula GROUP BY 
#que recolecta datos de múltiples registros y los agrupa en una o más columnas. Veamos algunos ejemplos.

## Usando SUM
-- Aqui se ordeno por bnombre de producto el total
SELECT nombre, sum(precio) AS total FROM articulo GROUP BY nombre;
SELECT nombre, sum(precio) AS total FROM articulo GROUP BY nombre ORDER by nombre;

## Usando Count
-- Aqwui se conto la cantidad 
SELECT nombre, count(*) AS cantidad de articulos
FROM articulo
GROUP BY nombre
ORDER BY cantidad DESC;

## Usando Min y Max
SELECT nombre, min(salario) AS menor, max(salario) AS mayor, avg(salario) AS promedio
FROM puesto
GROUP BY nombre;




 
 
 
### Ejemplo 4: Subconsultas ###
## Usando WHERE
SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive';

## Ahora, con los identificadores que obtuvimos, podemos hacer una búsqueda de los empleado que tienen dichos identificadores. 
## Para ello, usamos la consulta anterior dentro de la cláusula WHERE y filtramos aquellos empleados cuyo id_puesto esté en los resultados de la misma.

SELECT * FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE nombre = 'Junior Executive');

SELECT * FROM empleado WHERE id_puesto IN (SELECT * FROM puesto)