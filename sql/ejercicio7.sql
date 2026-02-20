--Punto 1
create table libros (
	titulo varchar(40),
	autor varchar(30),
	editorial varchar(20)	
);

--Punto 2 
SELECT * FROM libros; 

--Punto 3
INSERT INTO libros(titulo, autor, editorial)
VALUES('El libro','Borges','Emecé');
INSERT INTO libros (titulo, autor, editorial)
VALUES('Martin Fierro','José Hernández','Emecé');
INSERT INTO libros (titulo, autor, editorial)
VALUES('Aprenda SQL','Mario Molina','Emecé');
INSERT INTO libros (titulo, autor, editorial)
VALUES('Cervantes y el Quijote', 'Borges','Emecé');
INSERT INTO libros (titulo, autor, editorial)
VALUES('Matemática estás ahí','Paenza','Siglo XXI');

--Punto 4 
UPDATE libros
SET autor = 'Adrián Paenza'
WHERE autor = 'Paenza';

-- Punto 5 
UPDATE libros
SET editorial = 'Emecé S.A.'
WHERE editorial = 'Emecé';

-- Punto 6
DELETE FROM libros
WHERE autor = 'Borges';

-- Punto 7
DELETE FROM libros
WHERE editorial = 'Emecé S.A.';


--Ejercicio 10

-- Punto 1 
SELECT FROM libros
WHERE autor = 'Borges';
-- Punto 2 
SELECT titulo 
FROM libros 
WHERE editorial = 'Emece';
-- Punto 3 
SELECT editorial
FROM libros 
where autor ='Martin Fierro';


--Ejercicio15
--Punto1
SELECT *FROM libros
WHERE autor LIKE '%Borges%';

--Punto2 
SELECT * FROM libros
WHERE titulo LIKE 'M%';

--Punto3
SELECT titulo FROM libros
WHERE titulo NOT LIKE 'M%';

--Punto4 
SELECT * FROM libros
WHERE autor LIKE 'Lewis Carrol_';

--Punto5
SELECT * FROM libros
WHERE precio BETWEEN 10.00 AND 19.99;

--Punto 6
SELECT * FROM libros
WHERE precio % 1 = 0;
