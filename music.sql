-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INTEGER NOT NULL REFERENCES artists(id),
  album INTEGER NOT NULL REFERENCES album(id),
  producers INTEGER NOT NULL REFERENCES producers(id)
);

INSERT INTO artists (name)
VALUES
('Miles Caton'),
('Mallory del Rosario'),
('Obby del Rosario');

INSERT INTO producers (name)
VALUES
('Caleb D'),
('Hunter D');

INSERT INTO album (name)
VALUES
('IM 4 MAMA'),
('IM 6 MAMA');

INSERT INTO songs (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
('AT FIRST I WAS BORN', 300, '2016-02-02', '2', 1, 1),
('AT FIRST I WAS BORN', 300, '2016-02-02', '3', 1, 1);


-- for normalization (avoiding adding same data again and again on different songs) we should move the following to separate tables: artists, producers, album
-- artists should be a reference to a separate table , and artists_songs should be in a many to many (if we need that in the future) table as 1 artist can have multiple songs {1,2,3, etc} and 1 song can have multiple artists {1,2,3, etc}
-- producers should be a reference to separate table, and producers_songs should be in a many to many table (if we need that in the future) as 1 producer can have multiple songs {1,2,3, etc} and 1 song can have multiple producers {1,2,3, etc}
-- try adding multiple producers {1,2,3, etc} to modified table (select artists from songs where TITLE = 'AT FIRST I WAS BORN';)
-- double check with Krunal if you can insert several artists into 1 values input above like ('AT FIRST I WAS BORN', 300, '2016-02-02', '{2,3}', 1, 1);


-- old data below: 

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
