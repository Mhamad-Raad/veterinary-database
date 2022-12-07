/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth date,
    escape_attempts INT,
    neutered BOOL,
    weight_kg decimal
);

ALTER TABLE animals 
ADD COLUMN species VARCHAR;