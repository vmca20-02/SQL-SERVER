--========================NOTAS IMPORTANTES A TOMAR EN CUENTA===========================

--1.SIEMPRE QUE SE HAGA UN INSERT DEBO DE ESPECIFICIFICAR LOS VALORES,YA QUE A FUTURO 
--  SE PUEDEN AGREGAR MAS COLUMNAS EJEMPLO:

--INSERT INTO PAIS(nombre) VALUES('Costa Rica');

--2.*TIP DE OPTIMIZACION-->GROUP BY ES MAS RAPIDO(ES MAS OPTIMO) QUE DISTINCT

--GROUP BY > DISTINCT = GROUP BY ES MEJOR QUE DISTINCT !!!

--3."GUARDAR UNA FECHA A NIVEL DE SQL SERVER" DEBO DE GUARDARLA CON ESTE FORMATO :
     
	 --EJEMPLO : 20180315 14:30:20  --->ESTO PARA NO TENER PROBLEMAS CON EL DIA Y EL MES

--4.*TIP DE OPTIMIZACION--> TOP 1 ES MUCHO MAS OPTIMO EN CIERTOS CASOS...

   --IF NOT EXISTS(SELECT TOP 1 idturno from turno WHERE fechaturno=@fecha)--->ESTO ES MAS OPTIMO

   --IF NOT EXISTS(SELECT * from turno WHERE fechaturno=@fecha)--->ESTO NO ES TAN OPTIMO COMO LO ANTERIOR

--5.SIEMPRE EL PRIMER CAMPO EN LA CLAUSULA "ON" DEBE SER PERTENECIENTE AL DE LA TABLA INMEDIATA DONDE ESTOY HACIENDO LA CONEXION
  
  -- ESTO NO ES OPTIMO

     --SELECT * FROM Paciente P INNER JOIN TurnoPaciente T ON P.idpaciente=T.idpaciente

  -- ESTO ES OPTIMO(VER LA POSICION DE "T.idpaciente=P")

     --SELECT * FROM Paciente P INNER JOIN TurnoPaciente T ON T.idpaciente=P.idpaciente


--==============================RETOS BASICOS DE SQL SERVER==============================

--#0.VER LOS VIDEOS DE NORMALIZACION(1NF,2NF,3NF)

--#1.A PARTIR DEL MODELADO DE LA BASE DE DATOS(dbCentroMedico) CREAR LOS SCRIPTS NECESARIOS
--    PARA RECREAR EL MISMO MODELADO SIN NECESIDAD DE USAR EL ASISTENTE

     --#1.1 CREAR EL DIAGRAMA SOLO USANDO SCRIPTS
     --#1.2 CREAR EL DIAGRAMA USANDO EL ASISTENTE Y DESPUES GENERANDO LOS SCRIPTS

--#2.CREAR UN TIPO DE DATO PERSONALIZADO POR MEDIO DE UN SCRIPT(INVESTIGAR ESTO UN POCO MAS...)

--#3.CREAR UN STORE PROCEDURE QUE RETORNE UN REGISTRO EN PARTICULAR(DE LA BASE DE DATOS ANTERIORMENTE CREADA) 
--   RECIBIENDO COMO PARAMETRO EL "ID" DEL REGISTRO EN PARTICULAR

    --#3.1 CREAR STORE PROCEDURE SOLO USANDO SCRIPTS
    --#3.2 CREAR EL STORE PROCEDURE USANDO EL ASISTENTE Y DESPUES GENERANDO LOS SCRIPTS

--#4.CONOCER LA ESTRUCTURA DE UNA TABLA EN PARTICULAR(APLIQUE EL COMANDO NECESARIO PARA DICHO PROPOSITO)

--#5.CONOCER EL CONTENIDO DE UN STORE PROCEDURE(APLIQUE EL COMANDO NECESARIO PARA DICHO PROPOSITO)

--#6.CREAR UNA SUB-CONSULTA QUE MUESTRE TODOS LOS PACIENTES CON LOS RESPECTIVOS NOMBRES DE SUS PAISES

    --#6.1 CREAR UNA SUB-CONSULTA MEDIANTE INNER-JOIN
	--#6.2 APLICAR UNA SUB-CONSULTA QUE SE APLIQUE EN EL SELECT DE LA CONSULTA PRINCIPAL

 --#7.CREAR UN IF QUE VALIDE UNA VARIABLE SI LA MISMA ES DIFERENTE A NULL ENTONCES,DEBERA DE BUSCARSE
 --   UN PACIENTE CON ESE ID ADEMAS DE IMPRIMIR UN HOLA MUNDO Y LA VARIABLE QUE SE ENVIO

 --#8.CREAR UN EJEMPLO DE IF + EXISTS

 --#9.CREAR UN IF ANIDADO

 --#10.IMPRIMIR LOS NUMEROS DEL 1 AL 10 CON UN CICLO WHILE

 --#11.MEDIANTE UNA ESTRUCTURA CASE ASIGNAR 1 DE 4 COLORES A UNA VARIABLE

 --#12.APLICAR LA MISMA ESTRUCTURA PERO ESTA VEZ A UN SELECT

 --#13.CREAR UN EJEMPLO CON RETURN

 --#14.CREAR UN EJEMPLO CON BREAK

 --#15.CREAR UN EJEMPLO DE TRY CATCH

 --#16.CREAR UN PROCEDIMIENTO ALMACENADO PARA REGISTRAR PACIENTES

 --USO PRACTICO DE @@IDENTITY
 --#17.CREAR UN PROCEDIMIENTO ALMACENADO QUE REGISTRE TURNOS
     --QUE RECIBA LOS SIGUIENTES PARAMETROS : FECHA,ID PACIENTE,ID MEDICO Y LA OBSERVACION

	   --TOMAR EN CUENTA QUE QUE LOS ESTADOS PARA LOS TURNOS SON LOS SIGUIENTES:
	     --ESTADO=0(Pendiente)
		 --ESTADO=1(Realizado)
		 --ESTADO=2(Cancelado)

  --#18.CREAR UN PROCEDIMIENTO ALMACENADO QUE REGISTRE MEDICOS
     --.QUE RECIBA LOS SIGUIENTES PARAMETROS : NOMBRE,APELLIDO,ID ESPECIALIDAD,DESCRIPCION

  --#19.CREAR UNA FUNCION QUE SE ENCARGUE DE SUMAR 2 NUMEROS Y DEVUELVA SU RESULTADO

  --#20.MODIFICAR LA TABLA PACIENTE(MEDIANTE SCRIPTS)
   
       --AGREGAR UNA COLUMNA "estado" DE TIPO SMALLINT
	   
	   --ALTERAR LA COLUMNA "estado" Y PARA QUE SEA DE TIPO BIT

	   --ELIMINAR LA COLUMNA "estado"

   --#21.BORRAR COMPLETAMENTE UNA TABLA EN BASE DE DATOS

   --#22.BORRAR TODOS LOS REGISTROS DE UNA TABLA EN BASE DE DATOS

   --#23.IMPRIMIR LOS 2 PRIMEROS CARACTERES QUE APARECEN A LA IZQUIERDA EN LA PALABRA RAMIRO
       --DE MANERA QUE SOLO SE IMPRIMA LA PALABRA "RAMI" 

   --#24.IMPRIMIR LOS 2 PRIMEROS CARACTERES QUE APARECEN A LA DERECHA EN LA PALABRA RAMIRO
       --DE MANERA QUE SOLO SE IMPRIMA LA PALABRA "RO" 

   --#25.MOSTRAR LAS INICIALES DE LA LA PERSONA RAMIRO GONZALEZ DE MANERA QUE SE IMPRIMA LA 
       --LA SIGUIENTE PALABRA R.G
  
   --#26.CONTAR LA CANTIDAD DE CARACTERES QUE TIENE UNA PALABRA

   --#27.PASAR UNA CADENA DE CARACTERES A MAYUSCULAS

   --#28.PASAR UNA CADENA DE CARACTERES A MINUSCULAS

   --#29.IMPRIMIR EL NOMBRE 'ramiro gonzalez' DE MANERA QUE SE IMPRIMA DE ESTA MANERA "Ramiro Gonzalez"  

   --#30.TOMAR LA CADENA  'Ramir"o Gonz@alez' DE MANERA QUE SE IMPRIMA "Ramiro Gonzalez"
   
   --#31.REPETIR LA LETRA 'A' 8 VECES

   --#32.PARA LA SIGUIENTE HILERA '     Ramiro       Gonzalez   ' DE MANERA QUE SE IMPRIMA
       --DE LA SIGUIENTE MANERA 'Ramiro Gonzalez'
   
   --#33.CONCATENE 2 HILERAS

   --#34.OBTENER LA FECHA ACTUAL DEL SISTEMA DONDE ESTA INSTALADA LA BASE DE DATOS

   --#35.AGREGUE 5 DIAS A UNA FECHA EN PARTICULAR

   --#36.CONOCER LA DIFERENCIA ENTRE 2 FECHAS

   --#37.OBTENER EL DIA DE LA FECHA ACTUAL DEL SISTEMA

   --#38.SABER SI UNA FECHA TIENE EL FORMATO CORRECTO (USAR ISDATE) 

   --#39.CONVERTIR UNA VARIABLE DE TIPO MONEY A INT

   --#40.MEDIANTE LA FUNCION CONVERT PASAR LA FECHA 2019-04-09 A 2019/04/09

   --USO PRACTICO DE @@ROWCOUNT
   --#41.VER CUANTOS REGISTROS FUERON MODIFICADOS EN LA INSTRUCCION ANTERIOR

   --#42.CREAR UN PROCEDIMIENTO ALMACENADO PARA OBTENER LOS TURNOS DE UN PACIENTE

   --#43.CREAR UN PROCEDIMIENTO ALMACENADO PARA OBTENER EL HISTORIAL MEDICO DE UN PACIENTE
      --SI EXISTE INFORMACION ENTONCES DEVOLVER EL RESULTADO
	  --DE NO EXISTE LA INFORMACION SE DEBE DE MOSTRAR UN MENSAJE INDICANDOLO JUNTO CON EL RESULTADO "0" 
	
   --#44.CREAR UN PROCEDIMIENTO ALMACENADO PARA ACTUALIZAR LA INFORMACION DE UN PACIENTE(VERIFICAR SI EL PACIENTE QUE QUEREMOS MODIFICAR,EXISTE)  

   --#45.CREAR UN PROCEDIMIENTO ALMACENADO PARA BORRAR EL TURNO DE UN PACIENTE

   --#46.CREAR UNA FUNCION QUE RECIBA UN NUMERO ENTERO Y DEVUELVA SU FACTORIAL

   --#47.CREAR UNA FUNCION QUE ME DEVUELVA UNA LISTA DE PAISES(DE UNA TABLA TEMPORAL)

   --#48.CREAR UNA TABLA TEMPORAL EN MEMORIA

   --#49.CREAR UNA TABLA TEMPORAL FISICA

   --#50.CREAR UNA VISTA(INVESTIGAR MAS...)

   --#51.CREAR UN TRIGGER QUE SE DISPARE CADA VEZ QUE SE REGISTRE UN PACIENTE
       --ESTE TRIGGER GUARDARA INFORMACION EN UNA TABLA LOG

   --#52.CREAR UN BACKUP DE MI BASE DE DATOS

   --#53.CREAR UN BACKUP DE MI BASE DE DATOS MEDIANTE EL USO DE UN SCRIPT

   --#54.CREAR UNA TAREA PROGRAMADA PARA HACER UN RESPALDO DE UNA BASE DE DATOS TODOS LOS DIAS
       --A UNA HORA EN PARTICULAR
	    
   --#55.CREAR UN JOB PARA CANCELAR LOS TURNOS VENCIDOS

   --#56.CREAR UNA VISTA QUE MUESTRE LOS MEDICOS CON SUS ESPECIALIZADES

   --#57.CREAR UN LOGIN Y UN USUARIO USANDO EL ASISTENTE DE SQL SERVER

   --#58.CREAR UN ROL DE USUARIO USANDO EL ASISTENTE DE SQL SERVER

   --#59.CREAR UN LOGGIN DE USUARIO USANDO EL ASISTENTE DE SQL SERVER

   --#60.CREAR LOS ULTIMOS 3 PUNTOS USANDO UN SCRIPT DE TRANSAQ SQL	
   
   --#61.COLOCAR OBJETOS BAJO UN ESQUEMA DETERMINADO USANDO TRANSAQ SQL	

   --#62.DARLE PERMISOS TOTALES A UN USUARIO MEDIANTE db_owner

   --#63.IMPORTAR UN ARCHIVO DE EXCEL A SQL SERVER

--=============================PENDIENTE DE INVESTIGAR=============================

--1.CUANDO USAR UN TIPO DE DATO EN PARTICULAR PARA NUESTRAS TABLAS DE BASES DE DATOS

--2.AGREGAR EJERCISIOS PARA TODOS LOS TIPOS DE JOINS EXISTENTES

--3.AGREGAR EJERCISIOS PARA TODOS LOS TIPOS DE UNIONS EXISTENTES

