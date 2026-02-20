-- Punto1 
create table vehiculos(
	numero serial primary key,
	numeroBastidor varchar(17),
	marcaModelo varchar(40),
	fechaHoraEntrada timestamp,
	fechaHoraSalida timestamp
);

--Punto 2 
alter table vehiculos
add constraint CK_comparar_fechas
check (fechaHoraEntrada < current_timestamp);

--Punto 3 
alter table vehiculos
add constraint CK_fecha_salida_No_posterior
check (fechaHoraSalida >fechaHoraEntrada);

--Punto 4 
alter table vehiculos 
add contraint CK_num_bastidor
check (numeroBastidor IS NULL OR fechaHoraEntrada <= fechaHoraSalida );

-- Ejercicio 5 parte b
--Punto 1
create table clientes(
	codigo serial primary key,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	cp smallint not null
);
-- Punto 2 
create table provincias (
	codigo serial,
	nombre varchar(20)
);

-- Punto 3 
alter table clientes 
add constraint fk_provincia foreign key (cp) references provicias(codigo);

-- Punto 4
alter table provincias 
add constraint pk_provincias primary key (codigo); 

-- Punto 5 
	INSERT INTO provincias (nombre) VALUES(1,'Toledo'),(2,'Albacete'),(3,'Cuenca'),(4,'Ciudad Real');
	INSERT INTO clientes (nombre, domicilio, ciudad, cp) VALUES
	('Lopez Marcos', 'Colon 111', 'Ocaña', 1),
	('Perez Ana', 'San Martin 222', 'Valdepeñas', 6), 
	('Garcia Juan', 'Rivadavia 333', 'La Roda', 2),
	('Perez Luis', 'Sarmiento 444', 'Tarancón', 3);

--Punto 6 
alter table  clientes
	add constraint fk_clientes_provincia
	foreign key (cp) references provincias(codigo) on update cascade on delete restrict;

-- Punto 7
DELETE FROM clientes WHERE cp = 4;
-- Punto 8
update provincias set codigo= 7 where codigo=1;
-- No se puede porque hay registros en "clientes" al cual hace referencia

-- Esto generará error si hay clientes con cp = 3
DELETE FROM provincias WHERE codigo = 3;
UPDATE provincias SET nombre = 'Toledo Capital' WHERE codigo = 1;

