-- Punto1 
CREATE TABLE visitantes(
    nombre varchar(30),
    edad smallint,
    sexo char(1) default 'f',
    domicilio varchar(30),
    telefono varchar(11),
    email varchar(30) default 'no tiene',
    precioCompra decimal(6,2)   
);

-- Punto 2
INSERT INTO visitantes (nombre, edad, sexo, domicilio, ciudad, telefono, email, precioCompra) VALUES
('Susana Molina',35,DEFAULT,'Colon 123',DEFAULT,NULL,NULL,59.80),

('Marcos Torres',29,'m',DEFAULT,'Carlos Paz',DEFAULT,'marcostorres@hotmail.com',150.50),

('Mariana Juarez',45,DEFAULT,DEFAULT,'Carlos Paz',NULL,DEFAULT,23.90),

('Fabian Perez',36,'m',NULL,NULL,'4556677','fabianperez@xaxamail.com',NULL),

('Alejandra Gonzalez',NULL,DEFAULT,NULL,'La Falda',NULL,NULL,280.50),

('Gaston Perez',29,'m',DEFAULT,'Carlos Paz',NULL,'gastonperez1@gmail.com',95.40),

('Liliana Torres',40,DEFAULT,'Sarmiento 876',DEFAULT,DEFAULT,DEFAULT,85),

('Gabriela Duarte',21,NULL,NULL,'Rio Tercero',DEFAULT,'gabrielaltorres@hotmail.com',321.50);

-- Punto 3
SELECT ciudad, COUNT(*) AS cantidad_visitantes
FROM visitantes
GROUP BY ciudad;

-- Punto 4
SELECT ciudad, COUNT(*) AS con_telefono
FROM visitantes
WHERE telefono IS NOT NULL
GROUP BY ciudad;

-- Punto 5
SELECT sexo, SUM(precioCompra) AS total_compras
FROM visitantes
GROUP BY sexo;

-- Punto 6
SELECT sexo, ciudad,
       MAX(precioCompra) AS compra_maxima,
       MIN(precioCompra) AS compra_minima
FROM visitantes
GROUP BY sexo, ciudad;

-- Punto 7
SELECT ciudad, COUNT(*) AS con_email
FROM visitantes
WHERE email <> 'no tiene'
GROUP BY ciudad;

-- Punto 8
SELECT ciudad, COUNT(*) AS con_email
FROM visitantes
WHERE email <> 'no tiene'
GROUP BY ciudad;

-- EJERCICIO 21---
-- Punto 1
SELECT ciudad,sexo,
    SUM(compras) AS total_compras
FROM visitantes
GROUP BY ciudad, sexo;
HAVING SUM (total_compras)>50;

-- Punto 2
SELECT ciudad,sexo,
    COUNT(*) AS total_visitantes,
    SUM(compras) AS suma_compras,
    AVG(compras) AS promedio_compras
FROM visitantes
GROUP BY ciudad, sexo
HAVING AVG(compras) > 30
ORDER BY suma_compras ;



