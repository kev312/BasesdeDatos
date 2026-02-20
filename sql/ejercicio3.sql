--Punto 1 
--Crear tabla medicamentos con la siguiente estructura

CREATE TABLE medicamentos (
    codigo serial,
    nombre varchar(20),
    laboratorio varchar(20),
    precio decimal(5,2),
    cantidad smallint,
    primary key (codigo)
);

--Punto 2 
--Insertar los siguientes datos en la tabla medicamentos
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad) 
VALUES ('Sertal', 'Roche', 5.20, 100);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES  ('Buscapina', 'Roche',4.10, 200);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Amoxidal 500','Bayer', 15.60,100);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Paracetamol 500','Bago', 1.90, 200);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Bayaspirina', 'Bayer', 2.10, 150);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Amoxidal jarabe','Bayer', 5.10, 250);

--Punto 3
--Implementar una funcion "precioPromedio" que retorne el precio promedio de la tabla medicamentos
CREATE OR REPLACE FUNCTION precioPromedio()
RETURNS decimal AS $$
DECLARE
    promedio decimal;
BEGIN
    SELECT AVG(precio) INTO promedio FROM medicamentos;
    RETURN promedio;
END;

$$ LANGUAGE plpgsql;

--Punto 4
--Imprimir el precio promedio de los medicamentos
SELECT precioPromedio() AS precio_promedio;
--Punto 5
--Imprimir los medicamentos que tienen un precio mayor al promedio 
SELECT * FROM medicamentos
WHERE precio > precioPromedio();
--Punto 6
--Implementar una funcion "borrarMedicamento" que reciba el codigo de un medicamento y proceda a borrarlo.La funcion no devuelve dato
CREATE OR REPLACE FUNCTION borrarMedicamento(codigo_medicamento INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM medicamentos WHERE codigo = codigo_medicamento;
END;
$$ LANGUAGE plpgsql;

--Punto 7
--LLamar a la funcion "borrarMedicamento"
SELECT borrarMedicamento(3);

--Punto 8
--Comprobar que el medicamento ha sido borrado de la tabla medicamentos
SELECT * FROM medicamentos;

--Punto 9
--Implementar una funcion "medicamentoMasCaro" que devuelva el registro completo del medicamento mas caro 
CREATE OR REPLACE FUNCTION medicamentoMasCaro()
RETURNS TABLE(codigo INT, nombre VARCHAR, laboratorio VARCHAR, precio DECIMAL, cantidad SMALL
INT) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM medicamentos
    ORDER BY precio DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

--Punto 10
--Llamar a la funcion "medicamentoMasCaro"
SELECT * FROM medicamentoMasCaro();






