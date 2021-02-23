
---10.1.Obtener una lista de todas las empleadas de los departamentos que empiecen por D y por E. 
---     La lista anterior debe contener información sobre el número de personal, nombre, apellido y número de teléfono.

SELECT emmpleado.nuempl,emmpleado.nombre,emmpleado.apellido,emmpleado.tlfn,departamento.numdep,departamento.nomdep
FROM temple1 emmpleado INNER JOIN tdepar2 departamento ON emmpleado.dept=departamento.numdep
WHERE emmpleado.sexo='M' AND (departamento.numdep LIKE 'D%' OR departamento.numdep LIKE 'E%')

---10.2.Obtener un listado de todos los empleados (nombre y apellido) que ganan más de 2000 al mes 
---     y que entraron en la compañía después del 1 de Enero de 1975. También se quiere la información
---     correspondiente a su código de trabajo y al número de personal de sus directores.

SELECT empleado.nombre,empleado.apellido,empleado.salario,empleado.codtra,empleado.feching,departamento.numdirec
FROM temple1 empleado  INNER JOIN tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.salario>2000 AND empleado.feching>'1975-01-01'

---10.3.Obtener una lista con el apellido, número de departamento y salario mensual de los empleados de los departamentos 
---    'A00’, ‘B01’, ‘C01’ y ‘D01’. La salida se quiere en orden descendente de salario dentro de cada departamento.

---USANDO CONDICION---
SELECT empleado.apellido,empleado.dept, empleado.salario
FROM temple1 empleado
WHERE empleado.dept='A00' OR 
      empleado.dept='B01' OR 
	  empleado.dept='C01' OR 
	  empleado.dept='D01'
ORDER BY empleado.salario DESC;

---USANDO CLAUSULA 'IN'---
SELECT empleado.apellido,empleado.dept, empleado.salario
FROM temple1 empleado
WHERE empleado.dept IN ('A00','B01','C01','D01')
ORDER BY empleado.salario DESC;

---10.4.Se pide una lista que recupere el salario medio de cada departamento junto con el número de empleados que tiene. 
---     El resultado no debe incluir empleados que tengan un código de trabajo mayor que 54, ni departamentos con menos de 
---	    tres empleados. Se quiere ordenada por número de departamento.

---TOMAR EN CUENTA TODOS LOS DEPARTAMENTOS---
SELECT departamento.numdep,COUNT(empleado.nuempl) AS 'Cantidad Empleados',AVG(empleado.salario) AS 'Salario Promedio'
FROM temple1 empleado RIGHT JOIN tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.codtra<=54
GROUP BY departamento.numdep
HAVING COUNT(empleado.nuempl)>2

---TOMAR EN CUENTA SOLO LOS DEPARTAMENTOS QUE TENGAN EMPLEADOS---
SELECT dept, AVG(salario) , COUNT(*)
FROM temple1
WHERE codtra <= 54
GROUP BY dept
HAVING COUNT(*) > 2
ORDER BY dept

---10.5.Seleccionar todos los empleados de los departamentos 'D11' y 'E11' cuyo primer apellido empiece por S.

SELECT empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado
WHERE empleado.apellido LIKE 'S%' AND (empleado.dept='D11' OR empleado.dept='E11')

---10.6.Obtener el nombre, apellido y fecha de ingreso de los directores de departamento ordenados por número de personal.

---CON JOIN---
SELECT emple_direct.nuempl,emple_direct.nombre,emple_direct.apellido,emple_direct.feching
FROM temple1 emple_direct INNER JOIN tdepar2 depart ON emple_direct.nuempl=depart.numdirec
ORDER BY CAST(emple_direct.nuempl AS INT)

---CON SUB-CONSULTA---
SELECT emple_direct.nuempl,emple_direct.nombre,emple_direct.apellido,emple_direct.feching
FROM temple1 emple_direct 
WHERE emple_direct.nuempl IN(SELECT depart.numdirec
                             FROM tdepar2 depart)
ORDER BY CAST(emple_direct.nuempl AS INT)

---10.7.Obtener un listado de las mujeres de los departamentos que empiecen por D y por E cuyo nivel de educación 
---     sea superior a la media; en este caso también ordenados por número de personal.

SELECT empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado INNER JOIN  tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.sexo='M' AND (departamento.nomdep LIKE 'D%' OR departamento.nomdep LIKE 'E%')
      AND empleado.niveduc > (SELECT AVG(temple1.niveduc) FROM temple1)
ORDER BY CAST(empleado.nuempl AS INT)

---10.8.Seleccionar todos los empleados cuyo nombre sea igual al de algunas personas del departamento D21 y cuyo 
---     código de trabajo sea diferente de todos los del E21 (la lista debe contener el número 
---     de personal, nombre, apellido, departamento y código de trabajo).

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept,empleado.codtra
FROM temple1 empleado
WHERE empleado.nombre IN (SELECT nombre FROM temple1 WHERE dept='D21') 
     AND 
	 empleado.codtra NOT IN (SELECT codtra FROM temple1 WHERE dept='E21')
	 AND empleado.dept <> 'D21';

---NOTA: Se han excluido a los del propio departamento ya que son la referencia o patrón de comparación.

---10.9.Listar los empleados que no sean directores (la información que debe aparecer es el número de personal, 
---     apellido y departamento).

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado
WHERE empleado.nuempl NOT IN(SELECT numdirec 
                             FROM tdepar2)

---VERIFICAR---
---10.10.Seleccionar parejas de empleados (de sexo opuesto) que hayan nacido el mismo día 
---     (con información acerca de apellido y fecha de nacimiento).

SELECT emple_masc.nombre+' '+emple_masc.apellido AS 'Nombre Empleada',emple_masc.fechnac,emple_femen.nombre+' '+emple_femen.apellido AS 'Nombre Empleado',emple_femen.fechnac
FROM temple1 emple_masc INNER JOIN temple1 emple_femen ON emple_masc.sexo<>emple_femen.sexo AND (emple_masc.sexo<>'F' AND emple_femen.sexo<>'M')
WHERE emple_femen.fechnac=emple_masc.fechnac
---WHERE DAY(emple_femen.fechnac)=DAY(emple_masc.fechnac)

---10.11.Obtener un listado de todos los empleados que pertenecen al mismo departamento que Tomás Soler.

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept,empleado.codtra
FROM temple1 empleado
WHERE empleado.dept IN (SELECT dept
                        FROM temple1
						WHERE nombre LIKE '%Tomas%' AND apellido LIKE '%Soler%')