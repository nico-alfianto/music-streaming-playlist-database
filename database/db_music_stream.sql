-- =========================================================
-- Project  : Music Streaming Playlist Database
-- Author   : Nico Alfianto
-- Database : db_music_stream
-- =========================================================

DROP DATABASE IF EXISTS db_music_stream;

CREATE DATABASE db_music_stream;

USE db_music_stream;

-- =========================================================
-- TABLE : USER
-- =========================================================

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- =========================================================
-- TABLE : ARTIST
-- =========================================================

CREATE TABLE artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- =========================================================
-- TABLE : ALBUM
-- =========================================================

CREATE TABLE album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    album_title VARCHAR(100) NOT NULL,
    release_date DATE,
    genre VARCHAR(50),

    CONSTRAINT fk_album_artist
    FOREIGN KEY (artist_id)
    REFERENCES artist(artist_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- =========================================================
-- TABLE : SONG
-- =========================================================

CREATE TABLE song (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    duration INT,

    CONSTRAINT fk_song_album
    FOREIGN KEY (album_id)
    REFERENCES album(album_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- =========================================================
-- TABLE : PLAYLIST
-- =========================================================

CREATE TABLE playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100),
    is_public BOOLEAN,
    created_at DATE,

    CONSTRAINT fk_playlist_user
    FOREIGN KEY (user_id)
    REFERENCES user(user_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- =========================================================
-- TABLE : PLAYLIST SONG
-- =========================================================

CREATE TABLE playlist_song (

    playlist_id INT NOT NULL,
    song_id INT NOT NULL,

    PRIMARY KEY (playlist_id, song_id),

    CONSTRAINT fk_playlistsong_playlist
    FOREIGN KEY (playlist_id)
    REFERENCES playlist(playlist_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_playlistsong_song
    FOREIGN KEY (song_id)
    REFERENCES song(song_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
-- =========================================================
-- INSERT DATA : USER
-- =========================================================

INSERT INTO user (username, email) VALUES
('nico', 'nico@gmail.com'),
('rizky', 'rizky@gmail.com'),
('andika', 'andika@gmail.com'),
('salsa', 'salsa@gmail.com'),
('putri', 'putri@gmail.com');

-- =========================================================
-- INSERT DATA : ARTIST
-- =========================================================

INSERT INTO artist (name, bio) VALUES
('Avicii', 'Swedish DJ and music producer'),
('Alan Walker', 'Norwegian DJ and producer'),
('Coldplay', 'British rock band'),
('Imagine Dragons', 'American pop rock band'),
('Maroon 5', 'American pop band');

-- =========================================================
-- INSERT DATA : ALBUM
-- =========================================================

INSERT INTO album (artist_id, album_title, release_date, genre) VALUES
(1, 'True', '2013-09-13', 'EDM'),
(1, 'Stories', '2015-10-02', 'EDM'),
(2, 'Different World', '2018-12-14', 'Electronic'),
(3, 'A Head Full of Dreams', '2015-12-04', 'Rock'),
(4, 'Evolve', '2017-06-23', 'Pop Rock'),
(5, 'Red Pill Blues', '2017-11-03', 'Pop');

-- =========================================================
-- INSERT DATA : SONG
-- =========================================================

INSERT INTO song (album_id, title, duration) VALUES
(1, 'Wake Me Up', 247),
(1, 'Hey Brother', 255),
(1, 'Addicted To You', 173),
(2, 'Waiting For Love', 230),
(2, 'Broken Arrows', 232),
(3, 'Faded', 212),
(3, 'Alone', 162),
(3, 'Darkside', 211),
(4, 'Adventure of a Lifetime', 263),
(4, 'Hymn for the Weekend', 258),
(4, 'Everglow', 282),
(5, 'Believer', 204),
(5, 'Thunder', 187),
(5, 'Whatever It Takes', 201),
(6, 'Girls Like You', 235),
(6, 'What Lovers Do', 199),
(6, 'Wait', 190);

-- =========================================================
-- INSERT DATA : PLAYLIST
-- =========================================================

INSERT INTO playlist (user_id, name, is_public, created_at) VALUES
(1, 'Morning Vibes', TRUE, '2024-01-05'),
(1, 'Workout Mix', TRUE, '2024-02-11'),
(2, 'Relaxing Songs', FALSE, '2024-03-18'),
(3, 'Road Trip', TRUE, '2024-04-10'),
(4, 'Favorite Hits', TRUE, '2024-05-20');

-- =========================================================
-- INSERT DATA : PLAYLIST SONG
-- =========================================================

INSERT INTO playlist_song VALUES
(1,1),
(1,2),
(1,6),
(1,9),

(2,4),
(2,12),
(2,13),
(2,15),

(3,3),
(3,5),
(3,7),

(4,6),
(4,8),
(4,10),
(4,14),

(5,11),
(5,15),
(5,16),
(5,17);

-- =========================================================
-- BASIC SELECT QUERIES
-- =========================================================

-- 1. Menampilkan seluruh data user

SELECT *
FROM user;


-- 2. Menampilkan seluruh artist

SELECT *
FROM artist;


-- 3. Menampilkan seluruh album

SELECT *
FROM album;


-- 4. Menampilkan seluruh lagu

SELECT *
FROM song;


-- =========================================================
-- WHERE CLAUSE
-- =========================================================

-- 5. Lagu dengan durasi lebih dari 240 detik

SELECT *
FROM song
WHERE duration > 240;


-- 6. Lagu dengan durasi antara 200 dan 260 detik

SELECT *
FROM song
WHERE duration BETWEEN 200 AND 260;


-- 7. Album bergenre EDM

SELECT *
FROM album
WHERE genre = 'EDM';


-- 8. Playlist yang bersifat public

SELECT *
FROM playlist
WHERE is_public = TRUE;


-- =========================================================
-- LIKE
-- =========================================================

-- 9. Artist yang mengandung kata "A"

SELECT *
FROM artist
WHERE name LIKE '%A%';


-- 10. Lagu yang diawali huruf W

SELECT *
FROM song
WHERE title LIKE 'W%';


-- =========================================================
-- ORDER BY
-- =========================================================

-- 11. Artist berdasarkan nama A-Z

SELECT *
FROM artist
ORDER BY name ASC;


-- 12. Lagu terpanjang

SELECT *
FROM song
ORDER BY duration DESC;


-- 13. Album terbaru

SELECT *
FROM album
ORDER BY release_date DESC;


-- =========================================================
-- LIMIT
-- =========================================================

-- 14. Lima lagu pertama

SELECT *
FROM song
LIMIT 5;


-- =========================================================
-- DISTINCT
-- =========================================================

-- 15. Genre yang tersedia

SELECT DISTINCT genre
FROM album;


-- =========================================================
-- AGGREGATE FUNCTIONS
-- =========================================================

-- 16. Total lagu

SELECT COUNT(*) AS total_song
FROM song;


-- 17. Total artist

SELECT COUNT(*) AS total_artist
FROM artist;


-- 18. Durasi lagu terpanjang

SELECT MAX(duration) AS longest_song
FROM song;


-- 19. Durasi lagu terpendek

SELECT MIN(duration) AS shortest_song
FROM song;


-- 20. Rata-rata durasi lagu

SELECT AVG(duration) AS average_duration
FROM song;


-- 21. Total durasi seluruh lagu

SELECT SUM(duration) AS total_duration
FROM song;


-- =========================================================
-- SEARCH DATA
-- =========================================================

-- 22. Cari artist Avicii

SELECT *
FROM artist
WHERE name = 'Avicii';


-- 23. Cari lagu Believer

SELECT *
FROM song
WHERE title = 'Believer';


-- 24. Cari playlist milik Nico

SELECT *
FROM playlist
WHERE user_id = 1;

-- =========================================================
-- INNER JOIN
-- =========================================================

-- 25. Menampilkan lagu beserta album dan artist

SELECT
    s.song_id,
    s.title AS song_title,
    a.album_title,
    ar.name AS artist_name,
    s.duration
FROM song s
INNER JOIN album a
ON s.album_id = a.album_id
INNER JOIN artist ar
ON a.artist_id = ar.artist_id;


-- =========================================================
-- Playlist dan Pemilik Playlist
-- =========================================================

SELECT
    p.playlist_id,
    p.name AS playlist_name,
    u.username,
    p.created_at
FROM playlist p
INNER JOIN user u
ON p.user_id = u.user_id;


-- =========================================================
-- Lagu yang ada pada setiap Playlist
-- =========================================================

SELECT
    p.name AS playlist_name,
    s.title AS song_title
FROM playlist_song ps
INNER JOIN playlist p
ON ps.playlist_id = p.playlist_id
INNER JOIN song s
ON ps.song_id = s.song_id
ORDER BY p.name;


-- =========================================================
-- Playlist lengkap (Playlist - User - Song)
-- =========================================================

SELECT
    u.username,
    p.name AS playlist_name,
    s.title AS song_title
FROM user u
INNER JOIN playlist p
ON u.user_id = p.user_id
INNER JOIN playlist_song ps
ON p.playlist_id = ps.playlist_id
INNER JOIN song s
ON ps.song_id = s.song_id
ORDER BY u.username;


-- =========================================================
-- GROUP BY
-- =========================================================

-- Jumlah lagu pada setiap artist

SELECT
    ar.name,
    COUNT(s.song_id) AS total_song
FROM artist ar
INNER JOIN album a
ON ar.artist_id = a.artist_id
INNER JOIN song s
ON a.album_id = s.album_id
GROUP BY ar.name;


-- =========================================================
-- Jumlah album setiap artist
-- =========================================================

SELECT
    ar.name,
    COUNT(a.album_id) AS total_album
FROM artist ar
LEFT JOIN album a
ON ar.artist_id = a.artist_id
GROUP BY ar.name;


-- =========================================================
-- Jumlah lagu setiap playlist
-- =========================================================

SELECT
    p.name,
    COUNT(ps.song_id) AS total_song
FROM playlist p
LEFT JOIN playlist_song ps
ON p.playlist_id = ps.playlist_id
GROUP BY p.name;


-- =========================================================
-- Rata-rata durasi lagu setiap artist
-- =========================================================

SELECT
    ar.name,
    ROUND(AVG(s.duration),2) AS average_duration
FROM artist ar
INNER JOIN album a
ON ar.artist_id = a.artist_id
INNER JOIN song s
ON a.album_id = s.album_id
GROUP BY ar.name;


-- =========================================================
-- HAVING
-- =========================================================

-- Artist yang memiliki lebih dari 2 lagu

SELECT
    ar.name,
    COUNT(s.song_id) AS total_song
FROM artist ar
INNER JOIN album a
ON ar.artist_id = a.artist_id
INNER JOIN song s
ON a.album_id = s.album_id
GROUP BY ar.name
HAVING COUNT(s.song_id) > 2;


-- =========================================================
-- SUBQUERY
-- =========================================================

-- Lagu dengan durasi di atas rata-rata

SELECT *
FROM song
WHERE duration >
(
    SELECT AVG(duration)
    FROM song
);


-- =========================================================
-- Artist dengan jumlah lagu terbanyak

SELECT
    ar.name,
    COUNT(s.song_id) AS total_song
FROM artist ar
INNER JOIN album a
ON ar.artist_id = a.artist_id
INNER JOIN song s
ON a.album_id = s.album_id
GROUP BY ar.name
ORDER BY total_song DESC
LIMIT 1;


-- =========================================================
-- Playlist yang memiliki lebih dari 3 lagu

SELECT
    p.name,
    COUNT(ps.song_id) AS total_song
FROM playlist p
INNER JOIN playlist_song ps
ON p.playlist_id = ps.playlist_id
GROUP BY p.name
HAVING COUNT(ps.song_id) > 3;


-- =========================================================
-- LEFT JOIN
-- =========================================================

-- Seluruh artist beserta albumnya

SELECT
    ar.name,
    a.album_title
FROM artist ar
LEFT JOIN album a
ON ar.artist_id = a.artist_id;


-- =========================================================
-- Seluruh user beserta playlist

SELECT
    u.username,
    p.name AS playlist_name
FROM user u
LEFT JOIN playlist p
ON u.user_id = p.user_id;

-- =========================================================
-- ALTER TABLE
-- =========================================================

-- Menambahkan kolom country pada tabel artist

ALTER TABLE artist
ADD COLUMN country VARCHAR(50);


-- Mengubah panjang karakter genre

ALTER TABLE album
MODIFY genre VARCHAR(100);


-- =========================================================
-- UPDATE
-- =========================================================

-- Mengubah negara asal artist

UPDATE artist
SET country = 'Sweden'
WHERE name = 'Avicii';

UPDATE artist
SET country = 'Norway'
WHERE name = 'Alan Walker';

UPDATE artist
SET country = 'United Kingdom'
WHERE name = 'Coldplay';

UPDATE artist
SET country = 'United States'
WHERE name = 'Imagine Dragons';

UPDATE artist
SET country = 'United States'
WHERE name = 'Maroon 5';


-- =========================================================
-- DELETE
-- =========================================================

-- Menghapus playlist kosong

DELETE FROM playlist
WHERE playlist_id = 99;


-- =========================================================
-- CREATE VIEW
-- =========================================================

CREATE VIEW vw_song_information AS

SELECT

    s.song_id,
    s.title AS song_title,
    ar.name AS artist_name,
    a.album_title,
    a.genre,
    s.duration

FROM song s

INNER JOIN album a
ON s.album_id = a.album_id

INNER JOIN artist ar
ON a.artist_id = ar.artist_id;


-- Melihat isi VIEW

SELECT *
FROM vw_song_information;


-- =========================================================
-- VIEW PLAYLIST
-- =========================================================

CREATE VIEW vw_playlist_detail AS

SELECT

    u.username,
    p.name AS playlist_name,
    s.title AS song_title

FROM user u

INNER JOIN playlist p
ON u.user_id = p.user_id

INNER JOIN playlist_song ps
ON p.playlist_id = ps.playlist_id

INNER JOIN song s
ON ps.song_id = s.song_id;


SELECT *
FROM vw_playlist_detail;


-- =========================================================
-- INDEX
-- =========================================================

CREATE INDEX idx_song_title
ON song(title);

CREATE INDEX idx_artist_name
ON artist(name);


-- =========================================================
-- TRANSACTION
-- =========================================================

START TRANSACTION;

INSERT INTO artist(name, bio, country)
VALUES
('OneRepublic',
 'American pop rock band',
 'United States');

COMMIT;


-- =========================================================
-- ROLLBACK EXAMPLE
-- =========================================================

START TRANSACTION;

UPDATE artist
SET country='Indonesia'
WHERE artist_id=1;

ROLLBACK;


-- =========================================================
-- REPORT QUERY
-- =========================================================

-- Total lagu setiap genre

SELECT

    genre,
    COUNT(song.song_id) AS total_song

FROM album

INNER JOIN song
ON album.album_id = song.album_id

GROUP BY genre;


-- =========================================================
-- Artist dengan total durasi lagu

SELECT

    artist.name,
    SUM(song.duration) AS total_duration

FROM artist

INNER JOIN album
ON artist.artist_id = album.artist_id

INNER JOIN song
ON album.album_id = song.album_id

GROUP BY artist.name

ORDER BY total_duration DESC;


-- =========================================================
-- Playlist dengan jumlah lagu

SELECT

    playlist.name,
    COUNT(playlist_song.song_id) AS total_song

FROM playlist

LEFT JOIN playlist_song
ON playlist.playlist_id = playlist_song.playlist_id

GROUP BY playlist.name

ORDER BY total_song DESC;


-- =========================================================
-- Lagu Berdasarkan Genre

SELECT

    song.title,
    album.genre

FROM song

INNER JOIN album
ON song.album_id = album.album_id

ORDER BY album.genre;


-- =========================================================
-- Artist Berdasarkan Negara

SELECT *

FROM artist

ORDER BY country;


-- =========================================================
-- Menampilkan Semua View

SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';


-- =========================================================
-- Menampilkan Semua Tabel

SHOW TABLES;


-- =========================================================
-- Deskripsi Struktur Tabel

DESC user;

DESC artist;

DESC album;

DESC song;

DESC playlist;

DESC playlist_song;
