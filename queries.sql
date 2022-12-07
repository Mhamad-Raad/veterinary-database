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


select name from animals as t1 inner join 
owners as t2 on t2.id = t1.owner_id and t2.full_name = 'Melody Pond'

select * from animals as t1 inner join 
species as t2 on t2.id = t1.species_id and t2.name = 'Pokemon'


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

select o.full_name, q.counts from owners as o join (
select t2.id as a, count(t1.owner_id) as counts from 
owners as t2 inner join
animals as t1 on t1.owner_id = t2.id
group by a
) as q on true where q.a  = o.id