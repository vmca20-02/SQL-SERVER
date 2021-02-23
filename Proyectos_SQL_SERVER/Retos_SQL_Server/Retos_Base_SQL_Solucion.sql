
--#16.

ALTER PROCEDURE spInsertPaciente
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@nacimiento DATE,
@domicilio VARCHAR(50),
@idPais INT,
@telefono VARCHAR(20),
@email VARCHAR(30),
@observacion VARCHAR(1000),
@fechaAlta DATETIME
AS
BEGIN

DECLARE @idPaciente INT;

SET @idPaciente=ISNULL((SELECT MAX(idPaciente) FROM Paciente),1);

INSERT INTO Paciente(idPaciente,nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion,fechaAlta)
     VALUES(@idPaciente,@nombre,@apellido,@nacimiento,@domicilio,@idPais,@telefono,@email,@observacion,@fechaAlta)

END

--EJECUCION DEL PROCEDIMIENTO ALMACENADO

--EXEC pInsertPaciente @nombre='Victor',
--                     @apellido='Carvajal',
--                     @nacimiento='3/30/1989',
--                     @domicilio='Los llanos de la Garita',
--                     @idPais=1,
--                     @telefono='2487-54-29',
--                     @email='VMCA20@Gmail.com',
--                     @observacion='Este es un dato de prueba para este procedimiento',
--                     @fechaAlta='6/21/2020 11:00:00'


--#42.

ALTER PROCEDURE spGetTurnosByPaciente
@idPaciente INT
AS
BEGIN

SELECT pac.nombre,pac.apellido,turn.fechaAlta,turn.estado
FROM Turno turn INNER JOIN TurnoPaciente turnPac ON turnPac.idTurno=turn.idTurno
     INNER JOIN Paciente pac ON pac.idPaciente=turnPac.idPaciente
WHERE pac.idPaciente=@idPaciente

END

--EJECUCION DEL PROCEDIMIENTO ALMACENADO

--EXEC pGetTurnosByPaciente @idPaciente=1

--#44.

ALTER PROCEDURE spUpdatePaciente
@idPaciente INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@fNacimiento DATE,
@domicilio VARCHAR(50), 
@idPais INT,
@telefono VARCHAR(20), 
@email VARCHAR(30), 
@observacion VARCHAR(1000), 
@fechaAlta DATETIME 
AS
BEGIN

IF(EXISTS(SELECT * FROM Paciente WHERE idPaciente=@idPaciente))

UPDATE Paciente
SET  nombre =@nombre
    ,apellido =@apellido
    ,fNacimiento =@fNacimiento
    ,domicilio=@domicilio
    ,idPais =@idPais 
    ,telefono =@telefono
    ,email = @email
    ,observacion = @observacion
    ,fechaAlta =@fechaAlta
WHERE idPaciente=@idPaciente

ELSE

SELECT 0 AS Result 

END

--#45

ALTER PROCEDURE spDeleteTurno
@idTurno INT
AS
BEGIN

IF EXISTS(SELECT * FROM TurnoPaciente turnPac INNER JOIN Turno turn ON turnPac.idTurno=turn.idTurno)

BEGIN

BEGIN TRAN

DELETE FROM TurnoPaciente WHERE idTurno=@idTurno

IF @@ROWCOUNT>0
BEGIN

DELETE FROM Turno WHERE idTurno=@idTurno 

IF @@ROWCOUNT>0
BEGIN

PRINT 'REGISTRO ELIMINADO CON EXITO'

COMMIT TRAN

END
ELSE
BEGIN

PRINT 'HA OCURRIDO UN ERROR'

ROLLBACK TRAN

END

END

END

ELSE
BEGIN

PRINT 'EL REGISTRO QUE DESEA ELIMINAR NO EXISTE'

END

END

--EXEC spDeleteTurno @idTurno=3

CREATE FUNCTION getFullDate(@pDate datetime)
RETURNS varchar(30)
AS
BEGIN

RETURN FORMAT(@pDate, N'dddd, MMMM dd, yyyy');

END

--SELECT dbo.getFullDate(getdate())





