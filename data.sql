/* animals aditions */
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (1, 'Agumon', '03/02/2020', 0, true, 10.23);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (2, 'Gabumon', '15/11/2018', 2, true, 8);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (3, 'Pikachu', '07/01/2021', 1, false, 15.04);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (4, 'Devimon', '12/05/2017', 5, true, 11);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

/* owners aditions */
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

/* species aditions */
INSERT INTO species (name)
VALUES ('Digimon'),
       ('Pokemon');

/* setting species */
UPDATE animals
SET species_id = CASE 
                    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
                    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
                END;

/* Setting owners */
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE
  (animals.name = 'Agumon' AND owners.full_name = 'Sam Smith') OR
  (animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell') OR
  (animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob') OR
  (animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond') OR
  (animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester');

/* Setting Vets */
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, '2000-04-23'),
       ('Vet Maisy Smith', 26, '2019-01-17'),
       ('Vet Stephanie Mendez', 64, '1981-05-04'),
       ('Vet Jack Harkness', 38, '2008-06-08');
/* Set specializations */
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 2);

INSERT INTO specializations (vet_id, species_id)
VALUES (3, 1),
       (3, 2);

INSERT INTO specializations (vet_id, species_id)
VALUES (4, 1);
/* set visits */
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (1, 1, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (1, 2, '2020-07-22');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (2, 3, '2021-02-02');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-01-05');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-03-08');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-05-14');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (4, 2, '2021-05-04');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (5, 3, '2021-02-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 2, '2019-12-21');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 1, '2020-08-10');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 2, '2021-04-07');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (7, 2, '2019-09-29');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (8, 3, '2020-10-03');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (8, 3, '2020-11-04');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2019-01-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2019-05-15');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2020-02-27');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2020-08-03');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (10, 2, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (10, 1, '2021-01-11');