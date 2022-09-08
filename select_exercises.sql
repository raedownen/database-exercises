-- 3. Explore the structure of the albums table.
-- a. How many rows are in the albums table?
-- 31 rows
-- b. How many unique artist names are in the albums table?
-- There are 23 unique(distinct) artists
-- c. What is the primary key for the albums table?
-- The id is the PK (Primary Key)
-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
-- Oldest is 1967 and most recent is 2011
-- 4.Write queries to find the following information:
-- a. The name of all albums by Pink Floyd
-- USE albums_db;
-- SELECT *
-- FROM albums
-- WHERE artist = 'Pink Floyd';
-- ANSWER to query The Dark Side of the Moon and The Wall
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
-- USE albums_db;
-- SELECT release_date
-- FROM albums
-- WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
-- ANSWER to query is 1967
-- c. The genre for the album Nevermind
-- USE albums_db;
-- SELECT genre
-- FROM albums
-- WHERE name = 'Nevermind';
-- ANSWER to query is Grunge, Alternative rock
-- d. Which albums were released in the 1990s
-- USE albums_db;
-- SELECT *
-- FROM albums
-- WHERE release_date between 1990 and 1999;
-- ANSWER to the query is:
/* 'The Bodyguard'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural'
*/

-- e. Which albums had less than 20 million certified sales
-- USE albums_db;
-- SELECT *
-- FROM albums
-- WHERE sales < 20;
-- ANSWER to query is:
/*'Grease: The Original Soundtrack from the Motion Picture'
'Bad'
'Sgt. Pepper\'s Lonely Hearts Club Band'
'Dirty Dancing'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Abbey Road'
'Born in the U.S.A.'
'Brothers in Arms'
'Titanic: Music from the Motion Picture'
'Nevermind'
'The Wall'
*/
-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
-- USE albums_db;
-- SELECT *
-- FROM albums
-- WHERE genre = 'rock';
-- ANSWER to the query is:
/*'Sgt. Pepper\'s Lonely Hearts Club Band'
'1'
'Abbey Road'
'Born in the U.S.A.'
'Supernatural'
*/
-- 5.Be sure to add, commit, and push your work.