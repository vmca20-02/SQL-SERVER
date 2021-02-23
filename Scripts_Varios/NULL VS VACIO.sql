IF OBJECT_ID('tempdb..#tablaTemp' ) IS NOT NULL

DROP TABLE #tablaTemp

CREATE TABLE #tablaTemp( cve TINYINT IDENTITY(1,1) , valor VARCHAR(10) )

INSERT INTO #tablaTemp( valor )

VALUES( 'UNO') ,( 'DOS' ),( '') ,( 'CUATRO') , ('CINCO') , (NULL),('SIETE'),('OCHO'),(NULL),('DIEZ');

--SELECT * FROM #tablaTemp WHERE valor = ''

--SELECT * FROM #tablaTemp WHERE valor IS NULL

DECLARE @vNULL AS NVARCHAR(10) = NULL

DECLARE @vVACIO AS NVARCHAR(10) = ''

DECLARE @vSTRING AS NVARCHAR(10) = 'CADENA'

/*SELECT
	  CASE WHEN @vNULL = @vVACIO THEN 1 ELSE 0 END AS 'Nulo es igual a vacio'

	, CASE WHEN @vNULL <> @vVACIO THEN 1 ELSE 0 END AS 'Nulo es diferente a vacio'

	, CASE WHEN @vNULL = @vSTRING THEN 1 ELSE 0 END AS 'Nulo es igual a una hilera'

	, CASE WHEN @vNULL <> @vSTRING THEN 1 ELSE 0 END AS 'Nulo es diferente a una hilera'

	, CASE WHEN @vVACIO = @vSTRING THEN 1 ELSE 0 END AS 'Vacio es igual a una hilera'

	, CASE WHEN @vVACIO <> @vSTRING THEN 1 ELSE 0 END AS 'Vacio es diferente a una hilera'*/

--TOMAR EN CUENTA Este es otro ejemplo, como podemos observar NULL no es igual a VACIO y tampoco es DIFERENTE a VACIO


SELECT
	 CASE WHEN ISNULL( @vNULL , '' ) = @vVACIO THEN 1 ELSE 0 END AS 'Nulo es igual a vacio'

	, CASE WHEN ISNULL( @vNULL , '' ) <> @vVACIO THEN 1 ELSE 0 END AS 'Nulo es diferente a vacio'

	, CASE WHEN ISNULL( @vNULL , '' ) = @vSTRING THEN 1 ELSE 0 END AS 'Nulo es igual a una hilera'

	, CASE WHEN ISNULL( @vNULL , '' ) <> @vSTRING THEN 1 ELSE 0 END AS 'Nulo es diferente a una hilera'



USE tempdb

DECLARE @c INT

CREATE TABLE #prueba( ide INT IDENTITY(1,1), valor VARCHAR(10) )

SET @c = 1

WHILE @c <1000

BEGIN

   INSERT INTO #prueba( valor ) VALUES( '' )

   SET @c= @c+1

   END
 
   SELECT * FROM #prueba

   EXEC sp_spaceused #prueba

   DROP TABLE #prueba


USE tempdb

DECLARE @c INT

CREATE TABLE #prueba( ide INT IDENTITY(1,1), valor VARCHAR(10) )

	SET @c = 1

	WHILE @c<1000

	BEGIN

	INSERT INTO #prueba( valor ) VALUES( NULL )
       
	SET @c= @c+1

	END

	SELECT * FROM #prueba

	--EXEC sp_spaceused #prueba

	DROP TABLE #prueba


-- (=)SOLO COMPARA VALORES MIENTRAS (is) SOLO COMPARA ESTADOS

DECLARE @TEST_VARIABLE VARCHAR(10)

SET @TEST_VARIABLE=NULL

IF @TEST_VARIABLE= NULL BEGIN

SELECT 'SE CUMPLIO LA INSTRUCCION'

END

ELSE BEGIN

SELECT 'NO SE CUMPLIO LA INSTRUCCION'

END


IF @TEST_VARIABLE IS NULL BEGIN

SELECT 'SE CUMPLIO LA INSTRUCCION'

END

ELSE BEGIN

SELECT 'NO SE CUMPLIO LA INSTRUCCION'

END


