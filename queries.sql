/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE date_of_birth BETWEEN '1-FEB-2016'
AND '12-31-2019'

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'

SELECT name, escape_attempts FROM animals where weight_kg > 10.5

SELECT * FROM animals where neutered = TRUE

SELECT * FROM animals WHERE name != 'Gabumon'

SELECT * FROM animals WHERE weight_kg <= 17.3 AND weight_kg >= 10.4


begin;

update animals set species = 'unspecified';

rollback;


begin

update animals set species = 'digimon' where name like '%mon%';
update animals set species = 'pokemon' where species is NULL;

commit


begin

delete from animals

rollback


begin

delete FROM animals WHERE date_of_birth > '1-JAN-2022'

savepoint one

update animals set weight_kg = weight_kg * -1

rollback to savepoint one

update animals set weight_kg = weight_kg * -1 where weight_kg < 0

commit 

select avg(weight_kg) from animals

select * from animals where 
weight_kg = (select max(weight_kg) from animals)
or
weight_kg = (select min(weight_kg) from animals)


SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth > '1-JAN-1990' AND date_of_birth < '31-DEC-2000';



SELECT neutered, COUNT(neutered) AS count FROM animals
GROUP BY neutered;

--  add queries
select name from animals as t1 inner join 
owners as t2 on t2.id = t1.owner_id and t2.full_name = 'Melody Pond'

select * from animals as t1 inner join 
species as t2 on t2.id = t1.species_id and t2.name = 'Pokemon'

-- List all owners and their animals, remember to include those that don't own any animal.
select t1.name, t2.full_name from animals as t1 
right join owners as t2 on t2.id = t1.owner_id

select count(t1.*) as counter_per_species from animals as t1 
inner join species as t2 on t2.id = t1.species_id 
group by t1.species_id

select t1.name, t2.name, t3.full_name from animals as t1 
inner join species as t2 on  t2.id = t1.species_id  and t2.id = 2
inner join owners as t3 on t1.owner_id = t3.id
and t3.full_name = 'Jennifer Orwell'

select t1.* from animals as t1 
inner join owners as t2 on t1.owner_id = t2.id
and t1.escape_attempts = 0 and t2.full_name = 'Dean Winchester'

-- Who owns the most animals?
select o.full_name, q.counts from owners as o join (
select t2.id as a, count(t1.owner_id) as counts from 
owners as t2 inner join
animals as t1 on t1.owner_id = t2.id
group by a
) as q on true where q.a  = o.id

-- Who was the last animal seen by William Tatcher?
select * from animals as t1 inner join 
  (select animals_id from visits v1 where v1.visit_data= 
  (select Max(visit_data) from visits v2 where v1.vets_id=v2.vets_id)
  and v1.vets_id = 1
  group by animals_id) sub
  on sub.animals_id = t1.id

-- How many different animals did Stephanie Mendez see?
select count(*) as different_pets from vets
  join visits on vets.id = visits.vets_id
  where visits.vets_id = 3;

-- List all vets and their specialties, including vets with no specialties.
select vets.name, species.name as specialties from vets
left join specializations as t2 on t2.vets_id = vets.id
left join species on species.id = t2.species_id


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.*, visits.visit_data as visit_date from animals 
join visits on animals.id = visits.animals_id and 
visits.visit_data >= '1-APR-2020' and visits.visit_data <= '30-AUG-2020'
join vets on vets.id = visits.vets_id and vets.id = 3


-- -- Who was Maisy Smith's first visit?
select * from animals as t1 inner join 
  (select animals_id from visits v1 where v1.visit_data= 
  (select min(visit_data) from visits v2 where v1.vets_id=v2.vets_id)
  and v1.vets_id = 2
  group by animals_id) sub
  on sub.animals_id = t1.id

-- -- Details for most recent visit: animal information, vet information, and date of visit.
select animals.*, vets.*, visits.* from animals join
visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
order by visits.visit_data desc limit 1 

-- How many visits were with a vet that did not specialize in that animal's species
select count(*) from visits
join vets on vets.id = visits.vets_id
join specializations on vets.id = specializations.vets_id
join animals on visits.animals_id = animals.id
where animals.species_id != specializations.species_id

-- What specialty shoudl Maisy Smith consider getting? Look for the species she gets the most
select species.name as species, COUNT(*) from visits
join vets on vets.id = visits.vets_id
join animals on animals.id = visits.animals_id
join species on species.id = animals.species_id
where vets.id = 2
group by species.name;

-- What animal has the most visits to vets?
select animals.name, COUNT(*) as counts from animals
join visits on visits.animals_id = animals.id
group by animals.name
order by counts desc
limit 1;

-- First Queries
SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

