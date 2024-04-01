psql -U postgres
CREATE DATABASE desafio_2;
\c desafio_2;
CREATE TABLE inscritos(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO inscritos (cantidad, fecha, fuente) 
VALUES (44, TO_DATE('01/01/2021', 'MM/DD/YYYY'), 'Blog'),
	   (56, TO_DATE('01/01/2021', 'MM/DD/YYYY'), 'Página'),
	   (39, TO_DATE('01/02/2021', 'MM/DD/YYYY'), 'Blog'),
	   (81, TO_DATE('01/02/2021', 'MM/DD/YYYY'), 'Página'),
	   (12, TO_DATE('01/03/2021', 'MM/DD/YYYY'), 'Blog'),
	   (91, TO_DATE('01/03/2021', 'MM/DD/YYYY'), 'Página'),
	   (48, TO_DATE('01/04/2021', 'MM/DD/YYYY'), 'Blog'),
	   (45, TO_DATE('01/04/2021', 'MM/DD/YYYY'), 'Página'),
	   (55, TO_DATE('01/05/2021', 'MM/DD/YYYY'), 'Blog'),
	   (33, TO_DATE('01/05/2021', 'MM/DD/YYYY'), 'Página'),
	   (18, TO_DATE('01/06/2021', 'MM/DD/YYYY'), 'Blog'),
	   (12, TO_DATE('01/06/2021', 'MM/DD/YYYY'), 'Página'),
	   (34, TO_DATE('01/07/2021', 'MM/DD/YYYY'), 'Blog'),
	   (24, TO_DATE('01/07/2021', 'MM/DD/YYYY'), 'Página'),
	   (83, TO_DATE('01/08/2021', 'MM/DD/YYYY'), 'Blog'),
	   (99, TO_DATE('01/08/2021', 'MM/DD/YYYY'), 'Página');

--1. ¿Cuántos registros hay?
SELECT COUNT(*) FROM inscritos;

--2. ¿Cuántos inscritos hay en total? (1 Punto) 
SELECT SUM(cantidad) FROM inscritos;

--3. ¿Cuál o cuáles son los registros de mayor antigüedad? (1 Punto) HINT: ocupar subconsultas 
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

--4. ¿Cuántos inscritos hay por día? (Indistintamente de la fuente de inscripción) (1 Punto) 
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha;

--5. ¿Cuántos inscritos hay por fuente? (1 Punto) 
SELECT fuente, SUM(cantidad) FROM inscritos GROUP BY fuente;

--6. ¿Qué día se inscribió la mayor cantidad de personas? Y ¿Cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total_inscritos FROM inscritos GROUP BY fecha ORDER BY total_inscritos DESC LIMIT 1;

--7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron? (1 Punto) HINT: si hay más de un registro, tomar el primero 
SELECT fecha, SUM(cantidad) as total FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY total DESC LIMIT 1;

--8. ¿Cuál es el promedio de personas inscritas por día? Toma en consideración que la base de datos tiene un registro de 8 días, es decir, se obtendrán 8 promedios. (1 Punto)
SELECT fecha, AVG(cantidad) FROM inscritos GROUP BY fecha; 

--9. ¿Qué días se inscribieron más de 50 personas? (1 Punto) 
SELECT fecha, SUM(cantidad) AS total_inscritos FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;

--10. ¿Cuál es el promedio por día de personas inscritas? Considerando sólo calcular desde el tercer día. (1 Punto)
SELECT fecha, AVG(cantidad) FROM inscritos WHERE fecha >= '2021-01-03' GROUP BY fecha;
