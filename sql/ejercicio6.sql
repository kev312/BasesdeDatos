CREATE TABLE agenda (
    apellido VARCHAR(30),
    nombre VARCHAR(20),
    domicilio VARCHAR(30),
    telefono CHAR(11)
);
-- O con SQL estándar:
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'agenda';

INSERT INTO agenda (nombre, apellido, domicilio, telefono) VALUES
('Alberto', 'Moreno', 'Colon 123', '642345671'),
('Juan', 'Torres', 'Avellaneda 428', '658947852'),
('Ana', 'López', 'La Paz 85', '626547984'),
('María', 'Gutiérrez', 'Avda. Cid 97', '677556971'),
('Miguel', 'Cárceles', 'Puerta Murcia 20', '666848721'),
('Lucía', 'Torres', 'Mayor 57', '626547984');

UPDATE agenda SET nombre = 'Juan Jose' WHERE nombre = 'Juan';
UPDATE agenda SET telefono = '111223344' WHERE telefono = '626547984';
UPDATE agenda SET domicilio = 'Falsa 123' WHERE apellido = 'Torres';
DELETE FROM agenda WHERE nombre = 'Miguel';
DELETE FROM agenda WHERE telefono = '111223344';
