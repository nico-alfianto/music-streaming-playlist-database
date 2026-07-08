<h1 align="center">🎵 Music Streaming Playlist Database</h1>

<p align="center">
Database Design and SQL Implementation for a Music Streaming Platform
</p>

<p align="center">

<a href="#">
<img src="https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
</a>

<a href="#">
<img src="https://img.shields.io/badge/Database-Design-00618A?style=for-the-badge">
</a>

<a href="#">
<img src="https://img.shields.io/badge/ERD-Modeling-success?style=for-the-badge">
</a>

<a href="#">
<img src="https://img.shields.io/badge/SQL-Implementation-orange?style=for-the-badge">
</a>

</p>

<p align="center">

<img src="https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql">

<img src="https://img.shields.io/badge/Database-Design-success">

<img src="https://img.shields.io/badge/Normalization-3NF-orange">

<img src="https://img.shields.io/badge/ERD-Modeling-red">

<img src="https://img.shields.io/badge/SQL-DDL%20%26%20DML-blueviolet">

</p>

---

# 📖 Project Overview

Music streaming platforms manage millions of songs, artists, albums, playlists, and user interactions every day. To support these operations efficiently, a well-structured database design is essential.

This project focuses on designing and implementing a relational database system for a **Music Streaming Playlist Platform** using MySQL. The database enables the management of users, artists, albums, songs, playlists, and playlist-song relationships while maintaining data integrity through primary and foreign key constraints.

The project demonstrates practical database design principles, SQL implementation, and relational modeling techniques commonly used in real-world music streaming applications such as Spotify and Apple Music.

---

# 🎯 Project Objectives

The objectives of this project are:

- Design a normalized relational database structure.
- Model relationships between users, artists, albums, songs, and playlists.
- Implement database tables using SQL.
- Apply primary key and foreign key constraints.
- Perform CRUD operations using SQL.
- Create views for simplified data access.
- Execute analytical and reporting queries.

---

# 🎵 System Features

The database supports the following functionalities:

### 👤 User Management

- Store user information.
- Manage playlist ownership.

### 🎤 Artist Management

- Store artist information.
- Track songs and albums created by artists.

### 💿 Album Management

- Manage album records.
- Associate albums with artists.

### 🎶 Song Management

- Store song information.
- Track song duration.
- Link songs to albums and artists.

### 📂 Playlist Management

- Create playlists.
- Manage public/private playlists.
- Store playlist creation information.

### 🔗 Playlist-Song Management

- Support many-to-many relationships between playlists and songs.
- Allow songs to appear in multiple playlists.

---

# 🗄️ Database Schema

The database consists of six main tables:

| Table | Description |
|---------|-------------|
| User | Stores user information |
| Artist | Stores artist information |
| Album | Stores album information |
| Song | Stores song information |
| Playlist | Stores playlist information |
| Playlist_Song | Junction table connecting playlists and songs |

---

# 🏗️ Entity Relationship Diagram (ERD)

<p align="center">
<img src="images/erd.png" width="900">
</p>

### Relationship Overview

- One Artist can have many Albums.
- One Album can contain many Songs.
- One User can create many Playlists.
- One Playlist can contain many Songs.
- One Song can appear in multiple Playlists.

---

# 📐 Logical Record Structure (LRS)

<p align="center">
<img src="images/lrs.png" width="900">
</p>

The Logical Record Structure illustrates how entities are connected and how data flows within the database system.

---

# 🔄 Database Development Workflow

```text
Requirement Analysis
          │
          ▼
Entity Identification
          │
          ▼
ERD Design
          │
          ▼
LRS Design
          │
          ▼
Database Implementation
          │
          ▼
SQL Operations
          │
          ▼
Testing & Validation
```

---

# 💻 SQL Implementation

The project includes implementation of:

### Data Definition Language (DDL)

- CREATE DATABASE
- CREATE TABLE
- ALTER TABLE
- PRIMARY KEY
- FOREIGN KEY

### Data Manipulation Language (DML)

- INSERT
- UPDATE
- DELETE

### Data Query Language (DQL)

- SELECT
- JOIN
- GROUP BY
- ORDER BY
- WHERE
- Aggregate Functions

### Database Objects

- VIEW

---

# 📊 Example SQL Operations

## Create Tables

```sql
CREATE TABLE artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

## Insert Data

```sql
INSERT INTO artist(name)
VALUES ('Avicii');
```

---

## Update Data

```sql
UPDATE artist
SET name = 'Avicii Official'
WHERE artist_id = 1;
```

---

## Delete Data

```sql
DELETE FROM artist
WHERE artist_id = 1;
```

---

## Join Query

```sql
SELECT artist.name,
       album.title,
       song.title,
       song.duration
FROM artist
JOIN album
ON artist.artist_id = album.artist_id
JOIN song
ON album.album_id = song.album_id;
```

---

# 📷 Query Results

## Artist, Album, Song & Duration

<p align="center">
<img src="images/query_artist_album_song.png" width="900">
</p>

---

## Songs Created by Avicii

<p align="center">
<img src="images/query_avicii_song.png" width="900">
</p>

---

## Songs Between 200–280 Seconds

<p align="center">
<img src="images/query_duration.png" width="900">
</p>

---

## Total Songs by Artist

<p align="center">
<img src="images/query_total_song_artist.png" width="900">
</p>

---

## Playlist Created by Users

<p align="center">
<img src="images/query_playlist_user.png" width="900">
</p>

---

## Songs Inside Playlist

<p align="center">
<img src="images/query_playlist_song.png" width="900">
</p>

---

# 💡 Key Learning Outcomes

This project demonstrates:

- Database Design
- Relational Database Modeling
- Entity Relationship Diagram (ERD)
- Logical Record Structure (LRS)
- Database Normalization
- SQL Programming
- CRUD Operations
- Data Integrity Implementation
- Query Optimization Fundamentals

---

# 🚀 Skills Demonstrated

- MySQL
- SQL
- Database Design
- ERD Modeling
- LRS Modeling
- Data Modeling
- Relational Databases
- Database Documentation
- Problem Analysis
- System Analysis

---

# 📁 Repository Structure

```text
music-streaming-playlist-database/

│
├── README.md
├── database/
│   └── db_music_stream.sql
│
├── docs/
│   └── Database_Report.pdf
│
├── images/
│   ├── erd.png
│   ├── lrs.png
│   ├── query_artist_album_song.png
│   ├── query_avicii_song.png
│   ├── query_duration.png
│   ├── query_total_song_artist.png
│   ├── query_playlist_user.png
│   └── query_playlist_song.png
```

---

# 🔮 Future Improvements

Potential future enhancements include:

- User Authentication System
- Music Recommendation Engine
- Song Rating Feature
- Playlist Sharing Feature
- Web-Based Interface
- Mobile Application Integration
- Stored Procedures
- Triggers
- Database Security Enhancement

---

# 👨‍💻 Author

## Nico Alfianto

**Information Systems Student | Data Analyst & Database Enthusiast**

<p align="center">

<a href="mailto:alfiantonico9@gmail.com">
<img src="https://img.shields.io/badge/Email-alfiantonico9%40gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white">
</a>

<a href="https://www.linkedin.com/in/nico-alfianto">
<img src="https://img.shields.io/badge/LinkedIn-Nico%20Alfianto-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white">
</a>

<a href="https://github.com/nico-alfianto">
<img src="https://img.shields.io/badge/GitHub-nico--alfianto-181717?style=for-the-badge&logo=github&logoColor=white">
</a>

</p>

---

<div align="center">

### ⭐ If you found this project useful, please consider giving it a Star!

Thank you for visiting this repository.

</div>
````
