
/* SENTENCIAS DE CONSULTA SQL (SELECT).


   La estructura básica de una sentencia de consulta en SQL 
   consta de tres cláusulas:  SELECT ,  FROM  y  WHERE.

   SELECT : Indica los atributos o campos de la tabla(s)
            que se desean listar en una consulta.
   FROM	  : Indica la(s) tabla(s) de las que se extraerá la consulta.
   WHERE  : Indica las condiciones que deben cumplir los atributos para
            que los registros respectivos aparezcan en la consulta.

   Formato:

			SELECT A1 , A2 , A3, ........An
			FROM  T1, T2, ........Tn
			WHERE   Condición.

   - Cada A representa un atributo.
   - Cada T una tabla.
   - La condición indica la lista de condiciones que deben cumplir los
     atributos para aparecer en el resultado de la consulta

   La lista de atributos puede sustituirse por un (*)  si se desea
   listar todos los atributos de la(s) tabla(s) que aparecen en
   la cláusula FROM.

   EJEMPLOS:


   1 Listar el número y nombre de cada proveedor */

     		Select numeroProv, nombre
        	from Tproveedor;

   /* 2 Si en la lista de selección se utiliza el *
        se estará indicando que se desea listar todos los atributos
        de la tabla.
        Ejemplo:
        Listar una copia de la tabla  de Proveedores completa.*/

     		Select *
        	from Tproveedor;

   /* 3 Al agregar la cláusula Top n , listará los n primeros registros 
        de la tabla seleccionada  */


			Select top 3 * 
			from Tproveedor


			Select top 3 numeroPieza, nombre 
			from Tpieza


  /* 4 Es importante visualizar la tabla de la cual se originan 
       los datos. Por ejemplo, si se desea obtener los números de 
       proveedor que aportan piezas, esta consulta debe basarse en 
       la tabla Tsuministro, ya que en la tabla Tproveedor, se 
       encuentran todos los proveedores, aporten o no piezas en el 
       momento de la consulta, mientras que en la tabla Tsuministro, 
       aparecen únicamente los provedorees de los que ya se registró 
       que aportan alguna pieza 

       Ejemplo: Listar los números de  proveedor que aportan alguna pieza */
     
			Select numeroProv
			From Tsuministro;

  /* 5 Como en la tabla Tsuministro, el número de proveedor aparece 
       tantas veces como piezas aporta, en la consulta, aparecerán
       números de proveedor repetidos. 
       Para evitar esto, es necesario incluir la cláusula DISTINCT 
       que eliminará los duplicados en las consultas.  */

        	Select  distinct  numeroProv
		From Tsuministro; 

  /* 6 Es importante destacar que la cláusula distinct trabaja
       sobre el registro de la salida completo, es decir, 
       únicamente descartará de la salida aquellas ocurrencias
       de registros completo que ya se hayan listado.

       Ejemplo: Listar el número de proveedor y de la pieza
                que aporta cada uno */

       		Select  distinct  numeroProv, numeroPieza
		From Tsuministro; 

  /* 7 Como resultado de esta consulta no se descartó ningun registro
       duplicado, ya que la combinación de los campos numeroProv y 
       numeroPieza no se repite.
       Ahora observe lo que sucede con la siguiente consulta:

       Listar los números de proveedor y la cantidad que aportan de 
       cada pieza */

  	           Select  distinct  numeroProv, cantidad
		   From Tsuministro; 
 
    /* Esta consulta genera 2 registros menos que la anterior, ya que 
       la combinación de numeroProv y cantidad se repite en los 
       siguientes registros:
		S1	P2	200
		S1	P4	200
		S1	P5	100
		S1	P6	100
      La consulta listará únicamente una ocurrencia de cada combinación
      de númeroProv y cantidad repetida. */

 /* CONSULTAS CONDICIONADAS

    La cláusula WHERE en una consulta, permite agregar condiciones
    que deberán cumplir los atributos, para que el registro del que 
    forman parte aparezca en la salida. Es decir, la cláusula WHERE
    realiza una selección horizontal de los registros de la tabla.
    Se dice que la cláusula SELECT realiza una selección vertical.
    Para construir las condiciones, se requiere utilizar operadores
    lógicos y operadores relacionales

    OPERADORES LÓGICOS Y RELACIONALES

    Operadores relacionales o de comparación:

                         menor que           <
                         mayor que           > 
                         menor o igual que   <=
                         mayor o igual que   >= 
                         diferente a         <> .

    Operadores lógicos:
                         and (y)
                         or  (ó)
                         not (negación)
      
   8 Ejemplo:  Obtener los nombres de proveedor y ciudad
                 para los proveedores de Paris con estado = 10.*/

		Select nombre, ciudad, estado
		From Tproveedor
		where ciudad = 'Paris' and
                      estado = 10


 /* CLÁUSULA  BETWEEN  y   NOT BETWEEN: esta cláusula es útil cuando
    se tiene una condición que determine que los valores de algún
    atributo deban encontrarse dentro o fuera de un rango definido.

  9 Ejemplo: Encontrar los números de proveedor y de pieza
               de las que se provee una cantidad mayor o igual a 100 
               pero menor o igual a 300 */

           Select distinct numeroProv,numeroPieza,cantidad
	       From  Tsuministro
	       Where cantidad between 200 and 300;


/*   OPERADORES PARA COMPARACIONES DE CADENAS DE CARACTERES


     Es posible realizar consultas que apliquen condiciones a los 
     campos alfanuméricos. Para estos campos, se puede 
     establecer condiciones que realicen una comparación exacta 
     de la cadena, pero también SQL nos permite realizar consultas
     que permitan comparar las cadenas con aproximaciones.
     La diferenciación entre mayúsculas y minúsculas depende de la
     configuración que presente en el momento el DBMS.

 10 Ejemplo: Obtener la información de todos los 
               proveedor que tengan el apellido 'Salazar'.   */

			Select Nombre
			From Tproveedor
			Where nombre =  'Salazar';

  /* Esta consulta analiza que en el campo nombre aparezca
     la hilera 'Salazar' estrictamente igual a como se especificó

     También podemos hacer comparaciones por aproximación, utilizando
     los siguientes símbolos:


	%  Este símbolo representa cualquier cadena de caracteres.
	_    Este símbolo representa cualquier caracter.


 11 Ejemplo: Obtener todos los nombres de Proveedor que tengan la 
               sílaba 'al' dentro de su apellido.   */
   
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

  Las consultas realizadas no se desplegarán en ningún orden específico
  a no ser que el usuario lo indique por medio de la cláusula ORDER BY. 
  El ordenamiento puede ser ascendente si se indica (asc) o descendente 
  indicando las cláusula (desc).

 14 Ejemplo: Obtener la información de los proveedores en orden
               descendente de estado.  */

			Select *
			From Tproveedor
			Order by estado desc

 /*15 Ejemplo: Obtener la información de las piezas en orden 
               ascendente de peso.  */

			Select *
			From Tpieza
			Order by peso asc

      /*También podemos ordenar la salida por 2 o más campos.*/

 /*16 Ejemplo: Obtener la información de los proveedores en orden
               ascendente de ciudad; y de manera que,los proveedores
               situados dentro de la misma ciudad aparezcan en
               orden descendente de estado.    */

			Select *
			From Tproveedor
			Order by ciudad asc,estado desc


/*  FUNCIONES INTEGRADAS:

   SQL proporciona varias funciones integradas, para mejorar su nivel 
   básico de recuperación.
   Exceptuando el COUNT(*), cada una de estas funciones opera sobre el
   conjunto de valores de una columna de alguna tabla, por tanto se
   llaman también Funciones de agregación. 
   Son las siguientes:

   COUNT : Calcula la cantidad de valores indicados. 
   SUM	 : Calcula la suma de los valores de la columna indicada.
   AVG	 : Calcula el promedio de los valores de la columna indicada.
   MAX	 : Obtiene el valor más grande de la columna indicada.
   MIN	 : Obtiene el valor más pequeño de la columna  indicada.

   Para SUM y AVG la columna comprendida debe ser numérica.

   La función COUNT determina la cantidad de ocurrencias de 
   una columna indicada, también es utilizada para contar la cantidad
   de tuplas en una relación 	 */


/*17  	Listar cuantos proveedores viven en París.  */

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

/*23	Obtener la cantidad mínima de piezas que aporta un proveedor  */

			Select  MIN(cantidad)
			From Tsuministro

/*24	Listar la cantidad de proveedores que aportan piezas  */

	Select count (distinct numeroProv) [Cantidad de proveedores] 
        from Tsuministro


/*  AGRUPAMIENTO DE DATOS:  Group By

    Las funciones de agregación las podemos utilizar para calcular o
    subtotalizar valores para grupos de tuplas o registros. 

    Ejemplo:   */

/*25  Obtener el número de proveedor y la suma total de piezas que aporta.*/

			Select  numeroProv, sum(cantidad) as  cantidad
			From Tsuministro
			Group by numeroProv
			
/*	El atributo de agrupación debe aparecer entre los campos 
        del select y no deben aparecer más atributos en el select,
        que no sean los de la agrupación.
        Dado que el campo en la consulta que resultará  de la función
        de agregación no tiene un nombre en la tabla, es posible
        indicar al SQL, el nombre con el que debe aparecer la
        dicha columna en la tabla resultante
	
26	Obtener la cantidad de piezas diferentes que aporta cada
        proveedor  */

        		Select numeroProv, count(*) as Cantidad
			From Tsuministro
			Group by numeroProv

/*27	Si el título que le deseamos poner a la columna contiene más de
        una palabra debemos encerrarla entre paréntesis cuadrados, así:          */

            Select numeroProv, count(*) as [Cantidad de tipos de Piezas]
            From Tsuministro
            Group by numeroProv
                       

/*  CONDICIONAMIENTO DE LOS GRUPOS  (Having)

     A veces es necesario incluir una condición que se aplique a los
     grupos y no a las tuplas individuales. 
     Para esto se utiliza la cláusula Having

     Esta cláusula se aplica después de la formación de los grupos y 
     así se listarán únicamente los grupos que cumplan con la condición 
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
     pero de manera que únicamente aparezcan los que aportan en total más
     de 500 piezas */

			Select   numeroProv, sum(cantidad)
			From     Tsuministro
			Group by numeroProv
			Having   sum(cantidad)> 500


/*30 Listar para cada pieza, la cantidad total que de ella aportan
     entre todos los proveedores, pero, de manera que aparezcan 
     únicamente las piezas de las que se aporta más de 600 piezas 
     en total  */

			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
			Group by numeroPieza
			Having   sum(cantidad)> 600



/*30 Listar para cada pieza, la cantidad total que de ella aportan
     entre todos los proveedores, pero, de manera que aparezcan 
     únicamente las piezas con número mayor a P2.

     Observe las siguientes opciones de solución: */

			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
                        where   numeroPieza > 'P2'
			Group by numeroPieza


			Select   numeroPieza, sum(cantidad)
			From     Tsuministro
			Group by numeroPieza
			Having   numeroPieza > 'P2'


/* A pesar de que ambas soluciones generan la misma salida, por factores
   de rendimiento, es preferible, utilizar la claúsula WHERE en lugar de
   la claúsula HAVING, ya que, con el WHERE, el sistema no requiere
   calcular la suma de las cantidades para las piezas P1 y P2, 
   pues éstas se descartan antes de totalizar por pieza; mientras que,
   con el HAVING, se deberán calcular los totales para todas las piezas,
   y luego, se descartan de la salida los registros correspondientes a
   las piezas P1 y P2, a pesar de que ya se tuvo que realizar todo el 
   proceso de cálculo de la suma de las cantidades para ambas piezas. */



 /*  CONSULTAS DE MÁS DE UNA TABLA:

     Al realizar una consulta es posible obtener datos de diferentes 
     tablas, lo cual, es posible gracias al operador de reunión de 
     tablas de acuerdo a algún atributo en común. 

     NOTA IMPORTANTE:
     Es indispensable indicar en la sentencia WHERE, los campos que 
     tienen en común las tablas, de lo contrario, se producirá un 
     producto cartesiano de tablas, y se generarán tuplas por cada 
     combinación posible de los registros de una tabla con la otra
     Ejemplos:  */

/*31   Listar el número, nombre de cada pieza suministrada, junto a
       la cantidad  que se aporta de dicha pieza. */

	Select numeroProv, nombrecantidad
        from   Tsuministro , Tpieza
	where  Tsuministro.numeroPieza = Tpieza.numeroPieza ;


/*  Note que al usar más de una relación en la consulta, se indica:
	
 			Nombre-Relación.Nombre-Atributo

    De esta forma se  evita ambigüedad en casos en que los atributos
    aparezcan con el mismo nombre en las diferentes relaciones.
    El uso del nombre de la tabla junto al atributo, es obligatorio
    únicamente cuando el nombre del atributo se repite en las
    tablas involucradas en la consulta
 
32  Dado que puede resultar tedioso el estar digitando por cada atributo 
      el nombre de la tabla a la que pertenece, SQL permite sustituir
      los nombres de las tablas por seudónimos o alias. */

		Select  A.numeroPieza , Pr.Ciudad
		from    Tsuministro   A , Tproveedor  Pr
		where   A.numeroProv = Pr.numeroProv ;

/*33  Aun es posible eliminar la palabra 'as' de la siguiente forma: */

		Select  A.numeroPieza , Pr.Ciudad
		from    Tsuministro   A , Tproveedor  Pr
		where   A.numeroProv = Pr.numeroProv ;






/* REUNIÓN DE MÁS DE 2 TABLAS

   Es posible consultar campos de varias tablas siempre que sea
   posible unirlas por algún atributo que tengan en común.*/
 

/*34   Listar el número y nombre de cada pieza suministrada,
       junto al número de proveedor que la suministra y a la
       cantidad que aporta de dicha pieza. */

 Select Tproveedor.numeroProv, Tproveedor.nombre, Tpieza.numeroPieza , Tpieza.nombre, cantidad
 from   Tsuministro , Tproveedor, Tpieza
 where  Tsuministro.numeroProv = Tproveedor.numeroProv   AND
        Tsuministro.numeroPieza = Tpieza.numeroPieza


/* Es posible a las reuniones de tablas aplicarles una selección
   Ejemplo: 
 
35  Obtener el nombre del proveedor , de la parte que suministra 
      y la cantidad, para los proveedores que residen en Londres*/

     Select Tproveedor.nombre, Tpieza.Nombre, Tsuministro.cantidad
     From   Tproveedor, Tpieza, Tsuministro
     Where  Tsuministro.numeroPieza = Tpieza.numeroPieza and 
            Tsuministro.numeroProv = Tproveedor.numeroProv  and
	     Tproveedor.ciudad = 'Londres'


/* También es posible, utilizar funciones integradas y agrupaciones
   sobre la unión de tablas*/

/*36  Listar para cada proveedor (por nombre),la cantidad de 
      tipos de piezas que aporta, en orden de nombre del proveedor */


Select Tsuministro.numeroProv, nombre, count(*) [Cantidad de tipos de Piezas]
From Tsuministro, Tproveedor
where tsuministro.numeroProv = Tproveedor.numeroProv
Group by tsuministro.numeroProv,nombre
Order by nombre




/*36 Obtener la información del proveedor y la pieza que están 
     situados en la misma ciudad, pero que no aparezcan proveedores
     cuyo estado sea 20.*/

		Select Tproveedor.*, Tpieza.*
		from   Tproveedor  , Tpieza 
		where  Tproveedor.ciudad = Tpieza.ciudad  and 
                       Tproveedor.estado <> 20 

/* Observe que en este caso las piezas no se estan uniendo con el 
   proveedor que las aporta sino que se están uniendo con el proveedor 
   que habita en la misma ciudad


   REUNIÓN DE UNA TABLA CONSIGO MISMA

37  Obtener todas las posibles parejas de proveedor que residan en 
      la misma ciudad  */

      Select Tprov1.nombre, Tprov1.ciudad, Tprov2.Nombre, Tprov2.ciudad
      from   Tproveedor Tprov1, Tproveedor Tprov2
      Where  Tprov1.ciudad = Tprov2.ciudad   and
       Tprov1.numeroProv < Tprov2.numeroProv   /*ELIMINA LOS REPETIDOS EN CUALQUIER ORDEN*/

/*  La línea que indica	Tprov1.numeroProv < Tprov2.numeroProv se
    incluye para eliminar  las parejas repetidas

38	Obtener los nombres de los proveedores que estén situados en 
        la misma ciudad que el proveedor S1*/

  Select Tprov1.nombre, Tprov1.ciudad, Tprov2.nombre, Tprov2.ciudad
  From   Tproveedor Tprov1, Tproveedor Tprov2
  Where  Tprov1.ciudad = Tprov2.ciudad   and
         Tprov1.numeroProv < Tprov2.numeroProv  and
	 Tprov1.numeroProv = 'S1'

/*   RECUPERACIÓN DE DATOS CON NULL (NULOS)

     Para detectar la presencia o ausencia de nulos se utiliza una 
     condición especial.

39 Obtener la información de los proveedores que tienen en null el atributo estado*/

	Select *
	From Tproveedor
	Where estado is null

/*40 Obtener la información de los proveedores que no tienen null 
     en el atributo estado  */
	
	Select *
	From   Tproveedor
	Where  estado is not null


/*  RECUPERACIÓN DE DATOS CON SUBCONSULTA:  

    Una subconsulta es una expresión SELECT anidada dentro de 
    otra expresión SELECT.  

    CLAÚSULA 'IN' Y  'NOT IN'  */

/*41	Obtener los nombres de proveedores que suministran la pieza
         P2  */

  		SELECT numeroProv, nombre
		FROM  Tproveedor
		WHERE numeroProv  IN
					( SELECT  numeroProv
					  FROM  Tsuministro
					  Where  numeroPieza = 'P2');


/*   Para evaluar estas consultas, el sistema evalúa primero la 
     subconsulta anidada, (interior),esa subconsulta produce como 
     resultado una tabla de valores donde se evalúa la consulta 
     exterior. 
42  La subconsulta anterior podría también escribirse como una
      consulta de reunión de la siguiente forma:  */

      SELECT  Tproveedor.nombre
      FROM    Tproveedor, Tsuministro
      WHERE   Tproveedor.numeroProv  = Tsuministro.numeroProv  AND
	      Tsuministro. NumeroPieza = 'P2';

/*  Así como existe la cláusula  IN también podemos utilizar  
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



/*EL SIGUIENTE ES UN ERROR COMÚN DE DISEÑO DE LA SENTENCIA SQL ANTERIOR 
   UTILIZANDO REUNIÓN:*/

	SELECT  distinct tproveedor.numeroProv,tproveedor.nombre
	FROM  Tproveedor, tsuministro
	WHERE tproveedor.numeroProv = tsuministro.numeroProv  and
           numeroPieza != 'P2'

/* Este tipo de consultas en forma negativa (no posee, no sumnistra, 
   no está, etc.) no es 
   posible hacerlas mediante la unión de tablas, ya que precisamente 
   el elemento(s) que buscamos existirá en una tabla pero no en otra*/



/*  SUBCONSULTA UTILIZANDO  OPERADORES RELACIONALES:*/

/*45	Obtener los números de proveedor situados en la misma ciudad 
        que el proveedor  S1  */

	SELECT   numeroProv
        FROM  Tproveedor
	WHERE  ciudad  =  
			( SELECT  ciudad 
			  FROM  Tproveedor
			  WHERE  numeroProv  =  'S1');


/*  En el ejemplo anterior la subconsulta anidada da como resultado un único valor, 
    por tanto, es posible utilizar operadores relacionales (=, >, >=, < , <=, < > ). 
    Si la subconsulta anidada generara varios valores, será necesario utilizar la cláusula
    > all, < all, etc. como se verá más adelante.


 SUBCONSULTAS CON FUNCIONES DE AGREGACIÓN */

/*46  Obtener los números de proveedor que posean el mayor estado 
      en la tabla de proveedores.*/
         
         Select numeroProv, nombre
         from  Tproveedor
         where estado = 
                        (Select max(estado)
                         from Tproveedor);


/*47 Listar el número de pieza de la que menos unidades
     aporta un proveedor*/


         Select numeroPieza
         from  Tsuministro
         where cantidad =
                        (Select min(cantidad)
                         from Tsuministro);


/* Al utilizar subconsultas también se pueden usar reuniones.
   Por ejemplo, si se desea conocer el número sino también el nombre 
   de la pieza de la que se aportan menos unidades, debe buscarse el
   nombre en la tabla Tpieza, y por tanto, es necesario unir la
   tabla Tsuministro con la tabla Tpieza, para poder obtener dicha
   información
   Ejemplo: */


/*48 Listar el número y nombre de la pieza de la que menos unidades 
      aporta un proveedor*/


         Select Tsuministro.numeroPieza, nombre
         from  Tsuministro, Tpieza
         where  Tsuministro.numeroPieza = Tpieza.numeroPieza  and
         cantidad =
                        (Select min(cantidad)
                         from Tsuministro);




/*  SUBCONSULTAS UTILIZANDO LA CLÁUSULA 'ALL'  */


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


/*51 	Esta consulta también podría realizarce por medio de una consulta de reunión de 
        3 tablas    */

		SELECT  distinct Pr.nombre
		FROM  	Tproveedor Pr, Tsuministro S,  Tpieza P
		WHERE  	Pr.numeroProv  = S.numeroProv        AND
			S.numeroPieza = P.numeroPieza        AND
			P.color  =  'rojo';

/*52  Listar el número de proveedor que no aporta ni la pieza P4 ni la P5  */


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
 


/*Las subconsultas también pueden ser utilizadas dentro de una clàusula DELETE

Ejemplo

53- Eliminar de la base de datos al proveedor
     que posea el estado menor*/

   DELETE  
   FROM  Tproveedor
   WHERE estado =    (SELECT  min (estado)
                      FROM Tproveedor)

/*  OJO  Esta instrucción generará un error dado que viola la integridad
    de la base de datos. Se utiliza únicamente con el fin de mostrar el 
    ejemplo*/






/* UNION DE TABLAS UTILIZANDO LA SENTENCIA INNER JOIN */

/* 46 Listar los números y nombres de los proveedores que suministran
   alguna pieza */

/*Con una sentencia de reunión utilizando la clausula where quedaría así*/

  SELECT  Tproveedor.numeroProv, Tproveedor.nombre
  FROM    Tproveedor, Tsuministro
  WHERE   Tproveedor.numeroProv  = Tsuministro.numeroProv  

/*Utilizando la cláusula inner join se haría de la siguiente forma*/

  SELECT  Tproveedor.numeroProv, Tproveedor.nombre
  FROM    Tsuministro inner  join Tproveedor
            on Tsuministro.numeroProv = Tproveedor.numeroProv 


/* 47 Listar los nombres de los proveedores y de la pieza que
      suministran junto con la cantidad suministrada de la pieza */

/*Con una sentencia de reunión utilizando la clausula where quedaría así*/

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tproveedor, Tpieza, Tsuministro
  WHERE   Tsuministro.numeroProv  = Tproveedor.numeroProv AND
          Tsuministro.numeroPieza = Tpieza.numeroPieza

/*Utilizando la cláusula inner join se haría de la siguiente forma*/

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tsuministro 
          inner  join Tproveedor 
             on Tsuministro.numeroProv =Tproveedor.numeroProv
          inner  join Tpieza 
             on  Tsuministro.numeroPieza = Tpieza.numeroPieza           


/* 48 Listar los nombres de los proveedores y de la pieza que
      suministran junto con la cantidad suministrada de la pieza, pero 
      únicamente para los proveedores que aporta la pieza P2 */

  SELECT  Tproveedor.nombre, Tpieza.nombre, cantidad
  FROM    Tsuministro 
          inner  join Tproveedor 
             on Tsuministro.numeroProv =Tproveedor.numeroProv
          inner  join Tpieza 
             on  Tsuministro.numeroPieza = Tpieza.numeroPieza   
  WHERE   Tsuministro.numeroPieza = 'P2'


/*49- Al utilizar la cláusula inner join también se pueden utilizar
      alias para las tablas */

  SELECT  Tpr.nombre, Tpi.nombre, cantidad
  FROM    Tsuministro Ts 
          inner  join Tproveedor Tpr
             on Ts.numeroProv =Tpr.numeroProv
          inner  join Tpieza Tpi 
             on  Ts.numeroPieza = Tpi.numeroPieza   
  WHERE   Ts.numeroPieza = 'P2'


/*UTILIZACIÓN DE CAMPOS DE TIPO FECHA*/

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
  al dia, mes y año*/

select numeroProv,day(fechaContrato)dia,month(fechaContrato)mes,year(fechaContrato) año
from tsuministro

/*AGRUPACIÓN UTILIZANDO CAMPOS TIPO FECHA*/

/*54- Listar por año la cantidad de piezas suministradas en total */

select year(fechaContrato) año, sum(cantidad)[Cantidad de piezas]
from tsuministro
group by year(fechaContrato)

/*55- Listar por año y mes la cantidad de piezas suministradas en total */

select year(fechaContrato) año,month(fechaContrato) mes, sum(cantidad)[Cantidad de piezas]
from tsuministro
group by year(fechaContrato), month(fechaContrato)


/*PROCEDIMIENTOS ALMACENADOS*/

/*
Los procedimientos definidos por el usuario, son almacenados 
dentro de la base de datos y pueden ser ejecutados
con una llamada desde una aplicación y permitir variables declaradas
por el usuario, ejecución condicional y otras características
de programación.

Los procedimientos almacenados pueden: 
• Recibir parámetros.
• Llamar otros procedimientos almacenados(con un anidamientos de 16 niveles.)
• Retornar valores de estado para indicar éxito o fracaso.
• Retorna valores de parámetros a un procedimiento o batch.


Los procedimientos almacenados solo pueden crearse en la base de
datos que se está utilizando en el momento de la creación.

La sintaxis de declaración de un procedimiento almacenado
es la siguiente:

CREATE PROCEDURE [dueño.]nombre_procedimiento[;numero]
       [(parametro1 [, parametro2]..[parametros255])]
       [{FOR REPLICATION}| {WITH RECOMPILE}
         [{[WITH]|[,]} ENCRYPTION]]
AS declaraciones SQL


• Para dar nombre a los procedimientos almacenados se debe 
  seguir las reglas establecidas para identificadores.
• La opción ;numero permite agrupar procedimientos con el mismo
  nombre para que puedan ser borrados mediante unadeclaración 
         DROP PROCEDURE.  
• La declaración CREATE PROCEDURE puede incluir cualquier número
  de declaraciones SQL, con la excepción de las siguientes
  declaraciones CREATE:
	CREATE VIEW
	CREATE DEFAULT
	CREATE RULE
	CREATE TRIGGER
	CREATE PROCEDURE
• El número máximo de variables locales y globales en un procedimiento
  almacenado es limitado solo por la cantidad de memoria.


• Los parámetros de un procedimiento son declarados con un nombre y
  un tipo de dato y estos pueden tener una declaración Default.
  Además, su nombre debe iniciar con un símbolo @.
• Los valores por omisión (Default) en un parámetro 
  deben ser expresiones constantes.


•Los parámetros de un procedimiento almacenado se pueden
 declarar de dos tipos: de entrada y de salida.  
 Los parámetros de salida deben indicarse con la declaración OUTPUT
 después del tipo del parámetro.  Esta declaración debe ser usada
 también en la ejecución del procedimiento en cada uno
 de los parámetros que se desee recuperar.

• Los procedimientos almacenados pueden devolver expresiones
  enteras que indican el estado del procedimiento según lo defina
  el programador.  Simplemente se utiliza return [expresion_entera].  



• Existen varios procedimientos almacenados del sistema que
  brindan información acerca de los procedimientos creados por el
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

 Los ejemplos están basados en la base de datos dbproveedoresPartes
 suministrada por el profesor.

1. Diseñe un procedimiento almacenado en SQL Server que 
   despliegue la lista de todos los atributos de los proveedores.*/

CREATE PROC ListaProveedores

AS
    SELECT *
    FROM TProveedor

/* Este procedimiento quedó almacenado entre los objetos de la Base
   de datos. Para ejecutarlo se debe correr la siguiente instrucción */

Exec ListaProveedores


/*2. Diseño de un procedimiento almacenado que retorna
     en una variable de salida el nombre de la pieza que 
     corresponda al número de pieza pasado como parámetro. 
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

