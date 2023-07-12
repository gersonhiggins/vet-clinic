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
