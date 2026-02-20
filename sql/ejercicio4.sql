-- Punto 1 
create table empleados(
	documento varchar(8) primary key, 
	nombre varchar(30),
	fechaNacimiento date,
	cantidadHijos smallint default 0,
	seccion varchar(20),
	sueldo decimal(6,2)
);

-- Punto 2 
alter table empleados
	add constraint CK_valores_negativos
	check(sueldo>0);

-- Punto 3 
alter table empleados 
	add constraint CK_superar_fechaNacimiento
	check(fechaNacimiento< current_date);

-- Punto 4
alter table empleados 
	add constraint CK_numero_hijos
	check (cantidadHijos between 0 and 15);
