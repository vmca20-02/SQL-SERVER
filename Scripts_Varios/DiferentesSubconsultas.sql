
---CASOS EN LOS QUE SE PUEDEN USAR SUBCONSULTAS---

--PARA USAR UNA FUNCION ESCALAR SIN NECESITAD DE AGRUPAR

--ESTO SE PUEDE LLEGAR A OCUPAR EN ALGUNOS ESCENARIOS
SELECT numeroProv,(SELECT SUM(cantidad) FROM Tsuministro) AS [CANT_SUM]
FROM Tsuministro


--SE PUEDE CREAR UNA SUBCONSULTA DE UNA CONSUTA PREVIAMENTE CREADA
SELECT temp.numeroProv
FROM
(SELECT prov.numeroProv
FROM Tsuministro s,Tpieza p,Tproveedor prov
WHERE p.numeroPieza=s.numeroPieza AND prov.numeroProv=s.numeroProv AND p.Ciudad=prov.Ciudad AND prov.estado=20) temp
