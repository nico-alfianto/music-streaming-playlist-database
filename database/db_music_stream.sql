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
