--Punto 1
--Crear la secuencia "sec_numeroempleado" estableciendo valor minimo 1
-- maximo 999, valor inicial 100, valor de incremento 2 y no circular
CREATE SEQUENCE sec_numeroempleado
MINVALUE 1
MAXVALUE 999
START WITH 100
INCREMENT BY 2;

--Punto 2
--Crear la tabla "empleados" con los campos indicados
-- numeroEmpleado: entero grande, clave primaria y tenga el valor por defecto de la secuencia
-- Documento caracter fijo de 8 y no admite nulos
-- Nombre: cadena de 20 y no admite nulos 

CREATE TABLE empleados (
    numeroEmpleado BIGINT PRIMARY KEY DEFAULT NEXTVAL('sec_numeroempleado'),
    Documento CHAR(8) NOT NULL,
    Nombre VARCHAR(20) NOT NULL
);

--Punto 3
--Insertar 3 registros en la tabla empleados
INSERT INTO empleados (Documento, Nombre)
 VALUES ('22333444', 'Ana Acosta');
INSERT INTO empleados (Documento, Nombre)
VALUES ('24555666', 'Carlos Caseros');
INSERT INTO empleados (Documento, Nombre)
VALUES ('26777888', 'Estela Esper');
INSERT INTO empleados (Documento, Nombre)
VALUES ('23444555', 'Betina Bustamante');
INSERT INTO empleados (Documento, Nombre)
VALUES ('25666777', 'Diana Dominguez');
--Punto 4
--Mostrar los registros de la tabla empleados 
SELECT * FROM empleados;

--Punto 5
--Efectuar un select de la secuencia
SELECT NEXTVAL('sec_numeroempleado') AS siguiente_valor;
SELECT CURRVAL('sec_numeroempleado') AS valor_actual;

--Punto 6
--Eliminar la secuencia y la tabla asociada a dicha secuencia
DROP TABLE empleados;
DROP SEQUENCE sec_numeroempleado;






