--Punto1
CREATE TABLE empleados(
    nombre varchar(30),
    documento varchar(8) PRIMARY KEY,
    domicilio varchar(30),
    fechaIngreso date,
    seccion varchar(20),
    sueldo decimal (6,2)
);

--Punto2 
INSERT INTO empleados (nombre, dni, domicilio, fecha_ingreso, sector, sueldo) VALUES
('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50),
('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30),
('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790),
('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550),
('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70),
('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400),
('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

--Punto3 
SELECT * FROM empleados
WHERE apellido LIKE '%Perez';

--PUNTO 4 
SELECT * FROM empleados
WHERE domicilio LIKE 'Co%';
AND domicilio LIKE '%8';

--PUNTO 5
SELECT nombre, sueldo FROM empleados 
WHERE sueldo::text LIKE '%.%';

--PUNTO 6
SELECT * FROM empleados
WHERE fechaIngreso LIKE '1990';


--Ejercicio 18
--Punto 1
ALTER TABLE empleados
ADD COLUMN cantidadHijos smallint;
--Punto 2
DELETE FROM empleados;

--Punto 3
INSERT INTO empleados (nombre, documento, domicilio, fechaIngreso, seccion, sueldo, cantidadHijos) VALUES
('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50,2),
('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30,0),
('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790,1),
('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550,3),
('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70,2),
('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400,4),
('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800,0);

--Punto 4
SELECT COUNT(*) AS cantidad_empleados
FROM empleados;

--Punto 5
SELECT COUNT(*) AS empleados_secretaria_con_sueldo
FROM empleados
WHERE seccion = 'Secretaria'
  AND sueldo IS NOT NULL;

--Punto 6
SELECT 
    MAX(sueldo) AS sueldo_maximo,
    MIN(sueldo) AS sueldo_minimo
FROM empleados;

--Punto 7
SELECT MAX(cantidadHijos) AS hijos_max_perez
FROM empleados
WHERE nombre LIKE '%Perez';

--Punto 8
SELECT AVG(sueldo) AS promedio_sueldos
FROM empleados;

--Punto 9
SELECT AVG(sueldo) AS promedio_secretaria
FROM empleados
WHERE seccion = 'Secretaria';

--Punto 10
SELECT AVG(cantidadHijos) AS promedio_hijos_sistemas
FROM empleados
WHERE seccion = 'Sistemas';




