-- Create a new file called select_exercises.sql.

-- Use the albums_db database.
use albums_db;

-- Explore the structure of the albums table.
show tables;

describe albums;

-- a. How many rows are in the albums table?
select * 
from albums;

-- b. How many unique artist names are in the albums table?
select artist 
from albums;

select distinct artist 
from albums;

-- c. What is the primary key for the albums table?
select id 
from albums;

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
select min(release_date), max(release_date) 
from albums;

-- Write queries to find the following information:
-- a. The name of all albums by Pink Floyd
select name 
from albums
where artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date 
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind
select genre
from albums
where name = 'Nevermind'
;

-- d. Which albums were released in the 1990s
select distinct name, release_date
from albums
where release_date >= 1990
and release_date < 2000
;

-- e. Which albums had less than 20 million certified sales
select name, sales
from albums
where sales < 20
;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
select name, genre
from albums
where genre = 'Rock'
;

-- Be sure to add, commit, and push your work.