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


create table vets(
	id serial primary key,
	name text,
	age int,
	date_of_graduation date
);


create table specializations(
	species_id int,
	vets_id int
);

create table visits (
	vets_id int,
	animals_id int,
	visit_data date
);

CREATE INDEX visits_index
on visits (animals_id, vets_id);

CREATE INDEX email_owners
on owners (email);

CREATE INDEX vetID_visits
on visits (vets_id);
