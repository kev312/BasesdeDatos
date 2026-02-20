--Punto 1
CREATE TABLE visitas (
    numVisita serial primary key,
    nombre varchar(30) default 'Anonimo',
    email varchar(50),
    pais varchar(20),
    fecha timestamp
);

--Punto 2 
INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');

INSERT INTO visitas(nombre, email, pais, fecha)
VALUES('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

--Punto 3 
SELECT * FROM visitas
ORDER BY fecha DESC;

--Punto 4 
SELECT nombre,pais,extract(MONTH FROM fecha) DESC;
FROM visitas
ORDER BY  pais,extract(MONTH FROM fecha)DESC;

--Punto 5 
SELECT pais 
extract (MONTH FROM fecha) AS mes,
extract(DAY FROM fecha) AS dia,
extract(HOUR FROM fecha) AS hora,
FROM visitas
ORDER BY 2,3,4;

--Punto 6 
SELECT email, pais 
FROM visitas 
WHERE extract(MONTH FROM fecha) = 10
ORDER BY pais;

--Punto 7 
SELECT * FROM visitas
WHERE fecha BETWEEN '2006-09-12' AND '2006-10-11';

SELECT * FROM visitas 
WHERE fecha >= '2006-09-12' AND fecha <='2006-10-11';

--Punto 8 
SELECT * FROM visitas
WHERE numVisita BETWEEN 2 AND 5;
