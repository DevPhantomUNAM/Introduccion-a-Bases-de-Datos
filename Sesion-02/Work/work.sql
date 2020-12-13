USE tienda; 

# Personas que empiezan su nombre con M
SELECT * FROM empleado WHERE nombre LIKE 'M%';

# Personas cuyo nombre terminan con a
SELECT * FROM empleado WHERE nombre LIKE '%a';

# Personas cuyo nombre empieza con M y termina con a
SELECT * FROM empleado WHERE nombre LIKE 'M%a';