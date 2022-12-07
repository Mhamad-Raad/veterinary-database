/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts,
          neutered, weight_kg) 
          VALUES (0, 'Agumon', '3-FEB-2020', 0, TRUE, 10.23)

INSERT INTO animals (id, name, date_of_birth, escape_attempts,
          neutered, weight_kg) 
          VALUES (1, 'Gabumon', '15-NOV-2018', 2, TRUE, 8)

INSERT INTO animals (id, name, date_of_birth, escape_attempts,
          neutered, weight_kg) 
          VALUES (2, 'Pikachu', '7-JAN-2021', 1, FALSE, 15.04)

INSERT INTO animals (id, name, date_of_birth, escape_attempts,
          neutered, weight_kg) 
          VALUES (3, 'Devimon', '12-MAY-2017', 5, TRUE, 11)

insert into animals (id, name, date_of_birth, escape_attempts,
          neutered, weight_kg) 
          VALUES (4, 'Charmander', '8-FEB-2020', 0, FALSE, 11),
          (5, 'Plantmon', '8-FEB-2020', 2, TRUE, 5.7),
          (6, 'Squirtle', '2-APR-1993', 3, FALSE, 12.13),
          (7, 'Angemon', '12-JUN-2005', 1, TRUE, 45),
          (8, 'Boarmon', '7-JUN-2005', 7, TRUE, 20.4 ),
          (9, 'Blossom', '13-OCT-1998', 0, TRUE, 17 ),
          (10, 'Ditto', '14-MAY-2022', 4, TRUE, 22 );

insert into owners (full_name, age) values
	('Sam Smith', 34),
	('Jennifer Orwell', 19),
	('bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);


insert into species (name) values
  ('Pokemon'),
  ('Digimon');


  update animals set species_id = 
(select id from species where name = 'Digimon') where
name like '%mon%'

update animals set species_id = 
(select id from species where name = 'Pokemon') where
species_id is NULL

  update animals set owner_id = 
(select id from owners where full_name = 'Sam Smith') where 
name = 'Agumon'

update animals set owner_id = 
(select id from owners where full_name = 'Jennifer Orwell') where 
name = 'Pikachu' or name = 'Gabumon'

update animals set owner_id = 
(select id from owners where full_name = 'Bob') where 
name = 'Devimon' or name = 'Plantmon'

update animals set owner_id = 
(select id from owners where full_name = 'Melody Pond') where 
name = 'Charmander' or name = 'Squirtle' or name = 'Blossom'

update animals set owner_id = 
(select id from owners where full_name = 'Dean Winchester') where 
name = 'Angemon' or name = 'Boarmon'
