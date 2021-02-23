
/* SENTENCIAS DE CONSULTA SQL (SELECT).


   La estructura b�sica de una sentencia de consulta en SQL 
   consta de tres cl�usulas:  SELECT ,  FROM  y  WHERE.

   SELECT : Indica los atributos o campos de la tabla(s)
            que se desean listar en una consulta.
   FROM	  : Indica la(s) tabla(s) de las que se extraer� la consulta.
   WHERE  : Indica las condiciones que deben cumplir los atributos para
            que los registros respectivos aparezcan en la consulta.

   Formato:

			SELECT A1 , A2 , A3, ........An
			FROM  T1, T2, ........Tn
			WHERE   Condici�n.

   - Cada A representa un atributo.
   - Cada T una tabla.
   - La condici�n indica la lista de condiciones que deben cumplir los
     atributos para aparecer en el resultado de la consulta

   La lista de atributos puede sustituirse por un (*)  si se desea
   listar todos los atributos de la(s) tabla(s) que aparecen en
   la cl�usula FROM.

   EJEMPLOS:


   1 Listar el n�mero y nombre de cada proveedor */

     		Select numeroProv, nombre
        	from Tproveedor;

   /* 2 Si en la lista de selecci�n se utiliza el *
        se estar� indicando que se desea listar todos los atributos
        de la tabla.
        Ejemplo:
        Listar una copia de la tabla  de Proveedores completa.*/

     		Select *
        	from Tproveedor;

   /* 3 Al agregar la cl�usula Top n , listar� los n primeros registros 
        de la tabla seleccionada  */


			Select top 3 * 
			from Tproveedor


			Select top 3 numeroPieza, nombre 
			from Tpieza


  /* 4 Es importante visualizar la tabla de la cual se originan 
       los datos. Por ejemplo, si se desea obtener los n�meros de 
       proveedor que aportan piezas, esta consulta debe basarse en 
       la tabla Tsuministro, ya que en la tabla Tproveedor, se 
       encuentran todos los proveedores, aporten o no piezas en el 
       momento de la consulta, mientras que en la tabla Tsuministro, 
       aparecen �nicamente los provedorees de los que ya se registr� 
       que aportan alguna pieza 

       Ejemplo: Listar los n�meros de  proveedor que aportan alguna pieza */
     
			Select numeroProv
			From Tsuministro;

  /* 5 Como en la tabla Tsuministro, el n�mero de proveedor aparece 
       tantas veces como piezas aporta, en la consulta, aparecer�n
       n�meros de proveedor repetidos. 
       Para evitar esto, es necesario incluir la cl�usula DISTINCT 
       que eliminar� los duplicados en las consultas.  */

        	Select  distinct  numeroProv
		From Tsuministro; 

  /* 6 Es importante destacar que la cl�usula distinct trabaja
       sobre el registro de la salida completo, es decir, 
       �nicamente descartar� de la salida aquellas ocurrencias
       de registros completo que ya se hayan listado.

       Ejemplo: Listar el n�mero de proveedor y de la pieza
                que aporta cada uno */

       		Select  distinct  numeroProv, numeroPieza
		From Tsuministro; 

  /* 7 Como resultado de esta consulta no se descart� ningun registro
       duplicado, ya que la combinaci�n de los campos numeroProv y 
       numeroPieza no se repite.
       Ahora observe lo que sucede con la siguiente consulta:

       Listar los n�meros de proveedor y la cantidad que aportan de 
       cada pieza */

  	           Select  distinct  numeroProv, cantidad
		   From Tsuministro; 
 
    /* Esta consulta genera 2 registros menos que la anterior, ya que 
       la combinaci�n de numeroProv y cantidad se repite en los 
       siguientes registros:
		S1	P2	200
		S1	P4	200
		S1	P5	100
		S1	P6	100
      La consulta listar� �nicamente una ocurrencia de cada combinaci�n
      de n�meroProv y cantidad repetida. */

 /* CONSULTAS CONDICIONADAS

    La cl�usula WHERE en una consulta, permite agregar condiciones
    que deber�n cumplir los atributos, para que el registro del que 
    forman parte aparezca en la salida. Es decir, la cl�usula WHERE
    realiza una selecci�n horizontal de los registros de la tabla.
    Se dice que la cl�usula SELECT realiza una selecci�n vertical.
    Para construir las condiciones, se requiere utilizar operadores
    l�gicos y operadores relacionales

    OPERADORES L�GICOS Y RELACIONALES

    Operadores relacionales o de comparaci�n:

                         menor que           <
                         mayor que           > 
                         menor o igual que   <=
                         mayor o igual que   >= 
                         diferente a         <> .

    Operadores l�gicos:
                         and (y)
                         or  (�)
                         not (negaci�n)
      
   8 Ejemplo:  Obtener los nombres de proveedor y ciudad
                 para los proveedores de Paris con estado = 10.*/

		Select nombre, ciudad, estado
		From Tproveedor
		where ciudad = 'Paris' and
                      estado = 10


 /* CL�USULA  BETWEEN  y   NOT BETWEEN: esta cl�usula es �til cuando
    se tiene una condici�n que determine que los valores de alg�n
    atributo deban encontrarse dentro o fuera de un rango definido.

  9 Ejemplo: Encontrar los n�meros de proveedor y de pieza
               de las que se provee una cantidad mayor o igual a 100 
               pero menor o igual a 300 */

           Select distinct numeroProv,numeroPieza,cantidad
	       From  Tsuministro
	       Where cantidad between 200 and 300;


/*   OPERADORES PARA COMPARACIONES DE CADENAS DE CARACTERES


     Es posible realizar consultas que apliquen condiciones a los 
     campos alfanum�ricos. Para estos campos, se puede 
     establecer condiciones que realicen una comparaci�n exacta 
     de la cadena, pero tambi�n SQL nos permite realizar consultas
     que permitan comparar las cadenas con aproximaciones.
     La diferenciaci�n entre may�sculas y min�sculas depende de la
     configuraci�n que presente en el momento el DBMS.

 10 Ejemplo: Obtener la informaci�n de todos los 
               proveedor que tengan el apellido 'Salazar'.   */

			Select Nombre
			From Tproveedor
			Where nombre =  'Salazar';

  /* Esta consulta analiza que en el campo nombre aparezca
     la hilera 'Salazar' estrictamente igual a como se especific�

     Tambi�n podemos hacer comparaciones por aproximaci�n, utilizando
     los siguientes s�mbolos:


	%  Este s�mbolo representa cualquier cadena de caracteres.
	_    Este s�mbolo representa cualquier caracter.


 11 Ejemplo: Obtener todos los nombres de Proveedor que tengan la 
               s�laba 'al' dentro de su apellido.   */
   
                        Select Nombre
   		        From Tproveedor
			Where nombre like  '%al%';

 /*12 Ejemplo: Obtener todos los nombres de Pieza que finalicen 
              con la letra 'o'.   */
   

                         Select Nombre
  			 From Tpieza
			 Where nombre like  '%o';


 /*13 Ejemplo: Obtener todos los nombres de proveedor que habitan
               en una ciudad cuyo nombre tiene como
               tercera letra la 'n'.*/

			Select Nombre, ciudad
			From Tproveedor
			Where Ciudad like  '__n%' ;

/* CONSULTAS ORDENADAS

  Las consultas realizadas no se desplegar�n en ning�n orden espec�fico
  a no ser que el usuario lo indique por medio de la cl�usula ORDER BY. 
  El ordenamiento puede ser ascendente si se indica (asc) o descendente 
  indicando las cl�usula (desc).

 14 Ejemplo: Obtener la informaci�n de los proveedores en orden
               descendente de estado.  */

			Select *
			From Tproveedor
			Order by estado desc

 /*15 Ejemplo: Obtener la informaci�n de las piezas en orden 
               ascendente de peso.  */

			Select *
			From Tpieza
			Order by peso asc

      /*Tambi�n podemos ordenar la salida por 2 o m�s campos.*/

 /*16 Ejemplo: Obtener la informaci�n de los proveedores en orden
               ascendente de ciudad; y de manera que,los proveedores
               situados dentro de la misma ciudad aparezcan en
               orden descendente de estado.    */

			Select *
			From Tproveedor
			Order by ciudad asc,estado desc


/*  FUNCIONES INTEGRADAS:

   SQL proporciona varias funciones integradas, para mejorar su nivel 
   b�sico de recuperaci�n.
   Exceptuando el COUNT(*), cada una de estas funciones opera sobre el
   conjunto de valores de una columna de alguna tabla, por tanto se
   llaman tambi�n Funciones de agregaci�n. 
   Son las siguientes:

   COUNT : Calcula la cantidad de valores indicados. 
   SUM	 : Calcula la suma de los valores de la columna indicada.
   AVG	 : Calcula el promedio de los valores de la columna indicada.
   MAX	 : Obtiene el valor m�s grande de la columna indicada.
   MIN	 : Obtiene el valor m�s peque�o de la columna  indicada.

   Para SUM y AVG la columna comprendida debe ser num�rica.

   La funci�n COUNT determina la cantidad de ocurrencias de 
   una columna indicada, tambi�n es utilizada para contar la cantidad
   de tuplas en una relaci�n 	 */


/*17  	Listar cuantos proveedores viven en Par�s.  */

			Select Count (*) as [Cantidad de Proveedores]
			from Tproveedor
			where Ciudad = 'Paris' ;

/*18    Listar la cantidad de piezas rojas:   */

			Select Count ( *)
			from Tpieza
			where color = 'rojo';
			
/*19	Obtener la cantidad de proveedores que aportan la pieza P2.  */

				Select count(*) 
				from Tsuministro  
				Where numeroPieza = 'P2' ;

/*20	Obtener la cantidad total suministrada de la pieza P2  */

				Select SUM(cantidad)
				from Tsuministro
				where numeroPieza = 'P2' ;


/*21	Obtener el promedio de las cantidades de piezas que aportan
        los proveedores.  */

			Select AVG(cantidad)
			From Tsuministro 
				

/*22	Obtener el mayor peso de una pieza  */

			Select MAX(peso)
			from Tpieza 

/*23	Obtener la cantidad m�nima de piezas que aporta un proveedor  */

			Select  MIN(cantidad)
			From Tsuministro

/*24	Listar la cantidad de proveedores que aportan piezas  */

	Select count (distinct numeroProv) [Cantidad de proveedores] 
        from Tsuministro


/*  AGRUPAMIENTO DE DATOS:  Group By

    Las funciones de agregaci�n las podemos utilizar para calcular o
    subtotalizar valores para grupos de tuplas o registros. 

    Ejemplo:   */

/*25  Obtener el n�mero de proveedor y la suma total de piezas que aporta.*/

			Select  numeroProv, sum(cantidad) as  cantidad
			From Tsuministro
			Group by numeroProv
			
/*	El atributo de agrupaci�n debe aparecer entre los campos 
        del select y no deben aparecer m�s atributos en el select,
        que no sean los de la agrupaci�n.
        Dado que el campo en la consulta que resultar�  de la funci�n
        de agregaci�n no tiene un nombre en la tabla, es posible
        indicar al SQL, el nombre con el que debe aparecer la
        dicha columna en la tabla resultante
	
26	Obtener la cantidad de piezas diferentes que aporta cada
        proveedor  */

        		Select numeroProv, count(*) as Cantidad
			From Tsuministro
			Group by numeroProv

/*27	Si el t�tulo que le deseamos poner a la columna contiene m�s de
        una palabra debemos encerrarla entre par�ntesis cuadrados, as�:          */

            Select numeroProv, count(*) as [Cantidad de tipos de Piezas]
            From Tsuministro
            Group by numeroProv
                       

/*  CONDICIONAMIENTO DE LOS GRUPOS  (Having)

     A veces es necesario incluir una condici�n que se aplique a los
     grupos y no a las tuplas individuales. 
     Para esto se utiliza la cl�usula Having

     Esta cl�usula se aplica despu�s de la formaci�n de los grupos y 
     as� se listar�n �nicamente los grupos que cumplan con la condici�n 
     indicada por el Having.

     Podemos decir que: 
          "El having es a los grupos lo que el where es a las tuplas"

28 Listar la cantidad de piezas que aporta cada proveedor
     pero sin tomar en cuenta al proveedor S2  */

         Select numeroProv, sum(cantidad)
         from tsuministro
         where numeroProv <> 'S2'
         group by numeroProv
           
/*  En la sentencia anterior el where se aplica a todas las tuplas antes
    de calcular la suma de las cantidades por proveedor.
    En la sentencia siguiente, el having se aplica a los grupos una 
    vez subtotalizados  */


/*29 Listar para cada proveedor la suma de todas las piezas suministradas,
     pero de manera que �nicamente aparezcan los que aportan en total m�s
     de 500 piezas */

			Select   numeroProv, sum(cantidad)
			From     Tsuministro
			Group by numeroProv
			Having   sum(cantidad)> 500


/*30 Listar para cada pieza, la cantidad total que de ella aportan
     entre todos los proveedores, pero, de manera que aparezcan 
     �nicamente las piezas de las que se aporta m�s de 600 piezas 
     en total  */

			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
			Group by numeroPieza
			Having   sum(cantidad)> 600



/*30 Listar para cada pieza, la cantidad total que de ella aportan
     entre todos los proveedores, pero, de manera que aparezcan 
     �nicamente las piezas con n�mero mayor a P2.

     Observe las siguientes opciones de soluci�n: */

			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
                        where   numeroPieza > 'P2'
			Group by numeroPieza


			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
			Group by numeroPieza
			Having   numeroPieza > 'P2'


/* A pesar de que ambas soluciones generan la misma salida, por factores
   de rendimiento, es preferible, utilizar la cla�sula WHERE en lugar de
   la cla�sula HAVING, ya que, con el WHERE, el sistema no requiere
   calcular la suma de las cantidades para las piezas P1 y P2, 
   pues �stas se descartan antes de totalizar por pieza; mientras que,
   con el HAVING, se deber�n calcular los totales para todas las piezas,
   y luego, se descartan de la salida los registros correspondientes a
   las piezas P1 y P2, a pesar de que ya se tuvo que realizar todo el 
   proceso de c�lculo de la suma de las cantidades para ambas piezas. */



 /*  CONSULTAS DE M�S DE UNA TABLA:

     Al realizar una consulta es posible obtener datos de diferentes 
     tablas, lo cual, es posible gracias al operador de reuni�n de 
     tablas de acuerdo a alg�n atributo en com�n. 

     NOTA IMPORTANTE:
     Es indispensable indicar en la sentencia WHERE, los campos que 
     tienen en com�n las tablas, de lo contrario, se producir� un 
     producto cartesiano de tablas, y se generar�n tuplas por cada 
     combinaci�n posible de los registros de una tabla con la otra
     Ejemplos:  */

/*31   Listar el n�mero, nombre de cada pieza suministrada, junto a
       la cantidad  que se aporta de dicha pieza. */

	Select numeroProv, nombrecantidad
        from   Tsuministro , Tpieza
	where  Tsuministro.numeroPieza = Tpieza.numeroPieza ;


/*  Note que al usar m�s de una relaci�n en la consulta, se indica:
	
 			Nombre-Relaci�n.Nombre-Atributo

    De esta forma se  evita ambig�edad en casos en que los atributos
    aparezcan con el mismo nombre en las diferentes relaciones.
    El uso del nombre de la tabla junto al atributo, es obligatorio
    �nicamente cuando el nombre del atributo se repite en las
    tablas involucradas en la consulta
 
32  Dado que puede resultar tedioso el estar digitando por cada atributo 
      el nombre de la tabla a la que pertenece, SQL permite sustituir
      los nombres de las tablas por seud�nimos o alias. */

		Select  A.numeroPieza , Pr.Ciudad
		from    Tsuministro   A , Tproveedor  Pr
		where   A.numeroProv = Pr.numeroProv ;

/*33  Aun es posible eliminar la palabra 'as' de la siguiente forma: */

		Select  A.numeroPieza , Pr.Ciudad
		from    Tsuministro   A , Tproveedor  Pr
		where   A.numeroProv = Pr.numeroProv ;






/* REUNI�N DE M�S DE 2 TABLAS

   Es posible consultar campos de varias tablas siempre que sea
   posible unirlas por alg�n atributo que tengan en com�n.*/
 

/*34   Listar el n�mero y nombre de cada pieza suministrada,
       junto al n�mero de proveedor que la suministra y a la
       cantidad que aporta de dicha pieza. */

 Select Tproveedor.numeroProv, Tproveedor.nombre, Tpieza.numeroPieza , Tpieza.nombre, cantidad
 from   Tsuministro , Tproveedor, Tpieza
 where  Tsuministro.numeroProv = Tproveedor.numeroProv   AND
        Tsuministro.numeroPieza = Tpieza.numeroPieza


/* Es posible a las reuniones de tablas aplicarles una selecci�n
   Ejemplo: 
 
35  Obtener el nombre del proveedor , de la parte que suministra 
      y la cantidad, para los proveedores que residen en Londres*/

     Select Tproveedor.nombre, Tpieza.Nombre, Tsuministro.cantidad
     From   Tproveedor, Tpieza, Tsuministro
     Where  Tsuministro.numeroPieza = Tpieza.numeroPieza and 
            Tsuministro.numeroProv = Tproveedor.numeroProv  and
	     Tproveedor.ciudad = 'Londres'


/* Tambi�n es posible, utilizar funciones integradas y agrupaciones
   sobre la uni�n de tablas*/

/*36  Listar para cada proveedor (por nombre),la cantidad de 
      tipos de piezas que aporta, en orden de nombre del proveedor */


Select Tsuministro.numeroProv, nombre, count(*) [Cantidad de tipos de Piezas]
From Tsuministro, Tproveedor
where tsuministro.numeroProv = Tproveedor.numeroProv
Group by tsuministro.numeroProv,nombre
Order by nombre




/*36 Obtener la informaci�n del proveedor y la pieza que est�n 
     situados en la misma ciudad, pero que no aparezcan proveedores
     cuyo estado sea 20.*/

		Select Tproveedor.*, Tpieza.*
		from   Tproveedor  , Tpieza 
		where  Tproveedor.ciudad = Tpieza.ciudad  and 
                       Tproveedor.estado <> 20 

/* Observe que en este caso las piezas no se estan uniendo con el 
   proveedor que las aporta sino que se est�n uniendo con el proveedor 
   que habita en la misma ciudad


   REUNI�N DE UNA TABLA CONSIGO MISMA

37  Obtener todas las posibles parejas de proveedor que residan en 
      la misma ciudad  */

      Select Tprov1.nombre, Tprov1.ciudad, Tprov2.Nombre, Tprov2.ciudad
      from   Tproveedor Tprov1, Tproveedor Tprov2
      Where  Tprov1.ciudad = Tprov2.ciudad   and
       Tprov1.numeroProv < Tprov2.numeroProv   /*ELIMINA LOS REPETIDOS EN CUALQUIER ORDEN*/

/*  La l�nea que indica	Tprov1.numeroProv < Tprov2.numeroProv se
    incluye para eliminar  las parejas repetidas

38	Obtener los nombres de los proveedores que est�n situados en 
        la misma ciudad que el proveedor S1*/

  Select Tprov1.nombre, Tprov1.ciudad, Tprov2.nombre, Tprov2.ciudad
  From   Tproveedor Tprov1, Tproveedor Tprov2
  Where  Tprov1.ciudad = Tprov2.ciudad   and
         Tprov1.numeroProv < Tprov2.numeroProv  and
	 Tprov1.numeroProv = 'S1'

/*   RECUPERACI�N DE DATOS CON NULL (NULOS)

     Para detectar la presencia o ausencia de nulos se utiliza una 
     condici�n especial.

39 Obtener la informaci�n de los proveedores que tienen en null el atributo estado*/

	Select *
	From Tproveedor
	Where estado is null

/*40 Obtener la informaci�n de los proveedores que no tienen null 
     en el atributo estado  */
	
	Select *
	From   Tproveedor
	Where  estado is not null


/*  RECUPERACI�N DE DATOS CON SUBCONSULTA:  

    Una subconsulta es una expresi�n SELECT anidada dentro de 
    otra expresi�n SELECT.  

    CLA�SULA 'IN' Y  'NOT IN'  */

/*41	Obtener los nombres de proveedores que suministran la pieza
         P2  */

  		SELECT numeroProv, nombre
		FROM  Tproveedor
		WHERE numeroProv  IN
					( SELECT  numeroProv
					  FROM  Tsuministro
					  Where  numeroPieza = 'P2');


/*   Para evaluar estas consultas, el sistema eval�a primero la 
     subconsulta anidada, (interior),esa subconsulta produce como 
     resultado una tabla de valores donde se eval�a la consulta 
     exterior. 
42  La subconsulta anterior podr�a tambi�n escribirse como una
      consulta de reuni�n de la siguiente forma:  */

      SELECT  Tproveedor.nombre
      FROM    Tproveedor, Tsuministro
      WHERE   Tproveedor.numeroProv  = Tsuministro.numeroProv  AND
	      Tsuministro. NumeroPieza = 'P2';

/*  As� como existe la cl�usula  IN tambi�n podemos utilizar  
      NOT  IN
    
Ejemplo:

43. Obtener los nombres de proveedores que no suministran 
        ninguna pieza  */

		SELECT  nombre
		FROM  Tproveedor
		WHERE numeroProv   NOT  IN
					    ( SELECT  numeroProv
					       FROM  Tsuministro);


/*44 Obtener los nombres de proveedores que no suministran la pieza P2  */

		SELECT  numeroProv,nombre
		FROM  Tproveedor
		WHERE numeroProv     not IN
					    ( SELECT  numeroProv
					       FROM  Tsuministro
					       Where  numeroPieza ='P2');



/*EL SIGUIENTE ES UN ERROR COM�N DE DISE�O DE LA SENTENCIA SQL ANTERIOR 
   UTILIZANDO REUNI�N:*/

	SELECT  distinct tproveedor.numeroProv,tproveedor.nombre
	FROM  Tproveedor, tsuministro
	WHERE tproveedor.numeroProv = tsuministro.numeroProv  and
           numeroPieza != 'P2'

/* Este tipo de consultas en forma negativa (no posee, no sumnistra, 
   no est�, etc.) no es 
   posible hacerlas mediante la uni�n de tablas, ya que precisamente 
   el elemento(s) que buscamos existir� en una tabla pero no en otra*/



/*  SUBCONSULTA UTILIZANDO  OPERADORES RELACIONALES:*/

/*45	Obtener los n�meros de proveedor situados en la misma ciudad 
        que el proveedor  S1  */

	SELECT   numeroProv
        FROM  Tproveedor
	WHERE  ciudad  =  
			( SELECT  ciudad 
			  FROM  Tproveedor
			  WHERE  numeroProv  =  'S1');


/*  En el ejemplo anterior la subconsulta anidada da como resultado un �nico valor, 
    por tanto, es posible utilizar operadores relacionales (=, >, >=, < , <=, < > ). 
    Si la subconsulta anidada generara varios valores, ser� necesario utilizar la cl�usula
    > all, < all, etc. como se ver� m�s adelante.


 SUBCONSULTAS CON FUNCIONES DE AGREGACI�N */

/*46  Obtener los n�meros de proveedor que posean el mayor estado 
      en la tabla de proveedores.*/
         
         Select numeroProv, nombre
         from  Tproveedor
         where estado = 
                        (Select max(estado)
                         from Tproveedor);


/*47 Listar el n�mero de pieza de la que menos unidades
     aporta un proveedor*/


         Select numeroPieza
         from  Tsuministro
         where cantidad =
                        (Select min(cantidad)
                         from Tsuministro);


/* Al utilizar subconsultas tambi�n se pueden usar reuniones.
   Por ejemplo, si se desea conocer el n�mero sino tambi�n el nombre 
   de la pieza de la que se aportan menos unidades, debe buscarse el
   nombre en la tabla Tpieza, y por tanto, es necesario unir la
   tabla Tsuministro con la tabla Tpieza, para poder obtener dicha
   informaci�n
   Ejemplo: */


/*48 Listar el n�mero y nombre de la pieza de la que menos unidades 
      aporta un proveedor*/


         Select Tsuministro.numeroPieza, nombre
         from  Tsuministro, Tpieza
         where  Tsuministro.numeroPieza = Tpieza.numeroPieza  and
         cantidad =
                        (Select min(cantidad)
                         from Tsuministro);




/*  SUBCONSULTAS UTILIZANDO LA CL�USULA 'ALL'  */


/*49 Obtener el nombre de todos los proveedores que tienen
     un estado mayor a todos los proveedores que viven en Londres.   */

		SELECT  nombre
		FROM  Tproveedor
		WHERE estado   >ALL
				   ( SELECT  estado
				     FROM  Tproveedor
				     Where  ciudad  = 'Londres');



/*  Se puede decir que  NOT  IN  y  < > ALL  son equivalentes.


    Subconsultas con varios niveles de anidamiento

50 	Obtener los nombres de los proveedores que suministren 
        al menos una pieza roja  */

	SELECT  nombre
	FROM  Tproveedor
	WHERE   numeroProv IN
			    (SELECT  numeroProv
			     FROM  Tsuministro	
			     WHERE  numeroPieza IN
						 ( SELECT  numeroPieza
						   FROM  Tpieza
						   WHERE   color  = 'rojo'));


/*51 	Esta consulta tambi�n podr�a realizarce por medio de una consulta de reuni�n de 
        3 tablas    */

		SELECT  distinct Pr.nombre
		FROM  	Tproveedor Pr, Tsuministro S,  Tpieza P
		WHERE  	Pr.numeroProv  = S.numeroProv        AND
			S.numeroPieza = P.numeroPieza        AND
			P.color  =  'rojo';

/*52  Listar el n�mero de proveedor que no aporta ni la pieza P4 ni la P5  */


   SELECT  numeroProv
   FROM    Tproveedor
   WHERE   numeroProv  not in
                             (SELECT numeroProv
                              FROM   Tsuministro 
                              WHERE  numeroPieza = 'P4')
   AND     numeroProv not in    
                              (SELECT numeroProv
                               FROM   Tsuministro 
                               WHERE  numeroPieza = 'P5')
 


/*Las subconsultas tambi�n pueden ser utilizadas dentro de una cl�usula DELETE

Ejemplo

53- Eliminar de la base de datos al proveedor
     que posea el estado menor*/

   DELETE  
   FROM  Tproveedor
   WHERE estado =    (SELECT  min (estado)
                      FROM Tproveedor)

/*  OJO  Esta instrucci�n generar� un error dado que viola la integridad
    de la base de datos. Se utiliza �nicamente con el fin de mostrar el 
    ejemplo*/






/* UNION DE TABLAS UTILIZANDO LA SENTENCIA INNER JOIN */

/* 46 Listar los n�meros y nombres de los proveedores que suministran
   alguna pieza */

/*Con una sentencia de reuni�n utilizando la clausula where quedar�a as�*/

  SELECT  Tproveedor.numeroProv, Tproveedor.nombre
  FROM    Tproveedor, Tsuministro
  WHERE   Tproveedor.numeroProv  = Tsuministro.numeroProv  

/*Utilizando la cl�usula inner join se har�a de la siguiente forma*/

  SELECT  Tproveedor.numeroProv, Tproveedor.nombre
  FROM    Tsuministro inner  join Tproveedor
            on Tsuministro.numeroProv = Tproveedor.numeroProv 


/* 47 Listar los nombres de los proveedores y de la pieza que
      suministran junto con la cantidad suministrada de la pieza */

/*Con una sentencia de reuni�n utilizando la clausula where quedar�a as�*/

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tproveedor, Tpieza, Tsuministro
  WHERE   Tsuministro.numeroProv  = Tproveedor.numeroProv AND
          Tsuministro.numeroPieza = Tpieza.numeroPieza

/*Utilizando la cl�usula inner join se har�a de la siguiente forma*/

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tsuministro 
          inner  join Tproveedor 
             on Tsuministro.numeroProv =Tproveedor.numeroProv
          inner  join Tpieza 
             on  Tsuministro.numeroPieza = Tpieza.numeroPieza           


/* 48 Listar los nombres de los proveedores y de la pieza que
      suministran junto con la cantidad suministrada de la pieza, pero 
      �nicamente para los proveedores que aporta la pieza P2 */

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tsuministro 
          inner  join Tproveedor 
             on Tsuministro.numeroProv =Tproveedor.numeroProv
          inner  join Tpieza 
             on  Tsuministro.numeroPieza = Tpieza.numeroPieza   
  WHERE   Tsuministro.numeroPieza = 'P2'


/*49- Al utilizar la cl�usula inner join tambi�n se pueden utilizar
      alias para las tablas */

  SELECT  Tpr.nombre, Tpi.nombre, cantidad
  FROM    Tsuministro Ts 
          inner  join Tproveedor Tpr
             on Ts.numeroProv =Tpr.numeroProv
          inner  join Tpieza Tpi 
             on  Ts.numeroPieza = Tpi.numeroPieza   
  WHERE   Ts.numeroPieza = 'P2'


/*UTILIZACI�N DE CAMPOS DE TIPO FECHA*/

/*50- Agregar un campo de tipo fecha a la tabla Tsuministro*/

Alter table Tsuministro add fechaContrato smalldatetime

/*51- Actualizar la tabla suministro para incorporar datos de 
      tipo fecha*/

update Tsuministro
set fechaContrato = '10-02-2007  11:15:45'
where numeroPieza = 'P2'

update Tsuministro
set fechaContrato = '25-03-2007  09:30:00'
where numeroPieza between 'P3' AND 'P6'

update Tsuministro
set fechaContrato = '05-10-2006  10:40:45'
where numeroPieza = 'P1'

/*52- Listar todos los campos de la tabla Tsuministro, para observar
  los campos de tipo fecha*/

select numeroProv,numeroPieza,fechaContrato
from tsuministro


/*53- Listar como 3 campos independientes,los valores correspondientes 
  al dia, mes y a�o*/

select numeroProv,day(fechaContrato)dia,month(fechaContrato)mes,year(fechaContrato) a�o
from tsuministro

/*AGRUPACI�N UTILIZANDO CAMPOS TIPO FECHA*/

/*54- Listar por a�o la cantidad de piezas suministradas en total */

select year(fechaContrato) a�o, sum(cantidad)[Cantidad de piezas]
from tsuministro
group by year(fechaContrato)

/*55- Listar por a�o y mes la cantidad de piezas suministradas en total */

select year(fechaContrato) a�o,month(fechaContrato) mes, sum(cantidad)[Cantidad de piezas]
from tsuministro
group by year(fechaContrato), month(fechaContrato)


/*PROCEDIMIENTOS ALMACENADOS*/

/*
Los procedimientos definidos por el usuario, son almacenados 
dentro de la base de datos y pueden ser ejecutados
con una llamada desde una aplicaci�n y permitir variables declaradas
por el usuario, ejecuci�n condicional y otras caracter�sticas
de programaci�n.

Los procedimientos almacenados pueden: 
� Recibir par�metros.
� Llamar otros procedimientos almacenados(con un anidamientos de 16 niveles.)
� Retornar valores de estado para indicar �xito o fracaso.
� Retorna valores de par�metros a un procedimiento o batch.


Los procedimientos almacenados solo pueden crearse en la base de
datos que se est� utilizando en el momento de la creaci�n.

La sintaxis de declaraci�n de un procedimiento almacenado
es la siguiente:

CREATE PROCEDURE [due�o.]nombre_procedimiento[;numero]
       [(parametro1 [, parametro2]..[parametros255])]
       [{FOR REPLICATION}| {WITH RECOMPILE}
         [{[WITH]|[,]} ENCRYPTION]]
AS declaraciones SQL


� Para dar nombre a los procedimientos almacenados se debe 
  seguir las reglas establecidas para identificadores.
� La opci�n ;numero permite agrupar procedimientos con el mismo
  nombre para que puedan ser borrados mediante unadeclaraci�n 
         DROP PROCEDURE.  
� La declaraci�n CREATE PROCEDURE puede incluir cualquier n�mero
  de declaraciones SQL, con la excepci�n de las siguientes
  declaraciones CREATE:
	CREATE VIEW
	CREATE DEFAULT
	CREATE RULE
	CREATE TRIGGER
	CREATE PROCEDURE
� El n�mero m�ximo de variables locales y globales en un procedimiento
  almacenado es limitado solo por la cantidad de memoria.


� Los par�metros de un procedimiento son declarados con un nombre y
  un tipo de dato y estos pueden tener una declaraci�n Default.
  Adem�s, su nombre debe iniciar con un s�mbolo @.
� Los valores por omisi�n (Default) en un par�metro 
  deben ser expresiones constantes.


�Los par�metros de un procedimiento almacenado se pueden
 declarar de dos tipos: de entrada y de salida.  
 Los par�metros de salida deben indicarse con la declaraci�n OUTPUT
 despu�s del tipo del par�metro.  Esta declaraci�n debe ser usada
 tambi�n en la ejecuci�n del procedimiento en cada uno
 de los par�metros que se desee recuperar.

� Los procedimientos almacenados pueden devolver expresiones
  enteras que indican el estado del procedimiento seg�n lo defina
  el programador.  Simplemente se utiliza return [expresion_entera].  



� Existen varios procedimientos almacenados del sistema que
  brindan informaci�n acerca de los procedimientos creados por el
  usuario, tales como:

  sp_Depends: 	lista los procedimientos almacenados y
             	los objetos referenciados por esos procedimientos.

  sp_helptext: 	despliega el texto utilizado para crear los procedimientos.
 
  sp_help: 	ayuda a obtener un reporte sobre un procedimiento
		almacenado o ejecutar el procedimiento.

  sp_recompile:  se puede utilizar para recompilar los objetos
		ya existentes. 


*/

/*Ejemplos

 Los ejemplos est�n basados en la base de datos dbproveedoresPartes
 suministrada por el profesor.

1. Dise�e un procedimiento almacenado en SQL Server que 
   despliegue la lista de todos los atributos de los proveedores.*/

CREATE PROC ListaProveedores

AS
    SELECT *
    FROM TProveedor

/* Este procedimiento qued� almacenado entre los objetos de la Base
   de datos. Para ejecutarlo se debe correr la siguiente instrucci�n */

Exec ListaProveedores


/*2. Dise�o de un procedimiento almacenado que retorna
     en una variable de salida el nombre de la pieza que 
     corresponda al n�mero de pieza pasado como par�metro. 
     Si la pieza no existe se indica en un mensaje. */

CREATE PROC buscaPieza
            @numeroPieza_p varchar(10),
            @nombrePieza_p   varchar(30) OUTPUT
AS
    select @nombrePieza_p = nombre
    from TPieza 
    where numeroPieza = @numeroPieza_p
    if @@rowcount = 0
       print 'La pieza '+@numeroPieza_p +' no existe.'
GO

/*Este procedimiento almacenado puede ser llamado por medio de las 
siguientes instrucciones: */
 

declare @nombrePieza_v       varchar(30)
execute buscaPieza 'P8',@nombrePieza_v OUTPUT
if @nombrePieza_v IS NOT null 
   print 'El nombre de la pieza es: ' +  @nombrePieza_v

