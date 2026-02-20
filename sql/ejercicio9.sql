
create table agenda(
	apellido varchar(30),
	nombre varchar(20) not null,
	domicilio varchar(30),
	telefono varchar(11),
	email varchar(30)
);


insert into agenda values('Perez', 'Juan', 'Sarmiento 345', '43344555', 'juanito@gmail.com');
insert into agenda values('Garcia', 'Ana', 'San Martin 367', '4226677', 'anamariagarcia@hotmail.com');
insert into agenda values('Lopez', 'Maria', 'Av. Arangolada 900', null, 'juanitogarcia@gmail.com');
insert into agenda values('Juarez', 'Mariana', 'Ameghino 123', '052565787', 'marianaJuarez@gmail.com');
insert into agenda values('Molinari', 'Lucia', 'Peru 123', '4523456', null);
insert into agenda values('Ferreyra', 'Patricia', 'Colon 1534', '4555884', null);
insert into agenda values('Perez', 'Susana', 'San Martin 331', null, null);
insert into agenda values('Perez', 'Luis', 'Colon 123', '455455256', 'perezluisalberto@hotmail.com');
insert into agenda values('Lopez', 'Maria', 'Salta 314', null, 'lopezmariayo@gmail.com');

 
create index I_agenda_apellido on agenda(apellido);

create unique index I_agenda_email on agenda(email);
 
drop index I_agenda_apellido;
drop index I_agenda_email;

-- Punto 1 
select * from agenda;

-- Punto 2 
select from agenda 
where nombre ='Maria';

-- Punto 3 
select nombre domicilio
from agenda 
where apellido='Perez';

--Punto 4 
Select nombre
from agenda
where telefono='4585858';