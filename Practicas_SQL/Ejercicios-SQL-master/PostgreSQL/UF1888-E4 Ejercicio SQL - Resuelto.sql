SET DATESTYLE TO 'European';

CREATE TABLE temple1 (
	nuempl CHAR(6) NOT NULL,
	nombre CHAR(12) NOT NULL,
	inicial CHAR(1) NOT NULL,
	apellido CHAR(15) NOT NULL,
	dept CHAR(3) NOT NULL,
	tlfn CHAR(4),
	feching  DATE NOT NULL,
	codtra SMALLINT NOT NULL,
	niveduc SMALLINT NOT NULL,
	sexo CHAR(1) NOT NULL,
	fechnac DATE  NOT NULL,
	salario DECIMAL(9,2) NOT NULL
 );

CREATE TABLE tdepar2 (
	numdep CHAR(3) NOT NULL,
	nomdep CHAR(36) NOT NULL,
	numdirec CHAR(6) NOT NULL
);

INSERT INTO temple1 ( nuempl, nombre, inicial, apellido, dept, tlfn, feching, codtra, niveduc, sexo, fechnac, salario )
	VALUES	( 10, 'CRISTINA', 'I', 'HERNANDEZ', 'A00', 2070, '01.01.1965', 66, 18, 'M', '14.08.1933', 5275 ),
		( 20, 'MIGUEL', 'L', 'TAPIA', 'B01', 2140, '10.10.1973', 61, 18, 'H', '02.02.1948', 4125 ),
		( 30, 'SALOME', 'A', 'KEMPES', 'C01', 2080, '05.04.1975', 60, 20, 'M', '11.05.1941', 3825 ),
		( 50, 'JUAN', 'B', 'GARRIDO', 'E01', 1507, '17.08.1949', 58, 16, 'H', '15.09.1925', 4017 ),
		( 60, 'ISIDRO', 'F', 'SUAREZ', 'D11', 2290, '14.09.1973', 55, 16, 'H', '07.07.1945', 3225 ),
		( 70, 'EVA', 'D', 'PUENTE', 'D21', 2400, '30.09.1980', 56, 16, 'M', '26.05.1953', 3617 ),
		( 90, 'ELENA', 'W', 'HERRANZ', 'E11', 2230, '15.08.1970', 55, 16, 'M', '15.05.1941', 2945 ),
		( 100, 'TOMAS', 'Q', 'SOLER', 'E21', 2170, '19.06.1980', 54, 14, 'H', '18.12.1956', 2615 ),
		( 110, 'VICENTE', 'G', 'LUENGO', 'A00', 1140, '16.05.1958', 58, 19, 'H', '05.11.1929', 4650 ),
		( 120, 'SIMON', '', 'OTERO', 'A00', 2022, '05.12.1963', 58, 14, 'H', '18.10.1942', 2925 ),
		( 130, 'DOLORES', 'M', 'QUINTANA', 'C01', 2140, '28.07.1971', 55, 16, 'M', '15.09.1925', 2380 ),
		( 140, 'HELIODORA', 'A', 'NIETO', 'C01', 2210, '15.12.1976', 56, 18, 'M', '19.01.1946', 2842 ),
		( 150, 'BRUNO', '', 'ALVAREZ', 'D11', 2250, '12.02.1971', 55, 16, 'H', '17.05.1947', 2528 ),
		( 160, 'ELISA', 'R', 'PINTO', 'D11', 1307, '11.10.1977', 54, 17, 'M', '12.04.1955', 2225 ),
		( 170, 'MATEO', 'J', 'YARZA', 'D11', 2050, '15.09.1978', 54, 16, 'H', '05.01.1951', 2468 ),
		( 180, 'MARINA', 'S', 'SANDOVAL', 'D11', 1050, '07.07.1973', 53, 17, 'M', '21.02.1949', 2134 ),
		( 190, 'JAIME', 'H', 'WALKER', 'D11', 2100, '27.07.1974', 53, 16, 'H', '25.06.1952', 2045 ),
		( 200, 'DAVID', '', 'BONDIA', 'D11', 2340, '03.03.1966', 55, 16, 'H', '29.05.1941', 2774 ),
		( 210, 'WENCESLAO', 'T', 'JURADO', 'D11', 2310, '11.04.1979', 52, 17, 'H', '23.02.1953', 1827 ),
		( 220, 'JIMENA', 'K', 'LUQUE', 'D11', 2300, '29.08.1968', 55, 18, 'M', '19.03.1948', 2984 ),
		( 230, 'JAIME', 'J', 'JIMENEZ', 'D21', 1080, '21.11.1966', 53, 14, 'H', '30.05.1935', 2218 ),
		( 240, 'SALVADOR', 'M', 'MARTINEZ', 'D21', 2260, '05.12.1979', 55, 17, 'H', '31.03.1954', 2876 ),
		( 250, 'DANIEL', 'S', 'SIERRA', 'D21', 2357, '30.10.1969', 52, 15, 'H', '12.11.1939', 1918 ),
		( 260, 'SUSANA', 'P', 'JUNQUERA', 'D21', 2302, '11.09.1975', 52, 16, 'M', '05.10.1936', 1725 ),
		( 270, 'MARIA', 'L', 'PEREZ', 'D21', 2217, '30.09.1980', 55, 15, 'M', '23.05.1953', 2738 ),
		( 280, 'ENGRACIA', 'R', 'SANCHEZ', 'E11', 2007, '24.03.1967', 54, 17, 'M', '15.05.1941', 2598 ),
		( 290, 'JUAN', 'R', 'PALACIOS', 'E11', 2192, '30.05.1980', 42, 12, 'H', '09.07.1946', 1380 ),
		( 300, 'PEDRO', 'I', 'SIERRA', 'E11', 3522, '19.06.1972', 48, 14, 'H', '27.10.1936', 1775 ),
		( 310, 'MATILDE', 'F', 'SERNA', 'E11', 2130, '12.09.1964', 43, 12, 'M', '21.04.1931', 1574 ),
		( 320, 'RAMON', 'V', 'MORAN', 'E21', 7112, '07.07.1965', 52, 16, 'H', '11.08.1932', 1995 ),
		( 330, 'WILLY', '', 'LERMA', 'E21', 1132, '23.02.1976', 55, 14, 'H', '18.07.1941', 2537 ),
		( 340, 'JAVIER', 'R', 'GIL', 'E21', 1162, '05.05.1947', 54, 16, 'H', '17.05.1926', 2384 ),
		( 999, 'ANGEL', 'E', 'MALDONADO', 'E11', '----', '22.03.1988', 69, 20, 'H', '12.11.1965', 7500 );

INSERT INTO tdepar2 ( numdep, nomdep, numdirec ) 
	VALUES 	( 'A00', 'CENTRO PROCESOS', 000010 ),
		( 'B01', 'PLANIFICACION', 000020 ),
		( 'C01', 'INFORMACION', 000030 ),
		( 'D01', 'DESARROLLO', '' ),
		( 'D11', 'FABRICACION', 000060 ),
		( 'D21', 'ADMINISTRACION', 000070 ),
		( 'E01', 'SERVICIOS', 000050 ),
		( 'E11', 'OPERACIONES', 000090 ), 
		( 'E21', 'SOFTWARE', 000100 );

-- Obtener una lista de todas las empleadas de los departamentos que empiecen por D y por E. La lista anterior debe contener información sobre el número de personal, nombre, apellido y número de teléfono.

SELECT nuempl, nombre, apellido, tlfn , nomdep
	FROM temple1
		INNER JOIN tdepar2 ON (temple1.dept = tdepar2.numdep)
	WHERE sexo='M' AND (tdepar2.nomdep LIKE 'D%' OR tdepar2.nomdep LIKE 'E%');

-- Con numdept en vez de nondept

SELECT nuempl, nombre, apellido, tlfn , nomdep
	FROM temple1
		INNER JOIN tdepar2 ON (temple1.dept = tdepar2.numdep)
	WHERE sexo='M' AND (tdepar2.numdep LIKE 'D%' OR tdepar2.numdep LIKE 'E%');
	
-- Obtener un listado de todos los empleados (nombre y apellido) que ganan más de 2000€ al mes y que entraron en la compañía después del 1 de Enero de 1975. También se quiere la información correspondiente a su código de trabajo y al número de personal de sus directores.

SELECT nombre, apellido, codtra, numdirec
	FROM temple1
		INNER JOIN tdepar2 ON (temple1.dept = tdepar2.numdep)
	WHERE salario > 2000 AND feching > '01/01/1975';

-- Obtener una lista con el apellido, número de departamento y salario mensual de los empleados de los departamentos ‘A00’, ‘B01’, ‘C01’ y ‘D01’. La salida se quiere en orden descendente de salario dentro de cada departamento.

SELECT apellido, dept, salario
	FROM temple1
	WHERE dept IN ( 'A00', 'B01', 'C01' , 'D01')
	ORDER BY dept, salario DESC;

-- Se pide una lista que recupere el salario medio de cada departamento junto con el número de empleados que tiene. El resultado no debe incluir empleados que tengan un código de trabajo mayor que 54, ni departamentos con menos de tres empleados. Se quiere ordenada por número de departamento.

SELECT salario, numempl
	FROM (
		SELECT AVG(salario) as salario, COUNT(*) AS numempl, dept
			FROM temple1
			WHERE NOT codtra > 54 
			GROUP BY dept
	) AS result
	WHERE NOT numempl < 3
	ORDER BY dept ASC;

-- Otra forma

SELECT dept, AVG(salario) , COUNT(*)
    FROM temple1
    WHERE codtra <= 54
    GROUP BY dept
    HAVING COUNT(*) > 2
    ORDER BY dept
;

-- Seleccionar todos los empleados de los departamentos ‘D11’ y ‘E11’ cuyo primer apellido empiece por S.

SELECT * 
	FROM temple1
	WHERE dept IN ( 'D11', 'E11' ) AND apellido LIKE 'S%';

-- Obtener el nombre, apellido y fecha de ingreso de los directores de departamento ordenados por número de personal.


SELECT nombre, apellido, feching 
	FROM temple1
	WHERE CAST(nuempl AS INT) IN ( 
					SELECT CAST(numdirec AS INT) FROM tdepar2 WHERE numdirec <> '' 
				     )
	ORDER BY CAST(nuempl AS INT);

-- Otra forma

SELECT nuempl, nombre, apellido, feching
    FROM temple1 , tdepar2
    WHERE temple1.nuempl = tdepar2.numdirec
    ORDER BY CAST(nuempl AS INT)
;

-- Obtener un listado de las mujeres de los departamentos que empiecen por D y por E cuyo nivel de educación sea superior a la media; en este caso también ordenados por número de personal.

-- Ceñido al enunciado

SELECT nuempl, nombre, apellido, tlfn , nomdep
	FROM temple1
		INNER JOIN tdepar2 ON (temple1.dept = tdepar2.numdep)
	WHERE sexo='M' AND (tdepar2.nomdep LIKE 'D%' OR tdepar2.nomdep LIKE 'E%') AND niveduc > ( SELECT AVG(niveduc) FROM temple1 )
	ORDER BY nuempl;

-- Numdep en vez de nomdep

SELECT nuempl, nombre, apellido, tlfn , nomdep
	FROM temple1
		INNER JOIN tdepar2 ON (temple1.dept = tdepar2.numdep)
	WHERE sexo='M' AND (tdepar2.numdep LIKE 'D%' OR tdepar2.numdep LIKE 'E%') AND niveduc > ( SELECT AVG(niveduc) FROM temple1 )
	ORDER BY nuempl;

-- Otra forma

SELECT nuempl, nombre, apellido
    FROM temple1
    WHERE sexo = 'M' AND (dept LIKE 'D%' OR dept LIKE 'E%')
    AND niveduc > (SELECT AVG(niveduc) FROM temple1)
    ORDER BY CAST(nuempl AS INT)
;

-- Seleccionar todos los empleados cuyo nombre sea igual al de algunas personas del departamento D21 y cuyo código de trabajo sea diferente de todos los del E21 (la lista debe contener el número de personal, nombre, apellido, departamento y código de trabajo).

SELECT * 
	FROM temple1
	WHERE 	nombre IN (SELECT nombre FROM temple1 WHERE dept='D21') AND 
		codtra NOT IN (SELECT codtra FROM temple1 WHERE dept='E21') AND
		dept <> 'D21';

SELECT nuempl, nombre, apellido, dept, codtra
    FROM temple1
    WHERE nombre = ANY (SELECT nombre FROM temple1
                            WHERE dept = 'D21')
    AND codtra <> ALL ( SELECT codtra FROM temple1
                            WHERE dept = 'E21')
    AND dept <> 'D21'
;
-- Listar los empleados que no sean directores (la información que debe aparecer es el número de personal, apellido y departamento).



SELECT *
	FROM temple1
	WHERE CAST(nuempl AS INT) NOT IN (SELECT CAST(numdirec AS INT) FROM tdepar2 WHERE numdirec <> '' );


-- Seleccionar parejas de empleados (de sexo opuesto) que hayan nacido el mismo día (con información acerca de apellido y fecha de nacimiento).

SELECT * 
	FROM temple1
	WHERE fechnac = (SELECT fechnac FROM temple1 WHERE sexo = 'M'
			INTERSECT
				SELECT fechnac FROM temple1 WHERE sexo = 'H');


-- Obtener un listado de todos los empleados que pertenecen al mismo departamento que Tomás Soler.

SELECT * 
	FROM temple1
	WHERE dept = (select dept from temple1 WHERE nombre = 'Tomás' AND apellido = 'Soler');

-- Sin Tilde
SELECT * 
	FROM temple1
	WHERE dept = (select dept from temple1 WHERE nombre = 'TOMAS' AND apellido = 'SOLER');