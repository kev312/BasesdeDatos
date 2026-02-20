
SET SERVEROUTPUT ON;
-- EJERCICIO 1
-- Eliminar tabla si existe
DROP TABLE IF EXISTS MENSAJES;

-- Crear tabla MENSAJES
CREATE TABLE MENSAJES (
    VALOR VARCHAR2(5)
);

DECLARE
    v_numero NUMBER := 1;
    v_contador NUMBER := 0;
BEGIN
    
    WHILE v_contador < 8 LOOP
        IF v_numero != 4 AND v_numero != 5 THEN
            INSERT INTO MENSAJES (VALOR) VALUES (TO_CHAR(v_numero));
            DBMS_OUTPUT.PUT_LINE('Insertado: ' || v_numero);
            v_contador := v_contador + 1;
        END IF;
        v_numero := v_numero + 1;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Total insertados: ' || v_contador || ' registros.');
END;
/

-- Mostrar resultados del ejercicio 1
SELECT * FROM MENSAJES;

-- EJERCICIO 2
DECLARE
    v_codigo ARTICULOS.CODIGO%TYPE := &codigo_articulo;
    v_pvp ARTICULOS.PVP%TYPE;
    v_aumento NUMBER;
    v_nuevo_pvp NUMBER;
BEGIN
    
    -- Obtener el PVP actual del artículo
    SELECT PVP INTO v_pvp
    FROM ARTICULOS
    WHERE CODIGO = v_codigo;

    IF v_pvp IS NULL THEN
        v_aumento := 0;
    ELSIF v_pvp < 300 THEN
        v_aumento := 25;
    ELSIF v_pvp >= 300 AND v_pvp <= 1000 THEN
        v_aumento := 50;
    ELSE 
        v_aumento := 100;
    END IF;
    
    -- Calcular nuevo PVP
    v_nuevo_pvp := NVL(v_pvp, 0) + v_aumento;
    
    -- Actualizar el precio
    UPDATE ARTICULOS
    SET PVP = v_nuevo_pvp
    WHERE CODIGO = v_codigo;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('PVP anterior: ' || NVL(TO_CHAR(v_pvp), 'NULL'));
    DBMS_OUTPUT.PUT_LINE('Aumento aplicado: ' || v_aumento || '€');
    DBMS_OUTPUT.PUT_LINE('Nuevo PVP: ' || v_nuevo_pvp || '€');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No existe un artículo con el código ' || v_codigo);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- EJERCICIO 3
-- Añadir nueva columna para almacenar cadenas de '*'
ALTER TABLE ARTICULOS DROP COLUMN ESTRELLAS;
ALTER TABLE ARTICULOS ADD ESTRELLAS VARCHAR2(100);

DECLARE
    v_codigo ARTICULOS.CODIGO%TYPE := &codigo_articulo;
    v_pvp ARTICULOS.PVP%TYPE;
    v_num_asteriscos NUMBER;
    v_cadena_asteriscos VARCHAR2(100) := '';
    i NUMBER;
BEGIN
    
    -- Obtener el PVP del artículo
    SELECT PVP INTO v_pvp
    FROM ARTICULOS
    WHERE CODIGO = v_codigo;
    
    -- Verificar que el PVP no sea NULL
    IF v_pvp IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('El PVP del artículo es NULL. No se pueden calcular asteriscos.');
        UPDATE ARTICULOS SET ESTRELLAS = NULL WHERE CODIGO = v_codigo;
    ELSE
        -- Calcular número de asteriscos (1 por cada 200€)
        v_num_asteriscos := TRUNC(v_pvp / 200);
        
        IF v_num_asteriscos = 0 AND v_pvp > 0 THEN
            v_num_asteriscos := 1;
        END IF;
        
        FOR i IN 1..v_num_asteriscos LOOP
            v_cadena_asteriscos := v_cadena_asteriscos || '*';
        END LOOP;
        
        -- Actualizar la tabla
        UPDATE ARTICULOS
        SET ESTRELLAS = v_cadena_asteriscos
        WHERE CODIGO = v_codigo;
        
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_codigo);
        DBMS_OUTPUT.PUT_LINE('PVP: ' || v_pvp || '€');
        DBMS_OUTPUT.PUT_LINE('Número de asteriscos: ' || v_num_asteriscos);
        DBMS_OUTPUT.PUT_LINE('Cadena generada: ' || v_cadena_asteriscos);
    END IF;
    
    COMMIT;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No existe un artículo con el código ' || v_codigo);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
-- Mostrar resultados finales del ejercicio 3
SELECT CODIGO, DESCRIPCION, PVP, ESTRELLAS FROM ARTICULOS WHERE CODIGO = (SELECT MAX(CODIGO) FROM ARTICULOS WHERE ESTRELLAS IS NOT NULL);