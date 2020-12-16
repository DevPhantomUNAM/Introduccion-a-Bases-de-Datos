## Ejemplo 1
-- Para poder relacionar tablas, necesitamos conocer las llaves primarias y foráneas presentes en una tabla. 
-- Una forma de encontrar esto es usando la primitiva SHOW KEYS. Por ejemplo, a continuación se muestran las llaves para la tabla venta del esquema tienda.
use tienda;
DESC venta;
SHOW KEYS FROM venta;

## JOINS
-- Es el tipo de join más común y regresa todos los registros de múltiples tablas donde se cumplan la condición del join (join codition). 
-- Por ejemplo, podemos relacionar la tabla empleado con puesto.

SELECT * FROM empleado;
-- Empleado tiene:   id_empleado, id_puesto, nombre, apellido_paterno, apellido_materno, rfc
SELECT * FROM puesto;
-- Puesto tiene:     id_puesto, nombre, salario

SELECT *
FROM empleado AS e
JOIN puesto AS p
  ON e.id_puesto = p.id_puesto;
  
## LEFT JOIN
 -- Este tipo join, regresa todos los registros de la tabla izquierda que se está relacionando y únicamente aquellos que cumplen con la condición 
 -- de relación de la tabla derecha. Si algún registro no cumple con la condición, llenará sus campos con NULL.
SELECT *
FROM puesto AS p
LEFT JOIN empleado e
ON p.id_puesto = e.id_puesto;

## RIGHT JOIN 
-- Este tipo de join, es equivalente al anterior. Regresa todos los registros de la tabla derecha que se está relacionando 
-- y únicamente aquellos que cumplen con la condición de relación de la tabla izquierda. 
-- Si algún registro no cumple con la condición, llenará sus campos con NULL.
SELECT *
FROM empleado AS e
RIGHT JOIN puesto AS p
ON e.id_puesto = p.id_puesto;