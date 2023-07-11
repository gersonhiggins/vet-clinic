ALTER TABLE animals ADD SPECIES TEXT;
UPDATE animals SET SEPECIES = 'undefined';
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;