--Punto1 
CREATE TABLE  clientes (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    domicilio varchar(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
);

--Punto2
INSERT INTO clientes (nombre, domicilio, ciudad, provincia, telefono) VALUES
('Lopez Marcos','Colon 111','Cordoba','Cordoba', NULL),
('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585'),
('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445'),
('Perez Luis','Sarmiento 444','Rosario','Santa Fe', NULL),
('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685'),
('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525'),
('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455'),
('Lopez Carlos', NULL,'Cruz del Eje','Cordoba', NULL),
('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366'),
('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

--Punto3
SELECT ciudad, provincia, COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad, provincia;

--Punto4
SELECT ciudad, provincia, COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad, provincia
HAVING COUNT(*) >1;

