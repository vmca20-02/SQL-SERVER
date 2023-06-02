
--PRACTICA SOBRE LA BASE DE DATOS DBMATRICULA

--USE DATABASE : dbMatricula

/*Consultas simples.*/

/* 1.Obtener toda la información del profesor cedula 3333.(SOLUCIONADO)*/

	SELECT Cedula,Nombre,Telefono
	FROM Tprofesor
	WHERE Cedula='3333'

/* 2.Obtener los carnets de todos los estudiantes que han matriculado cursos 
     en orden de código de materia, grupo y carnets.(SOLUCIONADO)*/

	SELECT est.Carnet,est.Nombre,matr.CodMateria,matr.Grupo
	FROM Testudiante est INNER JOIN Tmatricula matr 
		 ON matr.Carnet=est.Carnet
	ORDER BY matr.CodMateria,est.Carnet,matr.Grupo

/*3.Obtener los códigos y nombres de los cursos que tienen entre 2 y 4 créditos.(SOLUCIONADO)*/

	SELECT CodMateria,Nombre,Creditos
	FROM Tmateria
	WHERE Creditos BETWEEN 2 AND 4

/*4.Obtener la cedula y nombre de todos los profesores cuyo apellido empieza con A.(SOLUCIONADO)*/

	SELECT Cedula,Nombre,Telefono
    FROM Tprofesor
    WHERE Nombre LIKE 'a%'

/* 5.Listar la cedula, el nombre y el teléfono de todos los profesores apellido Perez.(SOLUCIONADO)*/
    
	SELECT Cedula,Nombre,Telefono
    FROM Tprofesor
    WHERE Nombre LIKE '%Perez%'

/*6.Listar la nota promedio de todos los estudiantes matriculados.(SOLUCIONADO)*/

	SELECT AVG(matr.Nota) AS 'Nota promedio de estudiantes matriculados'
	FROM Testudiante est INNER JOIN Tmatricula matr 
		 ON matr.Carnet=est.Carnet

/*7.	*Listar la cantidad total de estudiantes que efectuaron matricula.(SOLUCIONADO)*/
       
	   ---NOTA:Se toman en cuenta los carnets sin repetir,ya que existe la posibilidad de que un estudiante matricule mas de una vez 

    SELECT COUNT(DISTINCT(est.Carnet)) 'Cantidad estudiantes matriculados'
	FROM Testudiante est INNER JOIN Tmatricula matr 
		 ON matr.Carnet=est.Carnet

/*8.	Listar la suma de las notas de los estudiantes que matricularon Ciencias.(SOLUCIONADO)*/

    SELECT COUNT(est.Carnet) 'Cantidad estudiantes matriculados en Ciencias'
	FROM Testudiante est INNER JOIN Tmatricula matr 
		 ON matr.Carnet=est.Carnet 
		 INNER JOIN Tmateria mat 
		 ON mat.CodMateria=matr.CodMateria
    WHERE mat.Nombre='Ciencias'

/*9.Obtener la cantidad de cursos que tienen mas de 3 créditos.(SOLUCIONADO)*/

    SELECT CodMateria,Nombre,Creditos
    FROM Tmateria
    WHERE Creditos>3

/* Consultas de reunión.*/

/*10.Obtener una lista con la información: Nombre del profesor,  
     nombre de la materia y el grupo que imparte con la cantidad de 
     créditos de cada materia impartida.(SOLUCIONADO)*/

	SELECT prof.Nombre,mat.Nombre,grup.Grupo,mat.Creditos
	FROM Tprofesor prof INNER JOIN Tgrupo grup 
	      ON grup.CedulaProf=prof.Cedula
		  INNER JOIN Tmateria mat
		  ON mat.CodMateria=grup.CodMateria AND grup.CodMateria=mat.CodMateria

/*11. Obtener el nombre de la materia, el grupo y los nombres de los 
estudiantes matriculados con sus notas, pero únicamente deben aparecer
los estudiantes con nota mayor a 90.(SOLUCIONADO)*/

	SELECT mat.CodMateria,mat.Nombre AS 'Materia',grup.Grupo,est.Nombre AS 'Estudiante',matr.Nota
	FROM Tmateria mat INNER JOIN Tgrupo grup 
			ON grup.CodMateria=mat.CodMateria
			INNER JOIN Tmatricula matr 
			ON matr.Grupo=grup.Grupo AND grup.CodMateria=matr.CodMateria
			INNER JOIN Testudiante est
			ON est.Carnet=matr.Carnet
	WHERE matr.Nota>90
	ORDER BY mat.CodMateria

	---DE ESTA MANERA VERIFICO QUE MI QUERY PREVIO ES CORRECTO---
	SELECT matr.CodMateria,COUNT(*) AS 'Cantidad'
	FROM Tmatricula matr
	WHERE matr.Nota>90
	GROUP BY matr.CodMateria

/*12.Obtener la lista de los nombres de los estudiantes que reciben 
    alguna lección con el profesor Alvarez y que hallan perdido el curso.(SOLUCIONADO)*/

    SELECT est.Carnet,est.Nombre AS 'Estudiante',mat.CodMateria,grup.Grupo,matr.Nota,prof.Nombre AS 'Profesor'
	FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
	     INNER JOIN Tgrupo grup ON grup.Grupo=matr.Grupo AND grup.CodMateria=matr.CodMateria
		 INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
		 INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
	WHERE matr.Nota<70 AND prof.Nombre='Alvarez'

/* 13.	Obtener el código de la materia, el nombre y la cantidad 
        de estudiantes matriculados en total en cada materia.(SOLUCIONADO)*/

    SELECT mat.CodMateria,mat.Nombre,COUNT(matr.Carnet) AS 'Estudiantes Matriculados'
	FROM Tmatricula matr INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
		 INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
	GROUP BY mat.CodMateria,mat.Nombre
        
/*14 Efectuar la consulta anterior pero totalizando por grupo.(SOLUCIONADO)*/

    SELECT matr.Grupo,COUNT(matr.Carnet) AS 'Cantidad Estudiantes'
	FROM Tmatricula matr
	GROUP BY matr.Grupo

/*15.Obtener el nombre de materia, el grupo, el total de  matriculados para las materias que imparte el profesor Álvarez y cuyo código 
     de curso empieza con "A".(SOLUCIONADO)*/

	SELECT mat.CodMateria,mat.Nombre,COUNT(matr.Carnet) AS 'Estudiantes Matriculados'
	FROM Tmatricula matr INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
		 INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
		 INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	WHERE prof.Nombre='Alvarez' AND mat.CodMateria LIKE 'A%'
	GROUP BY mat.CodMateria,mat.Nombre

/*16.Obtener el nombre del estudiante y la carrera de los estudiantes
     que matricularon Ingles.(SOLUCIONADO)*/

	---SI TENGO SOLO EL NOMBRE DEL CURSO Y NO SU CODIGO---
	SELECT est.Nombre AS 'Estudiante',est.Carrera,mat.Nombre AS 'Material Matriculada'
    FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
         INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
	     INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
    WHERE mat.Nombre LIKE 'Ingles'

	---SI CONOZCO EL CODIGO DEL CURSO DE INGLES---
	SELECT est.Nombre AS 'Estudiante',est.Carrera
    FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
    WHERE matr.CodMateria='D20'

/* 17.Obtener cantidad de créditos que poseen los cursos impartidos 
      por cada  profesor(por cédula y nombre).(SOLUCIONADO:CONFIRMAR)*/

   	 ---SE SUMAN LOS CREDITOS DE CADA GRUPO IMPARTIDO POR EL PROFESOR---
    SELECT prof.Cedula,prof.Nombre,SUM(mat.Creditos) AS 'Total creditos de cursos empartidos'
	FROM Tmateria mat INNER JOIN Tgrupo grup ON grup.CodMateria=mat.CodMateria
	     INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	GROUP BY prof.Cedula,prof.Nombre

    ---SE SUMAN LOS CREDITOS DE SOLO LOS CURSOS IMPARTIDOS DEL PROFESOR---
    SELECT prof.Cedula,prof.Nombre,SUM(mat.Creditos) AS 'Total creditos de cursos empartidos'
	FROM Tmateria mat INNER JOIN (SELECT DISTINCT(CodMateria),CedulaProf
	                              FROM Tgrupo grup) grup ON grup.CodMateria=mat.CodMateria
	     INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	GROUP BY prof.Cedula,prof.Nombre

/*Consultas con subconsulta.*/

/*18.	Obtener nombres de las materias y créditos de los cursos 
        impartidos por el profesor cedula 1111.(SOLUCIONADO)*/

	---SUB QUERY---
	 SELECT mat.CodMateria,mat.Nombre,mat.Creditos
	FROM Tmateria mat
	WHERE mat.CodMateria IN(SELECT grup.CodMateria
	                        FROM Tgrupo grup
							WHERE grup.CedulaProf IN(SELECT prof.Cedula 
							                         FROM Tprofesor prof
													 WHERE prof.Cedula='1111'))

	---REGULAR QUERY---
	SELECT mat.CodMateria,mat.Nombre,mat.Creditos
	FROM Tmateria mat INNER JOIN Tgrupo grup ON grup.CodMateria=mat.CodMateria
	     INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	WHERE prof.Cedula='1111'

  

/*19.	Obtener el nombre de los estudiantes matriculados en cursos de 
        más de 3 créditos.(SOLUCIONADO)*/

    ---REGULAR QUERY---
	SELECT DISTINCT(est.Carnet),est.Nombre
	FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
		  INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
		  INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
	WHERE mat.Creditos>3

	---SUB QUERY---
    SELECT est.Carnet,est.Nombre
    FROM Testudiante est
	WHERE est.Carnet IN(
                     SELECT matr.Carnet
		             FROM Tmatricula matr 
					 WHERE matr.Grupo IN(SELECT grup.Grupo 
					                     FROM Tgrupo grup
										 WHERE grup.CodMateria IN(SELECT mat.CodMateria 
										                          FROM Tmateria mat
																  WHERE mat.Creditos>3)))

/*20	Obtener el nombre de los estudiantes matriculados en cursos de 
        más de 3 créditos que imparta el profesor Perez.(SOLUCIONADO:SE PODRIA VERIFICAR SI LA SUB-CONSULTA ESTA BIEN)*/

			---REGULAR QUERY---
	SELECT DISTINCT(est.Carnet),est.Nombre
	FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
		    INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
			INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
			INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	WHERE mat.Creditos>3 AND prof.Nombre LIKE 'Arce'

	---SUB QUERY---
	SELECT est.Carnet,est.Nombre
	FROM Testudiante est
	WHERE est.Carnet IN(
						SELECT DISTINCT(matr.Carnet)
						FROM Tmatricula matr INNER JOIN Tgrupo grup ON grup.CodMateria=matr.CodMateria AND grup.Grupo=matr.Grupo
						WHERE grup.CodMateria IN(SELECT CodMateria
												FROM Tmateria mat
												WHERE mat.Creditos>3) AND grup.CedulaProf IN (SELECT prof.Cedula
																							  FROM Tprofesor prof
																							  WHERE prof.Nombre LIKE 'Arce')) 

/*21.Obtener el carnet de los estudiantes y el código del curso donde 
     obtuvieron una nota mayor que el promedio general de todas las
     notas obtenidas por todos los estudiantes matriculados.(SOLUCIONADO)*/

    SELECT est.Carnet,est.Nombre,matr.CodMateria,matr.Nota
	FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
	WHERE matr.Nota>(SELECT AVG(matr.Nota)
	                 FROM Tmatricula matr)
  
/*22.	Obtener el carnet y nombre del estudiante que obtuvo 
         la nota mas baja de toda la universidad.(SOLUCIONADO)*/

	SELECT est.Nombre,est.Carnet,matr.Nota
    FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
    WHERE matr.Nota=(SELECT MIN(matr.Nota)
                     FROM Tmatricula matr)

/*23.	Obtener la lista de nombres de estudiantes que matricularon a la 
        vez el curso A20 y el A21.(SOLUCIONADO)*/
	
   SELECT est.Carnet,est.Nombre AS 'Estudiante',COUNT(est.Carnet) AS 'Cantidad'
   FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
   WHERE matr.CodMateria IN('A20','A21')
   GROUP BY est.Carnet,est.Nombre
   HAVING  COUNT(est.Carnet)=2               
   ORDER BY est.Nombre
   
   --VERSION CON SUB-CONSULTA (PARA MOSTRAR INFORMACION)
  SELECT est.Carnet,est.Nombre AS 'Estudiante'
  FROM  Testudiante est
  WHERE est.Carnet IN(SELECT matr.Carnet
                      FROM Tmatricula matr 
                      WHERE matr.CodMateria IN('A20','A21')
                      GROUP BY  matr.Carnet
                      HAVING  COUNT(matr.Carnet)=2)               
		      
/*24.	Obtener la lista de nombres de estudiantes que cursen Ingles y
       están en la carrera de matemática.(SOLUCIONADO:CONFIRMAR)*/


 SELECT est.Carnet,est.Nombre AS 'Estudiante'
 FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
      INNER JOIN Tgrupo grup ON grup.Grupo=matr.Grupo AND grup.CodMateria=matr.CodMateria
      INNER JOIN Tmateria mat ON mat.CodMateria=grup.CodMateria
 WHERE mat.Nombre IN ('Ingles','Matematica')
 GROUP BY est.Carnet,est.Nombre
 HAVING COUNT(mat.CodMateria)=2

	

---Consultas con funciones agregadas---

/*25.Obtener la nota promedio por código de materia.(SOLUCIONADO) */

	SELECT matr.CodMateria,AVG(matr.Nota) AS 'Nota Promedio'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria

/*26.Obtener la cantidad de estudiantes matriculados por código de materia.(SOLUCIONADO)*/

    SELECT matr.CodMateria,COUNT(matr.Carnet) AS 'Estudiantes matriculados'
    FROM Tmatricula matr
    GROUP BY matr.CodMateria

/*27.	Obtener la nota mínima por cada estudiante.(SOLUCIONADO)*/

    SELECT matr.Carnet,est.Nombre,MIN(matr.Nota) AS 'Nota Minima'
    FROM Tmatricula matr INNER JOIN Testudiante est ON est.Carnet=matr.Carnet
    GROUP BY matr.Carnet,est.Nombre

/*28	Obtener la nota mínima por cada estudiante pero que aparezcan 
        únicamente los que tienen un mínimo mayor a 70.(SOLUCIONADO)*/

	SELECT matr.Carnet,est.Nombre,MIN(matr.Nota) AS 'Nota Minima'
    FROM Tmatricula matr INNER JOIN Testudiante est ON est.Carnet=matr.Carnet
    GROUP BY matr.Carnet,est.Nombre
	HAVING MIN(matr.Nota)>70

/*29 Obtener el promedio de las notas de los cursos cuyo
       código empieza con A, pero que aparezcan únicamente aquellos
       cursos cuya nota promedio sea mayor a 80.(SOLUCIONADO)*/

	SELECT matr.CodMateria,AVG(matr.Nota) AS 'Nota'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria
	HAVING matr.CodMateria LIKE 'A%' AND AVG(matr.Nota)>80

/*30 Obtener la cantidad  de grupos impartidos por cada profesor, pero de manera que
     únicamente aparezcan aquellos que imparten más de 2 grupos.(SOLUCIONADO)*/

	SELECT prof.Cedula,prof.Nombre,COUNT(grup.Grupo) AS 'Grupos impartidos'
	FROM Tgrupo grup INNER JOIN Tprofesor prof ON prof.Cedula=grup.CedulaProf
	GROUP BY prof.Cedula,prof.Nombre
	HAVING COUNT(grup.Grupo)>2

/*31	Nota promedio por código de curso , pero únicamente de los
        cursos que tienen mas de un 80 como promedio.(SOLUCIONADO)*/
    
	SELECT matr.CodMateria,AVG(matr.Nota) AS 'Nota Promedio'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria
	HAVING AVG(matr.Nota)>80

/*32	Nota promedio por código de curso , pero únicamente de los
        cursos que tienen mas de un estudiante matriculado.(SOLUCIONADO)*/

	SELECT matr.CodMateria,AVG(matr.Nota) AS 'Nota Promedio',COUNT(matr.Carnet) AS 'Cantidad Estudiantes'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria
	HAVING COUNT(matr.Carnet)>1

/*33.	Cantidad de cursos matriculados por cada carnet de estudiante.(SOLUCIONADO)*/

	SELECT matr.Carnet,COUNT(matr.CodMateria) AS 'Cantidad Cursos' 
	FROM Tmatricula matr
	GROUP BY matr.Carnet

/*34.	Promedio obtenido por cada carnet de estudiante , únicamente los estudiantes
        que tienen un promedio menor a 70.(SOLUCIONADO)*/

	SELECT matr.Carnet,AVG(matr.Nota) AS 'Promedio'
	FROM Tmatricula matr
	GROUP BY matr.Carnet
	HAVING AVG(matr.Nota)<70

/*Acciones varias sobre la base de datos.
35.  Eliminar el grupo 01 de Ciencias de la Base de datos y pasar a los estudiantes 
     matriculados en dicho grupo al grupo 02 de Ciencias*/

/*36.	Agregar 10 puntos en la nota a los estudiantes que 
        hallan matriculado Biología.(SOLUCIONADO)*/

    UPDATE matr
	SET matr.Nota=matr.Nota+10
	FROM Testudiante est INNER JOIN Tmatricula matr ON matr.Carnet=est.Carnet
	WHERE matr.CodMateria IN(SELECT mat.CodMateria
							 FROM Tmateria mat
							 WHERE mat.Nombre LIKE '%biologia%')

/*37.	Agregar en la base de datos al profesor Jiménez, quien tiene un 
        numero de cedula 4444 y su teléfono es 4425478.(SOLUCIONADO)*/

	INSERT INTO Tprofesor(Cedula,Nombre,Telefono) VALUES('9999','Jiménez',4425478);

/*38.	Cambiar el teléfono del profesor Pérez cambiándolo por el 2356255.(SOLUCIONADO)*/

	UPDATE prof
	SET prof.Telefono=24875429
	FROM Tprofesor prof
	WHERE prof.Nombre LIKE '%Jiménez%'

/* 39.	Modificar la tabla estudiantes agregándole el campo 
        telefono el cual es numérico.(SOLUCIONADO)*/

	ALTER TABLE Testudiante ADD Telefono NUMERIC

/*40.  Pasar a los estudiantes cuyo apellido termine en "A" 
       matriculados en la carrera de Química a Biología.(SOLUCIONADO)*/

	UPDATE est
	SET est.Carrera='Biología'
	FROM Testudiante est
	WHERE est.Nombre LIKE 'R%' AND est.Carrera LIKE '%Química%'

/*41.	Listar el código de materia, el grupo y el promedio de nota, 
        pero únicamen para los cursos que tuvieron un promedio menor a 70.(SOLUCIONADO)*/

	SELECT matr.CodMateria,matr.Grupo,AVG(matr.Nota) AS 'Nota Promedio'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria,matr.Grupo
	HAVING AVG(matr.Nota)<70

/*42.	Listar el código de materia, el grupo y el total de estudiantes 
        matriculados para los cursos que matricularon en total 
        2 ó más estudiantes.(SOLUCIONADO)*/

    SELECT matr.CodMateria,matr.Grupo,COUNT(matr.Carnet) AS 'Estudiantes Matriculados'
	FROM Tmatricula matr
	GROUP BY matr.CodMateria,matr.Grupo
	HAVING COUNT(matr.Carnet)>=2

/*43.	Agregar a la tabla profesores el campo dirección el cual es de 30 caracteres.(SOLUCIONADO)*/

   ALTER TABLE Tprofesor ADD Direccion VARCHAR(30);

/*44.	*Agregar un grupo mas de ingles que lo impartirá el profesor Álvarez.(SOLUCIONADO)*/

  INSERT INTO Tgrupo(CodMateria,Grupo,CedulaProf) VALUES ('D20',2,3333);
