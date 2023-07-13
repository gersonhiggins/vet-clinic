CREATE TABLE animals (
    ID SERIAL PRIMARY  KEY     NOT NULL,
    NAME               TEXT    NOT NULL,
    DATE_OF_BIRTH      DATE    NOT NULL,
    ESCAPE_ATTEMPTS    INT     NOT NULL,
    NEUTERED           BOOLEAN NOT NULL,
    WEIGHT_KG          DECIMAL NOT NULL,
    species_id INTEGER REFERENCES species(id),
    owner_id   INTEGER REFERENCES owners(id)
);
CREATE TABLE owners (
    id SERIAL PRIMARY KEY  NOT NULL,
    full_name         TEXT NOT NULL,
    age               INT  NOT NULL,
)
CREATE TABLE species (
    id SERIAL PRIMARY KEY  NOT NULL,
    name              TEXT NOT NULL,
)
CREATE TABLE vets (
    id                  SERIAL PRIMARY KEY,
    name                TEXT,
    age                 INTEGER,
    date_of_graduation  DATE
);
CREATE TABLE specializations (
    vet_id     INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);