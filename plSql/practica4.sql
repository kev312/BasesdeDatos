SET SERVEROUTPUT ON;

--EJERCICIO 1
-- Lo que es correcto:
v_id NUMBER(4);
v_birthdate DATE NOT NULL := SYSDATE;
TYPE name_table_type IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;
dept_name_table name_table_type;

-- Errores:
-- V_x, V_Y,V_z VARCHAR2(10); --No se pueden declarar múltiples variables en una línea separadas por comas
-- v_in_stock BOOLEAN := 1; --  No se puede asignar 1 a BOOLEAN, debe ser TRUE/FALSE/NULL
-- emp_record emp_record_type; -- El tipo emp_record_type no está definido previamente
-- TrPE -- Escrito incorrectamente, debe ser TYPE
-- INDEX BY BINARY_INTEGER; -- Debe ir en la misma línea de la declaración TYPE

--EJERCICIO 2 
/*
v_customer (externa): 'Womansport' -> 'Womansport' -> 'CarmenWomansport'
v_weight: 600 -> 601 -> 602
v_message (externa): 'Producto 10012' -> 'Producto 10012' -> 'Producto 10012esta en stock'
v_customer (interna): 201 -> 201 -> no existe
v_message (interna): 'Producto 11001' -> 'Producto 11001' -> no existe
v_new_locn: 'Europa' -> 'OesteEuropa' -> error (fuera de ambito)
*/

-- EJERCICIO 3
DECLARE
    v_precio NUMBER(10,2);
    v_iva NUMBER(5,2);
    v_total NUMBER(10,2);
BEGIN
    v_precio := &precio;
    v_iva := &iva;
    v_total := v_precio + (v_precio * v_iva / 100);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    DBMS_OUTPUT.PUT_LINE('IVA (' || v_iva || '%): ' || (v_precio * v_iva / 100));
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
END;
/

-- EJERCICIO 4
DECLARE
    v_max_pvp ARTICULOS.PVP%TYPE;
BEGIN
    SELECT MAX(PVP) INTO v_max_pvp FROM ARTICULOS;
    DBMS_OUTPUT.PUT_LINE('=== EJERCICIO 4 ===');
    DBMS_OUTPUT.PUT_LINE('Articulo con mayor PVP: ' || v_max_pvp);
END;
/

-- EJERCICIO 5
DECLARE
    v_codigo CLIENTES.CODIGO%TYPE;
    v_nueva_direccion CLIENTES.DIRECCION%TYPE;
BEGIN
    v_codigo := &codigo_cliente;
    v_nueva_direccion := '&nueva_direccion';
    UPDATE CLIENTES SET DIRECCION = v_nueva_direccion WHERE CODIGO = v_codigo;
  
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Direccion actualizada correctamente.');
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cliente no encontrado.');
    END IF;
END;
/

-- EJERCICIO 6
DECLARE
    v_codigo ARTICULOS.CODIGO%TYPE;
    v_nombre ARTICULOS.NOMBRE%TYPE;
BEGIN
    v_codigo := '&codigo_articulo';
    v_nombre := '&nombre_articulo';
    INSERT INTO ARTICULOS (CODIGO, NOMBRE) VALUES (v_codigo, v_nombre);
    DBMS_OUTPUT.PUT_LINE('Articulo insertado correctamente.');
    COMMIT;
END;
/

-- EJERCICIO 7
DECLARE
    v_pais PROVEEDORES.PAIS%TYPE;
    v_contador NUMBER;
BEGIN
    v_pais := '&pais';
    DELETE FROM PROVEEDORES WHERE PAIS = v_pais;
    DBMS_OUTPUT.PUT_LINE('Proveedores eliminados de ' || v_pais || ': ' || SQL%ROWCOUNT);
    COMMIT;
END;
/