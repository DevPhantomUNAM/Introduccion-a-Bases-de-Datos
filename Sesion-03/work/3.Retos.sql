## RETO 1 ##

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM venta;
SHOW KEYS FROM empleado;

SELECT * FROM empleado;
SElECT * FROM venta;

SELECT e.nombre, e.apellido_paterno, e.apellido_materno , v.id_venta, v.id_articulo FROM empleado as e RIGHT JOIN venta as v ON e.id_empleado = v.id_empleado;


-- ¿Cuál es el nombre de los artículos que se han vendido?
SELECT a.nombre , v.id_venta FROM articulo as a RIGHT JOIN venta as v ON a.id_articulo = v.id_articulo;


-- ¿Cuál es el total de cada venta sumando el iva?
USE tienda;
SELECT * FROM articulo;
SElECT * FROM venta;

SELECT id_venta, sum((((a.iva/100)*a.precio)+a.precio)) 'Total Venta' FROM venta v JOIN articulo a ON v.id_articulo = a.id_articulo GROUP BY id_venta;
SELECT clave, sum((((a.iva/100)*a.precio)+a.precio)) 'Total Venta' FROM venta v JOIN articulo a ON v.id_articulo = a.id_articulo GROUP BY clave;


## Reto 2 ##

-- 1 Obtener el puesto de un empleado
CREATE VIEW puesto_880 AS ( SELECT concat(e.nombre,' ', e.apellido_paterno) as NombreCompleto, p.nombre FROM empleado e JOIN puesto p ON e.id_puesto = p.id_puesto);

SELECT * FROM puesto_880;
