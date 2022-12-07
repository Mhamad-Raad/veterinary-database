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

-- create new tables
create table owners (
	full_name text,
	age INT,
	id SERIAL PRIMARY KEY
);

create table species (
	name text,
	id SERIAL PRIMARY KEY
);

alter table animals drop species;
-- alter old table
alter table animals add species_id int;
alter table animals add owner_id int;