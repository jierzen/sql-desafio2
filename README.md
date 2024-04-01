# Desafío 2 - Módulo SQL 🚀
## Contexto 📚

Una empresa dedicada a la educación en inglés nos ha facilitado un conjunto de datos con información sobre los inscritos a sus cursos. Las inscripciones se han realizado tanto por medio de su página web como a través de su blog. El análisis de estos datos nos ayudará a determinar cuál de estos canales genera mayor impacto y preferencia entre los futuros estudiantes.

## Set de Datos 📊

El set de datos contiene las siguientes columnas:

- `cantidad`: Número de inscritos.
- `fecha`: Fecha de inscripción.
- `fuente`: Medio por el cual se realizó la inscripción (`Blog` o `Página`).
```sql
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
```
## Desarrollador 👨‍💻
Este desafío fue desarrollado por: `Jorge Espinoza Ramirez`
