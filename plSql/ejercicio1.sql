
CREATE TABLE agenda (
    apellido varchar(30),
    nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);    

-- PUNTO 3

DECLARE
   v_numFilas NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_numFilas FROM agenda;
   DBMS_OUTPUT.PUT_LINE('El número de filas es: ' || v_numFilas);   
END;

INSERT INTO agenda (apellido, nombre, domicilio, telefono) VALUES ('Perez', 'Juan', 'Calle 1, 123', '12345678');
INSERT INTO agenda (apellido, nombre, domicilio, telefono) VALUES ('Garcia', 'Pedro', 'Calle 2, 123', '12345678');
INSERT INTO agenda (apellido, nombre, domicilio, telefono) VALUES ('Hernandez', 'Carlos', 'Calle 3, 123', '12345678');

