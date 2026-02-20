
--Punto 1
CREATE TABLE medicamentos (
    codigo serial PRIMARY KEY,
    nombre VARCHAR(20),
    laboratorio VARCHAR(20),
    precio decimal(5,2),
    cantidad smallint
);
--Punto 2
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad) VALUES
('Sertal', 'Roche', 5.2, 100),
('Buscapina', 'Roche', 4.10, 200),
('Amoxidal 500', 'Bayer', 15.60, 100),
('Paracetamol 500', 'Bago', 1.90, 200),
('Bayaspirina', 'Bayer', 2.10, 150),
('Amoxidal 250', 'Bayer', 10.20, 130);

--Punto 3
SELECT cod, nombre
FROM medicamentos
WHERE laboratorio = 'Roche'
AND precio < 5;

--Punto 4
SELECT * FROM medicamentos
WHERE laboratorio = 'Roche'
OR precio < 5;

--Punto 5 
SELECT * FROM medicamentos
WHERE laboratorio <> 'Bayer'
AND cantidad = 100;

--Punto 6
SELECT *FROM medicamentos
WHERE laboratorio = 'Bayer'
AND cantidad != 100;

--Punto 7
DELETE FROM medicamentos
WHERE laboratorio = 'Bayer'
AND precio > 10;

--Punto 8 
UPDATE medicamentos
SET cantidad = 200
WHERE laboratorio = 'Roche'
AND precio > 5;

--Punto 9
DELETE FROM medicamentos
WHERE laboratorio = 'Bayer'
OR precio < 3;



--EJERCICIO 14
--Punto1 
ALTER TABLE medicamentos
ADD COLUMN fechavencimiento DATE NOT NULL;
--Punto2
DELETE FROM medicamentos;

--Punto3
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad, fechavencimiento) VALUES
('Sertal', 'Roche', 5.2, 1, '2005-02-01'),
('Buscapina', 'Roche', 4.10, 3, '2006-03-01'),
('Amoxidal 500', 'Bayer', 15.60, 100, '2007-05-01'),
('Paracetamol 500', 'Bago', 1.90, 20, '2008-02-01'),
('Bayaspirina', 'Bayer', 2.10, 150, '2009-12-01'),
('Amoxidal jarabe', 'Bayer', 5.10, 250, '2010-10-01');

--Punto4
SELECT nombre, precio
FROM medicamentos
WHERE laboratorio IN ('Bayer', 'Bago');

--Punto5
SELECT * FROM medicamentos
WHERE cantidad BETWEEN 1 AND 5;



-- EJERCICIO 17

--Punto 1
ALTER  TABLE medicamentos
ADD COLUMN numeroLote INT DEFAULT NULL;

--Punto2 
DELETE FROM medicamentos;

--Punto 3
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad, fecha_vencimiento, numerolote) VALUES
('Sertal','Roche',5.2,1,'2015-02-01',NULL),
('Buscapina','Roche',4.10,3,'2016-03-01',NULL),
('Amoxidal 500','Bayer',15.60,100,'2017-05-01',NULL),
('Paracetamol 500','Bago',1.90,20,'2018-02-01',NULL),
('Bayaspirina','Bayer',2.10,150,'2019-12-01',NULL),
('Amoxidal jarabe','Bayer',5.10,250,'2019-10-01',NULL);

--Punto 4
SELECT COUNT(*) AS total_registros
FROM medicamentos;

--Punto 5
SELECT COUNT(*) AS con_laboratorio
FROM medicamentos
WHERE laboratorio IS NOT NULL;

--Punto 6
SELECT 
    COUNT(*) AS precio_y_cantidad_conocidos
FROM medicamentos
WHERE precio IS NOT NULL 
  AND cantidad IS NOT NULL;

--Punto 7
SELECT COUNT(*) AS precio_conocido_labo_B
FROM medicamentos
WHERE precio IS NOT NULL
  AND laboratorio LIKE 'B%';

--Punto 8
SELECT COUNT(*) AS numerolote_conocido
FROM medicamentos
WHERE numerolote IS NOT NULL;
