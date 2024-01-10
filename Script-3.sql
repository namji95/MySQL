CREATE DATABASE coding_test;
CREATE TABLE coding_test.animal_ins (
	animal_id VARCHAR(50) NOT NULL,
	animal_type VARCHAR(50) NOT NULL,
	date_time DATETIME NOT NULL,
	intake_condition VARCHAR(50) NOT NULL,
	name VARCHAR(50) NULL,
	sex_upon_intake VARCHAR(50) NOT NULL
);

DROP TABLE coding_test.animal_ins;

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, sex_upon_intake) 
VALUES 
("A434523", "Cat", '2015-11-20 14:18:00', "Normal", "Spayed Female");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, sex_upon_intake) 
VALUES 
("A562649", "Dog", '2014-03-20 18:06:00', "Sick", "Spayed Female");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A524634", "Dog", '2015-01-02 18:54:00', "Normal", "*Belle", "Intact Female");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A465637", "Dog", '2017-06-04 08:17:00', "Injured", "*Commander", "Neutered Male");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A596634", "Dog", '2016-06-07 09:17:00', "Normal", "Rochy", "Intact Female");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A476251", "Dog", '2015-01-29 15:01:00', "Injured", "shelly", "Neutered Male");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A394532", "Dog", '2016-04-19 13:28:00', "Normal", "Benji", "Intact Female");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A273654", "Dog", '2016-01-03 16:25:00', "Injured", "Jachie", "Neutered Male");

INSERT INTO coding_test.animal_ins 
(animal_id, animal_type, date_time, intake_condition, name, sex_upon_intake) 
VALUES 
("A117331", "Dog", '2016-03-13 11:17:00', "Injured", "*Sam", "Neutered Male");

SELECT animal_id
FROM coding_test.animal_ins
WHERE name IS NOT NULL 
ORDER BY animal_id;

SELECT name, date_time 
FROM coding_test.animal_ins
ORDER BY animal_id DESC;

SELECT count(DISTINCT name)
FROM coding_test.animal_ins;

SELECT * FROM coding_test.animal_ins;
