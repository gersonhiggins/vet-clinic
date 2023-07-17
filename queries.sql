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

/* multiple tables query */
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) AS animal_count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
  AND species.name = 'Digimon';

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.id) AS animal_count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

/* Queries for visits, specializations and vets */ 
SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Vet William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT visits.animal_id)
FROM visits
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Vet Stephanie Mendez';

SELECT vets.name, species.name AS specialty
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Vet Stephanie Mendez'
      AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.animal_id) AS visit_count
FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Vet Maisy Smith'
ORDER BY visits.visit_date
LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, visits.visit_date
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(*)
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id
WHERE specializations.vet_id IS NULL;

SELECT species.name
FROM species
JOIN animals ON species.id = animals.species_id
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Vet Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(*) DESC
LIMIT 1;

/* UPDATED QUERIES FOR IMPROVE TIME */

SELECT visits_count FROM animals WHERE id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';