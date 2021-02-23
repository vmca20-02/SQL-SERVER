--PRACTICA DE REPASO DE INSTRUCCIONES BASICAS DE SQL SERVER

--1.Listar el número y nombre de cada proveedor(APROBADO)

SELECT prov.numeroProv,prov.Nombre
FROM Tproveedor prov

--2.Si en la lista de selección se utiliza el *,este selecciona todos los campos de la tabla(APROBADO)

SELECT *
FROM Tproveedor prov

--3.Al agregar la cláusula Top n , listará los n primeros registros de la tabla seleccionada(APROBADO)

SELECT TOP 3 *
FROM Tproveedor prov

--4.Listar los números de  proveedor que aportan alguna pieza(APROBADO)

SELECT sumnis.numeroProv AS 'Num_Prov',sumnis.numeroPieza AS 'Num_Piez'
FROM Tsuministro sumnis

--5.Aplicar el distinct,para evitar obtener resultados duplicados(APROBADO)

SELECT DISTINCT(sumnis.numeroProv) AS 'Num_Prov'
FROM Tsuministro sumnis

--6.Listar el número de proveedor y de la pieza que aporta cada uno(APROBADO)

SELECT sumnis.numeroProv,sumnis.numeroPieza
FROM Tsuministro sumnis

--7.Listar los números de proveedor y la cantidad que aportan de cada pieza

---CORRECTA---

SELECT DISTINCT  numeroProv,numeroPieza, cantidad
FROM Tsuministro; 

---INCORRECTA---

SELECT sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis 
GROUP BY sumnis.numeroProv


--8.Obtener los nombres de proveedor y ciudad,para los proveedores de Paris con estado 10(APROBADO)

SELECT prov.Nombre,prov.Ciudad
FROM Tproveedor prov
WHERE prov.Ciudad='Paris' AND estado=10

--9.Encontrar los números de proveedor y de pieza de las que se provee 
--una cantidad mayor o igual a 100  pero menor o igual a 300 (APROBADO)

SELECT sumnis.numeroProv,sumnis.numeroPieza,sumnis.cantidad
FROM Tsuministro sumnis 
WHERE (sumnis.cantidad>=100) AND (sumnis.cantidad<=300)


SELECT numeroProv,numeroPieza,cantidad
FROM Tsuministro 
WHERE cantidad BETWEEN 100 AND 300


--10.Obtener la información de todos los proveedor que tengan el apellido 'Salazar'(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.Nombre LIKE '%Salazar%'

--11.Obtener todos los nombres de Proveedor que tengan la sílaba 'al' dentro de su apellido.(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.Nombre LIKE '%al'

--12.Obtener todos los nombres de Pieza que finalicen con la letra 'o'.(APROBADO)

SELECT piez.Nombre
FROM Tpieza piez
WHERE piez.Nombre LIKE '%o'

--13.Obtener todos los nombres de proveedor que habitan en 
--una ciudad cuyo nombre tiene como tercera letra la 'n'.(APROBADO)

SELECT prov.Nombre,prov.Ciudad
FROM Tproveedor prov
WHERE prov.Ciudad LIKE '___n%'

--14.Obtener la información de los proveedores en orden descendente de estado.(APROBADO)

SELECT *
FROM Tproveedor prov
ORDER BY prov.estado DESC 

--15.Obtener la información de las piezas en orden ascendente de peso.(APROBADO)

SELECT *
FROM Tpieza piez
ORDER BY piez.peso ASC

--16.Obtener la información de los proveedores en orden ascendente de ciudad.(ARPOBADO)

SELECT *
FROM Tproveedor prov
ORDER BY prov.Ciudad ASC

---FUNCIONES INTEGRADAS---

--17.Listar cuantos proveedores viven en París.(APROBADO)

SELECT COUNT(*) AS 'Cant_Proveedores'
FROM Tproveedor prov
WHERE prov.Ciudad LIKE 'Paris'

--18.Listar la cantidad de piezas rojas.(APROBADO)

SELECT *
FROM Tpieza piez
WHERE piez.color='Rojo'

--19.Obtener la cantidad de proveedores que aportan la pieza P2.(APROBADO)

SELECT COUNT(sumnis.numeroProv) AS 'Cant_Proveedores'
FROM Tsuministro sumnis
WHERE sumnis.numeroPieza='P2'

--20.Obtener la cantidad total suministrada de la pieza P2.(APROBADO)

SELECT SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
WHERE sumnis.numeroPieza='P2'

--21.Obtener el promedio de las cantidades de piezas que aportan los proveedores.(APROBADO)

SELECT AVG(sumnis.cantidad) AS 'Promedio'
FROM Tsuministro sumnis

--22.Obtener el mayor peso de una pieza.(ABROBADO)

SELECT MAX(piez.peso) AS 'Mayor_Peso'
FROM Tpieza piez

--23.Obtener la cantidad mínima de piezas que aporta un proveedor.(APROBADO)

SELECT sumnis.numeroProv,MIN(sumnis.cantidad) AS 'Cantidad_Aporte'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv

--24.Listar la cantidad de proveedores que aportan piezas.(APROBADO)

SELECT COUNT(DISTINCT(sumnis.numeroProv)) AS 'Cantidad_Proveedores'
FROM Tsuministro sumnis

---AGRUPAMIENTO DE DATOS---

--25.Obtener el número de proveedor y la suma total de piezas que aporta.(APROBADO)

SELECT sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv

--26.Obtener la cantidad de piezas diferentes que aporta cada proveedor.(APROBADO)

SELECT sumnis.numeroProv,COUNT(sumnis.numeroPieza) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv

--27.Una forma diferente para crearle una alias a una columna sin nombre.(APROBADO)

SELECT 'Columna' AS [Nombre Columna]

---USO DEL HAVING---

--28.Listar la cantidad de piezas que aporta cada proveedor pero sin tomar en cuenta al proveedor S2.(APROBADO)

SELECT sumnis.numeroProv,COUNT(sumnis.numeroPieza) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
WHERE sumnis.numeroProv <> 'S2'
GROUP BY sumnis.numeroProv


SELECT sumnis.numeroProv,COUNT(sumnis.numeroPieza) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv
HAVING sumnis.numeroProv <> 'S2'

--29 Listar para cada proveedor la suma de todas las piezas suministradas,
--   pero de manera que únicamente aparezcan los que aportan en total más
--   de 500 piezas.(APROBADO)

SELECT *
FROM 
(SELECT sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad'
 FROM Tsuministro sumnis
 GROUP BY sumnis.numeroProv) tblSumnist
WHERE tblSumnist.Cantidad>500


SELECT sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv
HAVING SUM(sumnis.cantidad)>500

--30 Listar para cada pieza, la cantidad total que de ella aportan
--   entre todos los proveedores, pero, de manera que aparezcan 
--   únicamente las piezas de las que se aporta más de 600 piezas en total (APROBADO)

SELECT sumnis.numeroPieza,SUM(sumnis.cantidad) AS 'Cantidad'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroPieza
HAVING SUM(sumnis.cantidad)>600


SELECT *
FROM
(SELECT sumnis.numeroPieza,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroPieza) tblSumnist
WHERE tblSumnist.Cantidad_Piezas>600

--30 VERSION OPCIONAL
--Listar para cada pieza, la cantidad total que de ella aportan
--entre todos los proveedores, pero, de manera que aparezcan 
--únicamente las piezas con número mayor a P2 /PS(2)-->VER SI SE PUEDE OPTIMIZAR APROBADA

SELECT sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv
HAVING SUM(sumnis.cantidad)>(SELECT SUM(Tsuministro.cantidad)
                             FROM Tsuministro
			     WHERE Tsuministro.numeroPieza='P2')

SELECT tblSum.Proveedor,tblSum.Cantidad_Piezas
FROM 
(SELECT sumnis.numeroProv AS 'Proveedor',SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis
GROUP BY sumnis.numeroProv) tblSum
WHERE tblSum.Cantidad_Piezas>(SELECT SUM(Tsuministro.cantidad)
                              FROM Tsuministro
			      WHERE Tsuministro.numeroPieza='P2')

---CONSULTA DE MAS DE UNA TABLA---

--31,32,33  Listar el número, nombre de cada pieza suministrada, junto a
--          la cantidad  que se aporta de dicha pieza. (APROBADO)

SELECT piez.numeroPieza,piez.Nombre,SUM(sumnis.cantidad) AS 'Cantidad'
FROM Tsuministro sumnis,Tpieza piez
WHERE sumnis.numeroPieza=piez.numeroPieza
GROUP BY piez.numeroPieza,piez.Nombre


SELECT piez.numeroPieza,piez.Nombre,SUM(sumnis.cantidad) AS 'Cantidad'
FROM Tsuministro sumnis INNER JOIN Tpieza piez ON sumnis.numeroPieza=piez.numeroPieza
GROUP BY piez.numeroPieza,piez.Nombre

--34  Listar el número y nombre de cada pieza suministrada,
--    junto al número de proveedor que la suministra y a la
--    cantidad que aporta de dicha pieza.

SELECT piez.numeroPieza,piez.Nombre,sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis,Tpieza piez
WHERE sumnis.numeroPieza=piez.numeroPieza
GROUP BY piez.numeroPieza,piez.Nombre,sumnis.numeroProv


SELECT piez.numeroPieza,piez.Nombre,sumnis.numeroProv,SUM(sumnis.cantidad) AS 'Cantidad_Piezas'
FROM Tsuministro sumnis INNER JOIN Tpieza piez ON sumnis.numeroPieza=piez.numeroPieza
GROUP BY piez.numeroPieza,piez.Nombre,sumnis.numeroProv

--35 Obtener el nombre del proveedor , de la parte que suministra 
--   y la cantidad, para los proveedores que residen en Londres (APROBADO)

SELECT  prov.Nombre,piez.numeroPieza,piez.Nombre,sumnis.cantidad
FROM Tsuministro sumnis INNER JOIN Tpieza piez 
     ON sumnis.numeroPieza=piez.numeroPieza INNER JOIN Tproveedor prov ON prov.numeroProv=sumnis.numeroProv AND prov.Ciudad='Londres'


SELECT  prov.Nombre,piez.numeroPieza,piez.Nombre,piez.color,sumnis.cantidad
FROM Tsuministro sumnis,Tpieza piez,Tproveedor prov
WHERE sumnis.numeroPieza=piez.numeroPieza AND prov.numeroProv=sumnis.numeroProv AND prov.Ciudad='Londres'


--36 Listar para cada proveedor (por nombre),la cantidad de 
--   tipos de piezas que aporta, en orden de nombre del proveedor(APROBADO)

SELECT prov.Nombre,COUNT(sumnis.numeroPieza) AS 'Tipos_Pieza'
FROM Tsuministro sumnis INNER JOIN Tpieza piez ON sumnis.numeroPieza=piez.numeroPieza 
     INNER JOIN Tproveedor prov ON sumnis.numeroProv=prov.numeroProv
GROUP BY prov.Nombre
ORDER BY prov.Nombre

SELECT prov.Nombre,COUNT(sumnis.numeroPieza) AS 'Tipos_Pieza'
FROM Tsuministro sumnis,Tpieza piez,Tproveedor prov 
WHERE sumnis.numeroPieza=piez.numeroPieza AND sumnis.numeroProv=prov.numeroProv
GROUP BY prov.Nombre
ORDER BY prov.Nombre

--CANTIDAD DE PIEZAS QUE APORTA POR CADA TIPO 

--36(B) Obtener la información del proveedor y la pieza que están 
--      situados en la misma ciudad, pero que no aparezcan proveedores
--      cuyo estado sea 20.

---ANALIZAR ESTO !!!---

SELECT *
FROM Tproveedor prov,Tpieza piez
WHERE prov.Ciudad=piez.Ciudad AND prov.estado<>20

SELECT *
FROM Tproveedor prov INNER JOIN Tpieza piez
     ON prov.Ciudad=piez.Ciudad 
WHERE prov.estado<>20

--37.Obtener todas las posibles parejas de proveedor que residan en la misma ciudad(APROBAR)

---VERIFICAR---

SELECT *
FROM Tproveedor prov1,Tproveedor prov2
WHERE prov1.Ciudad=prov2.Ciudad AND prov1.numeroProv<prov2.numeroProv

SELECT *
FROM Tproveedor prov1 INNER JOIN Tproveedor prov2
     ON prov1.Ciudad=prov2.Ciudad 
WHERE prov1.numeroProv<prov2.numeroProv

--38.Obtener los nombres de los proveedores que estén situados en la misma ciudad que el proveedor S1(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.numeroProv<>'S1' AND  prov.Ciudad IN (SELECT prov.Ciudad
                                                 FROM Tproveedor prov
                                                 WHERE prov.numeroProv='S1')

--39 Obtener la información de los proveedores que tienen en null el atributo estado(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.estado IS NULL

--40 Obtener la información de los proveedores que no tienen null en el atributo estado(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.estado IS NOT NULL

--41.Obtener los nombres de proveedores que suministran la pieza P2 (APROBADO)

SELECT prov.Nombre
FROM Tproveedor prov 
WHERE prov.numeroProv IN (SELECT sumnis.numeroProv
                          FROM Tsuministro sumnis 
						  WHERE sumnis.numeroPieza='P2')

--42.Esta es la consulta anterior pero sin necesidad de la subconsulta (APROBADO)

SELECT *
FROM Tproveedor prov INNER JOIN Tsuministro sumnis 
     ON prov.numeroProv=sumnis.numeroProv INNER JOIN Tpieza piez ON piez.numeroPieza=sumnis.numeroPieza
WHERE  piez.numeroPieza='P2'    

SELECT *
FROM Tproveedor prov,Tsuministro sumnis,Tpieza piez 
WHERE prov.numeroProv=sumnis.numeroProv AND piez.numeroPieza=sumnis.numeroPieza AND piez.numeroPieza='P2' 

--43. Obtener los nombres de proveedores que no suministran ninguna pieza (APROBADO)

SELECT *
FROM Tproveedor prov 
WHERE prov.numeroProv NOT IN (SELECT numeroProv
                              FROM Tsuministro)

--44 Obtener los nombres de proveedores que no suministran la pieza P2 (APROBADO)

SELECT *
FROM Tproveedor prov 
WHERE prov.numeroProv NOT IN (SELECT numeroProv
                              FROM Tsuministro
			      WHERE numeroPieza='P2')

--45.Obtener los números de proveedor situados en la misma ciudad que el proveedor  S1(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE numeroProv<>'S1' AND  prov.Ciudad IN (SELECT  prov.Ciudad
                                            FROM Tproveedor prov
                                            WHERE prov.numeroProv='S1')

--46 Obtener los números de proveedor que posean el mayor estado(APROBADO)

SELECT *
FROM Tproveedor prov
WHERE prov.estado=(SELECT MAX(prov.estado)
                   FROM Tproveedor prov)

--47 Listar el número de pieza de la que menos unidades aporta un proveedor(APROBADO)

SELECT sumin.numeroPieza,sumin.cantidad
FROM Tsuministro sumin 
WHERE sumin.cantidad=(SELECT MIN(sumin.cantidad)
                      FROM Tsuministro sumin) 
                      
--48 Listar el número y nombre de la pieza de la que menos unidades aporta un proveedor(APROBAR)

SELECT sumin.numeroPieza,piez.Nombre,sumin.cantidad
FROM Tsuministro sumin INNER JOIN Tpieza piez on sumin.numeroPieza= piez.numeroPieza
WHERE sumin.cantidad=(SELECT MIN(sumin.cantidad)
                      FROM Tsuministro sumin) 

SELECT sumin.numeroPieza,piez.Nombre,sumin.cantidad
FROM Tsuministro sumin,Tpieza piez
WHERE sumin.numeroPieza= piez.numeroPieza AND sumin.cantidad=(SELECT MIN(sumin.cantidad)
                                                              FROM Tsuministro sumin) 

--49 Obtener los nombres de los proveedores que suministren al menos una pieza roja

SELECT prov.numeroProv,prov.Nombre
FROM Tproveedor prov
WHERE prov.numeroProv IN (SELECT sumin.numeroProv
                          FROM Tsuministro sumin,Tpieza piez
						  WHERE sumin.numeroPieza=piez.numeroPieza AND piez.color='Rojo')

--50 Listar el número de proveedor que no aporta ni la pieza P4 ni la P5 

SELECT prov.numeroProv,prov.Nombre
FROM Tproveedor prov
WHERE prov.numeroProv NOT IN (SELECT sumin.numeroProv
                              FROM Tsuministro sumin,Tpieza piez
						      WHERE sumin.numeroPieza=piez.numeroPieza 
							        AND piez.numeroPieza='P4' OR piez.numeroPieza='P5')


--51 Eliminar de la base de datos al proveedor que posea el estado menor

DELETE
FROM Tproveedor 
WHERE estado=(SELECT MIN(PROV.estado)
               FROM Tproveedor prov)