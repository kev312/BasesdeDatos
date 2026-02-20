
--Ejercicio 1

CREATE TABLE socios (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(40),
    domicilio VARCHAR(30),
    PRIMARY KEY (documento)
);

CREATE TABLE profesores (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(40),
    domicilio VARCHAR(30),
    PRIMARY KEY (documento)
);

CREATE TABLE cursos (
    numero SERIAL,
    deporte VARCHAR(20),
    dia VARCHAR(15),
    documentoprofesor CHAR(8),
    PRIMARY KEY (numero),
    FOREIGN KEY (documentoprofesor) REFERENCES profesores(documento)
);

CREATE TABLE matriculados (
    documentosocio CHAR(8) NOT NULL,
    numero INT NOT NULL,
    matricula CHAR(1),
    PRIMARY KEY (documentosocio, numero),
    FOREIGN KEY (documentosocio) REFERENCES socios(documento),
    FOREIGN KEY (numero) REFERENCES cursos(numero)
);


--Insertar datos
INSERT INTO socios VALUES ('30000000','Fabian Fuentes','Caseros 987');
INSERT INTO socios VALUES ('31111111','Gaston Garcia','Guemes 65');
INSERT INTO socios VALUES ('32222222','Hector Huerta','Sucre 534');
INSERT INTO socios VALUES ('33333333','Ines Irala','Bulnes 345');

INSERT INTO profesores VALUES ('22222222','Ana Acosta','Avellaneda 231');
INSERT INTO profesores VALUES ('23333333','Carlos Casares','Colon 245');
INSERT INTO profesores VALUES ('24444444','Daniel Duarte','Sarmiento 987');
INSERT INTO profesores VALUES ('25555555','Esteban Lopez','Sucre 1204');

InSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Tennis','Lunes','22222222');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Tennis','Martes','22222222');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Natacion','Miercoles','23333333');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Natacion','Jueves','23333333');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Futbol','Viernes','24444444');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Futbol','Sabado','24444444');
INSERT INTO cursos (deporte, dia, documentoprofesor) VALUES ('Basket','Domingo','25555555');

INSERT INTO matriculados VALUES ('30000000',1,'S');
INSERT INTO matriculados VALUES ('30000000',3,'N');
INSERT INTO matriculados VALUES ('31111111',6,NULL);
INSERT INTO matriculados VALUES ('32222222',1,'S');
INSERT INTO matriculados VALUES ('32222222',4,'S');
INSERT INTO matriculados VALUES ('33333333',8,'S');

-- Punto 3: Crear vista en la que aparezca nombre y documento del socio, el deporte,el dia y el nombre del profesor

CREATE VIEW vista_matriculados AS
SELECT s.nombre AS nombre_socio,
       s.documento AS documento_socio,
       c.deporte,
       c.dia,
       p.nombre AS nombre_profesor
FROM socios s
JOIN matriculados m ON s.documento = m.documentosocio
JOIN cursos c ON m.numero = c.numero
JOIN profesores p ON c.documentoprofesor = p.documento;


--Punto 4: Mostrar la informacion contenida en la vista anterior
SELECT * FROM vista_matriculados;

--Punto 5 hacer consulta a la vista donde se muestre la cantidad de socios matriculados en cada deporte ordenados por cantidad

SELECT deporte, COUNT(DISTINCT documentosocio) AS cantidad_socios
FROM vista_matriculados
GROUP BY deporte
ORDER BY cantidad_socios DESC;

--Punto 6 Mostrar (consultando la vista) los cursos (deporte y dia) para los cuales no hay matriculados

SELECT c.deporte, c.dia
FROM cursos c
LEFT JOIN vista_matriculados vm ON c.deporte = vm.deporte AND c.dia = vm.dia
WHERE vm.documento_socio IS NULL;

--Punto 7: Mostrar los nombres de los socios que no se han matriculado en ningún curso (consultando la vista)
SELECT s.nombre
FROM socios s
LEFT JOIN vista_matriculados vm ON s.documento = vm.documento_socio
WHERE vm.documento_socio IS NULL;

--Punto 8: Mostrar (consultando la vista) los profesores que no tienen asignado ningún deporte aún.
SELECT p.nombre
FROM profesores p
LEFT JOIN vista_matriculados vm ON p.documento = vm.documento_profesor
WHERE vm.documento_profesor IS NULL;

--Punto 9: Mostrar (consultando la vista) el nombre y documento de los socios que deben matrículas.

SELECT nombre_socio, documento_socio
FROM vista_matriculados
WHERE matricula = 'N' OR matricula IS NULL;

--Punto 10: Consultar la vista y mostrar los nombres de los profesores y los días en que asisten al club para impartir sus clases.
SELECT DISTINCT nombre_profesor, dia
FROM vista_matriculados;

--Punto 11: Mostrar la misma informacion anterior pero ordenada por dia
SELECT DISTINCT nombre_profesor, dia
FROM vista_matriculados
ORDER BY dia;

--Punto 12: Mostrar todos los socios que son compañeros en tenis los lunes
SELECT vm1.nombre_socio
FROM vista_matriculados vm1
JOIN vista_matriculados vm2 ON vm1.documento_socio <> vm2.documento_socio
WHERE vm1.deporte = 'Tennis' AND vm1.dia = 'Lunes'
  AND vm2.deporte = 'Tennis' AND vm2.dia = 'Lunes';

  