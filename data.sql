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

-- add data to the tables 

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



insert into vets (name, age, date_of_graduation) values
	('William Tatcher', 45, '23-APR-2000'),
	('Maisy Smith', 26, '17-JAN-2019'),
	('Stephanie Mendez', 64, '4-MAY-1981'),
	('Jack Harkness', 38, '8-JUN-2008');



insert into specializations (species_id, vets_id) values
	(1, 1), (3, 1), (3, 2), (4, 2);

  insert into vets (name, age, date_of_graduation) values
	('William Tatcher', 45, '23-APR-2000'),
	('Maisy Smith', 26, '17-JAN-2019'),
	('Stephanie Mendez', 64, '4-MAY-1981'),
	('Jack Harkness', 38, '8-JUN-2008');
	
	
	
insert into specializations (species_id, vets_id) values
	(1, 1), (3, 1), (3, 2), (4, 2)



insert into visits (vets_id, animals_id, visit_data) values 
	(1, 0, '24-MAY-2020'),
	(3, 0, '22-JUL-2020'),
	(4, 1, '2-FEB-2021'),
	(2, 2, '5-JAN-2020'),
	(2, 2, '8-MAR-2020'),
	(2, 2, '14-MAY-2020'),
	(3, 3, '4-MAY-2021'),
	(4, 4, '24-FEB-2021'),
	(2, 5, '21-DEC-2019'),
	(1, 5, '10-AUG-2020'),
	(2, 5, '7-APR-2021'),
	(3, 6, '29-SEP-2019'),
	(4, 7, '3-OCT-2020'),
	(4, 7, '4-NOV-2020'),
	(2, 8, '24-JAN-2019'),
	(2, 8, '15-MAY-2019'),
	(2, 8, '27-FEB-2020'),
	(2, 8, '3-AUG-2020'),
	(3, 9, '24-MAY-2020'),
	(1, 9, '11-JAN-2021');


-- Insert data into the tables
INSERT INTO visits (animals_id, vets_id, visit_data) SELECT * FROM (SELECT id FROM animals) animals_id, (SELECT id FROM vets) vets_id, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_data;
INSERT into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
