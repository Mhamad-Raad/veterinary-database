/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE date_of_birth BETWEEN '1-FEB-2016'
AND '12-31-2019'

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'

SELECT name, escape_attempts FROM animals where weight_kg > 10.5

SELECT * FROM animals where neutered = TRUE

SELECT * FROM animals WHERE name != 'Gabumon'

SELECT * FROM animals WHERE weight_kg <= 17.3 AND weight_kg >= 10.4
