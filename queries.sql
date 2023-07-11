/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE NAME LIKE '%mon%';
SELECT NAME FROM animals WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED = true AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon', 'Pikachu');
SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
SELECT * FROM animals WHERE NEUTERED = true;
SELECT * FROM animals WHERE NAME != 'Gabumon';
SELECT * FROM animals WHERE WEIGHT_KG BETWEEN 10.4 AND 17.3;

/* first transaction */
BEGIN TRANSACTION;

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals; 

/*second transaction */
BEGIN TRANSACTION;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

/* thrid transactipn */
BEGIN TRANSACTION;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

/* fourth transaction */ 
BEGIN TRANSACTION;

DELETE FROM animals WHERE DATE_OF_BIRTH > '2022-01-01';

SELECT * FROM animals;

SAVEPOINT my_savepoint;

UPDATE animals SET WEIGHT_KG = WEIGHT_KG * -1;

SELECT * FROM animals;

ROLLBACK TO SAVEPOINT my_savepoint;

SELECT * FROM animals;

UPDATE animals SET WEIGHT_KG = WEIGHT_KG * -1 WHERE WEIGHT_KG < 0;

SELECT * FROM animals;

COMMIT;


/* queries */ 
SELECT COUNT(*) AS animal_count FROM animals;

SELECT COUNT(*) AS animals_never_escaped
FROM animals
WHERE ESCAPE_ATTEMPTS = 0;

SELECT AVG(WEIGHT_KG) AS average_weight
FROM animals;

SELECT NEUTERED, SUM(ESCAPE_ATTEMPTS) AS total_escape_attempts
FROM animals
GROUP BY NEUTERED
ORDER BY total_escape_attempts DESC
LIMIT 1;

SELECT SPECIES, MIN(WEIGHT_KG) AS min_weight, MAX(WEIGHT_KG) AS max_weight
FROM animals
GROUP BY SPECIES;

SELECT SPECIES, AVG(ESCAPE_ATTEMPTS) AS average_escape_attempts
FROM animals
WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY SPECIES;