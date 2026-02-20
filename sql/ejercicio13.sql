--Punto1
CREATE TABLE peliculas(
    codigo serial PRIMARY KEY,
    titulo varchar(40) NOT NULL,
    actor varchar(20),
    duracion smallint
);

--Punto2 
INSERT INTO peliculas (titulo, actor, duracion) VALUES
('Mision imposible', 'Tom Cruise', 120),
('Harry Potter y la piedra filosofal', 'Daniel R.', 180),
('Harry Potter y la camara secreta', 'Daniel R.', 190),
('Mision imposible 2', 'Tom Cruise', 120),
('Mujer bonita', 'Richard Gere', 120),
('Tootsie', 'D. Hoffman', 90),
('Un oso rojo', 'Julio Chavez', 100),
('Elsa y Fred', 'China Zorrilla', 110);

--Punto 3
SELECT * FROM peliculas
WHERE actor IN ('Tom Cruise', 'Richard Gere')
OR duracion < (SELECT MIN(duracion) FROM peliculas
    WHERE actor IN ('Tom Cruise', 'Richard Gere')
    );
--Punto 4
SELECT * FROM peliculas
WHERE actor = 'Tom Cruise'
  AND duracion < 100;
--Punto 5
SELECT * FROM peliculas
WHERE actor IS NULL;

--Punto 6
UPDATE peliculas
SET duracion = 200
WHERE actor = 'Daniel R.'
  AND duracion = 180;

--Punto 7
DELETE FROM peliculas
WHERE actor <> 'Tom Cruise'
  AND duracion >= 100;

