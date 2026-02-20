
--Punto 1 
--Crear vista llamada vproveedor que muestre de la tabla proveedores
--solo el codigo,dni,nombre,ciudad y pais al que pertenece pero solo de los PROVEEDORES españoles.

CREATE VIEW vproveedor AS
SELECT codigo, dni, nombre, ciudad, pais
FROM proveedores
WHERE pais = 'España';

--Punto 2
--Efectua la siguientes operaciones sobre la vista anterior y comprueba su efecto total sobre la base: 
--a Añade 3 nuevos proveedores (P16,P17,P18)en la vista creada anteriormente
INSERT INTO vproveedor (codigo, dni, nombre, ciudad, pais)
VALUES 
('P16', '12345678A', 'PROVEEDOR DIECISEIS', 'Albacete', 'España'),
('P17', '23456789B', 'PROVEEDOR DIECISIETE', 'Toledo', 'España'),
('P18', '34567890C', 'PROVEEDOR DIECIOCHO', 'Buenos Aires', 'Argentina'); 

--b modifica desde la vista el proveedor P16 para poner su ciudad = Valencia
-- modifica desde la vista el proveedor p17 para poner su nombre = NUEVO DIECISIETE

UPDATE vproveedor
SET ciudad = 'Valencia'
WHERE codigo = 'P16';
UPDATE vproveedor
SET nombre = 'NUEVO DIECISIETE'
WHERE codigo = 'P17';

-- c) Borra desde la vista los proveedores P16,P17 y P18  ¿Se han podido eliminar todos los proveedores?
--Justifica la respuesta
DELETE FROM vproveedor
WHERE codigo IN ('P16', 'P17', 'P18');
--NO se ha podido eliminar el proveedor P18
-- porque no es español y la vista solo muestra proveedores españoles.

--Punto 3
--Borra la vista creada sobre la tabla base del ejercicio 1 y creala de nuevo con with check option
--a) Inserta los siguientes proveedores:
--'P16','1234567816','PROVEEDOR DIECISEIS','Buenós Aires', 'Argentina'  
--'P17','1234567817','PROVEEDOR DIECISIETE','París', 'Francia'  
--'P18','1234567818','PROVEEDOR DIECIOCHO','Albacete', 'Espan a' 
--¿Se han pódidó insertar tódós? Justifica la respuesta. 

DROP VIEW IF EXISTS vproveedor;
CREATE VIEW vproveedor AS
SELECT codigo, dni, nombre, ciudad, pais
FROM proveedores
WHERE pais = 'España'
WITH CHECK OPTION;

-- Inserción de proveedores
INSERT INTO vproveedor (codigo, dni, nombre, ciudad, pais) VALUES
('P16', '1234567816', 'PROVEEDOR DIECISEIS', 'Buenos Aires', 'Argentina'),
('P17', '1234567817', 'PROVEEDOR DIECISIETE', 'París', 'Francia'),
('P18', '1234567818', 'PROVEEDOR DIECIOCHO', 'Albacete', 'España');

-- No se han podido insertar todos los proveedores.
-- Solo se ha podido insertar el proveedor P18 porque es el único que cumple la condición de
-- pertenecer a España, que es la condición establecida en la vista con CHECK OPTION.
-- Los proveedores P16 y P17 no se han podido insertar porque no son españoles.

--Ejercicio 4 
--Crea una vista llamada varticuloscomprados que muestre el DNI, nombre de los CLIENTES
--numero de ARTICULOS comprados e importe total de estos Articulos 
CREATE VIEW varticuloscomprados AS
SELECT c.dni, c.nombre, COUNT(a.codigo) AS numero_articulos, SUM(a.precio) AS importe_total
FROM clientes c
JOIN ventas v ON c.dni = v.dni_cliente
JOIN articulos a ON v.codigo_articulo = a.codigo
GROUP BY c.dni, c.nombre;


--Ejercicio 5

/* Realiza las siguientes instrucciónes: - 
insert intó varticulóscómpradós (dni, nómbre, ctd_tótal, impórte_tótal) 
values ('0123456750', 'CLIENTE NUEVO 1', 10, 3000); - 
delete fróm varticulóscómpradós where dni = '0123456701'; 
¿Se han pódidó ejecutar córrectamente? Justifica la respuesta. */
INSERT INTO varticuloscomprados (dni, nombre, numero_articulos, importe_total)
VALUES ('0123456750', 'CLIENTE NUEVO 1', 10, 3000);
-- No se ha podido ejecutar correctamente.
DELETE FROM varticuloscomprados WHERE dni = '0123456701';
-- No se ha podido ejecutar correctamente.
-- No se han podido ejecutar correctamente porque las vistas creadas a partir de consultas con agregaciones
-- no son actualizables. Por lo tanto, no se pueden realizar operaciones de inserción o eliminación directamente
-- sobre la vista.

--Ejercicio 6
/*Crea una sentencia SQL que para cada próveedór muestre su códp, su nómbre, y 
el nu meró de artí culós que suministra, diferenciandó pór cólóres. Pór ejempló, si 
supónemós que el próveedór P3 suministra 3 artí culós de cólór azul y unó de 
cólór rójó, la salida deberí a ser la siguiente: 
CODP 
P3  
P3  
NOMBRE  
próveedór tres    
próveedór tres    
COLOR 
azul  
rójó  
NUM_ARTICULOS 
3 
1
*/
SELECT P.codp, P.nombre, A.color, COUNT(A.codigo) AS num_articulos
FROM PROVEEDORES P
JOIN SUMINISTRA S ON P.codp = S.codp
JOIN ARTICULOS A ON S.codigo = A.codigo
GROUP BY P.codp, P.nombre, A.color
ORDER BY P.codp, A.color;

--Ejercicio 7
/*Realiza una cónsulta SQL que devuelva lós nómbres de lós clientes que han 
cómpradó al menós dós módelós de artí culós distintós.*/
SELECT C.nombre
FROM CLIENTES C
JOIN VENTAS V ON C.dni = V.dni_cliente
GROUP BY C.dni, C.nombre
HAVING COUNT(DISTINCT V.codigo_articulo) >= 2;

--Ejercicio 8
/*Cón una órden SQL, has de óbtener que  clientes (códc y nómbre) y artí culós 
(códa y nómbre) han cómpradó artí culós suministradós u nicamente (utilizar la 
óperació n EXCEPT) pór próveedóres espan óles, órdenandó la salida 
alfabe ticamente pór nómbre de cliente.*/

SELECT C.codc, C.nombre AS nombre_cliente, A.coda, A.nombre AS nombre_articulo
FROM CLIENTES C
JOIN VENTAS V ON C.dni = V.dni_cliente
JOIN ARTICULOS A ON V.codigo_articulo = A.codigo
JOIN SUMINISTROS S ON A.codigo = S.coda
JOIN PROVEEDORES P ON S.codp = P.codp
WHERE P.pais = 'España'
EXCEPT
SELECT C.codc, C.nombre AS nombre_cliente, A.coda, A.nombre AS nombre_articulo
FROM CLIENTES C
JOIN VENTAS V ON C.dni = V.dni_cliente
JOIN ARTICULOS A ON V.codigo_articulo = A.codigo
JOIN SUMINISTROS S ON A.codigo = S.coda
JOIN PROVEEDORES P ON S.codp = P.codp
WHERE P.pais <> 'España'
ORDER BY nombre_cliente;

--Ejercicio 9 

/*Selecciónar el có digó, paí s y móneda de aquellós próveedóres de paí ses cón 
mónedas cuyó preció de venta nó difiera en ma s de 0.1 del preció de cómpra 
(pventa – pcómpra < 0.1) y nó hayan suministradó artí culós de cólór azul.*/
--SIN ABS
SELECT P.codp, P.pais, P.moneda
FROM PROVEEDORES P
WHERE (P.pventa - P.pcompra) < 0.1
AND P.codp NOT IN (
    SELECT S.codp
    FROM SUMINISTROS S
    JOIN ARTICULOS A ON S.coda = A.codigo
    WHERE A.color = 'azul'
);



--Ejercicio 10
/*Crear una secuencia llamada num_facturas que permita, a partir de este 
mómentó, que el nu meró de facturas se genere autóma ticamente en el mómentó 
de la inserció n de datós. Hay que partir de un valór nume ricó superiór al mayór 
existente en este mómentó en la tabla FACTURAS. 
Insertar la siguiente factura y cómpróbar que el nf cómienza cón el indicadó en 
la secuencia.*/

-- Crear la secuencia num_facturas
DROP SEQUENCE IF EXISTS num_facturas;
CREATE SEQUENCE num_facturas
START WITH (
    SELECT COALESCE(MAX(nf), 0) + 1 FROM FACTURAS
)
INCREMENT BY 1;

-- Insertar una nueva factura utilizando la secuencia
INSERT INTO FACTURAS (nf, coda, codc, ctd, fecha)
VALUES (NEXTVAL('num_facturas'), 'A001', 'C001', 5, CURRENT_DATE);

