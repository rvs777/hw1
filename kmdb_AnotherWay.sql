-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS My_Movies;
DROP TABLE IF EXISTS My_People;
DROP TABLE IF EXISTS My_Role;

-- Create new tables, according to your domain model
CREATE TABLE My_Movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_name TEXT,
    release_year INTEGER,
    rating TEXT,
    Director TEXT 
   
);

CREATE TABLE My_People (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_name TEXT
);

CREATE TABLE My_Role (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    role_name TEXT,
    people_id INTEGER,
    movie_id INTEGER   
);



-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO My_Movies (id,movie_name, release_year, rating, Director)
VALUES (1,'Batman Begins', 2005,'PG-13','Christopher Nolan');
INSERT INTO My_Movies (id,movie_name, release_year, rating, Director)
VALUES (2,'The Dark Knight', 2008,'PG-13','Christopher Nolan');
INSERT INTO My_Movies (id,movie_name, release_year, rating, Director)
VALUES (3,'The Dark Knight Rises', 2012,'PG-13','Christopher Nolan');


INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (1,'Bruce Wayne',1,1);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (2,'Alfred Pennyworth',2,1);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (3,'Ras al Ghul',3,1);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (4,'Rachel Dawes',4,1);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (5,'Commissioner Gordon',5,1);

INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (6,'Bruce Wayne',1,2);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (7,'Joker',6,2);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (8,'Harvey Dent',7,2);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (9,'Alfred Pennyworth',2,2);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (10,'Rachel Dawes',8,2);

INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (11,'Bruce Wayne',1,3);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (12,'Commissioner Gordon',5,3);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (13,'Bane',9,3);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (14,'John Blake',10,3);
INSERT INTO My_Role (id,role_name,people_id, movie_id)
VALUES (15,'Selina Kyle',11,3);



INSERT INTO My_People (id,person_name)
VALUES (1,'Christian Bale');
INSERT INTO My_People (id,person_name)
VALUES (2,'Michael Caine');
INSERT INTO My_People (id,person_name)
VALUES (3,'Liam Neeson');
INSERT INTO My_People (id,person_name)
VALUES (4,'Katie Holmes');
INSERT INTO My_People (id,person_name)
VALUES (5,'Gary Oldman');
INSERT INTO My_People (id,person_name)
VALUES (6,'Heather Ledger');
INSERT INTO My_People (id,person_name)
VALUES (7,'Aaron Eckhart');
INSERT INTO My_People (id,person_name)
VALUES (8,'Maggie Gyllenhaal');
INSERT INTO My_People (id,person_name)
VALUES (9,'Tom Hardy');
INSERT INTO My_People (id,person_name)
VALUES (10,'Joseph Gordon-levitt');
INSERT INTO My_People (id,person_name)
VALUES (11,'Anne Hathaway');


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT movie_name, release_year, rating, Director FROM My_Movies;


-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
SELECT movie_name, person_name, role_name FROM My_Movies
INNER JOIN My_Role ON My_Movies.id =  My_Role.movie_id
INNER JOIN My_People ON My_People.id = My_Role.people_id;