ALTER TABLE animals ADD SPECIES TEXT;
UPDATE animals SET SPECIES = 'undefined';
UPDATE animals
SET SPECIES = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET SPECIES = 'pokemon'
WHERE SPECIES LIKE 'undefined';