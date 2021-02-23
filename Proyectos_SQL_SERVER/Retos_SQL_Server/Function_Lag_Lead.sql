
--RESOURCE MATERIAL :https://soportesql.wordpress.com/2015/01/21/funciones-lag-y-lead-en-sql-server/

CREATE DATABASE dbPracticeDatabase
GO
USE dbPracticeDatabase
GO

CREATE TABLE PreciosProducto
(NombreProducto VARCHAR(100), FechaEvaluacion DATETIME, Precio MONEY)
GO

INSERT INTO PreciosProducto (NombreProducto,FechaEvaluacion, Precio) VALUES
('Pintura Spray Rojo Fuego','01-01-2015', 23.32),
('Pintura Spray Rojo Fuego','01-02-2015', 26.11),
('Pintura Spray Rojo Fuego','01-03-2015', 25.26),
('Pintura Spray Rojo Fuego','01-04-2015', 30.45),
('Pintura Spray Rojo Fuego','01-05-2015', 30.20),
('Pintura Spray Rojo Fuego','01-06-2015', 31.12),
('Pintura Spray Rojo Fuego','01-07-2015', 25.75),
('Pintura Spray Rojo Fuego','01-08-2015', 24.21),
('Pintura Spray Rojo Fuego','01-09-2015', 25.12),
('Pintura Spray Rojo Fuego','01-10-2015', 28.26)


SELECT NombreProducto,FechaEvaluacion,Precio,
       LAG(Precio) OVER (ORDER BY FechaEvaluacion) AS PrecioAnterior,
	   LEAD(Precio) OVER (ORDER BY FechaEvaluacion) AS PrecioSiguiente
FROM PreciosProducto
ORDER BY FechaEvaluacion