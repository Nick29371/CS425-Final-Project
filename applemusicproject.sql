DROP DATABASE IF EXISTS `project`;
CREATE DATABASE IF NOT EXISTS `project`;
USE `project`;

DROP TABLE IF EXISTS album,
                     artist,
                     genre,
                     playlist, 
                     playlist_song, 
                     song,
                     song_review,
                     user,
                     user_contact;
                     

CREATE TABLE `Genre` (
    `GID` INT PRIMARY KEY,
    `genre_name` VARCHAR(100) NOT NULL
);

INSERT INTO `Genre` (GID, genre_name) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Drama'),
(5, 'Fantasy'),
(6, 'Historical'),
(7, 'Horror'),
(8, 'Mystery'),
(9, 'Romance'),
(10, 'Science Fiction'),
(11, 'Thriller'),
(12, 'Animation'),
(13, 'Documentary'),
(14, 'Musical'),
(15, 'Western');


CREATE TABLE `Artist` (
    `artist_ID` INT PRIMARY KEY,
    `artist_name` VARCHAR(100) NOT NULL,
	`listeners_no` INT DEFAULT 0,
	`photo_cover` VARCHAR(255),
	`birth_date` DATE,
	`hometown_state` VARCHAR(100),
	`bio` TEXT,
	`GID` INT,
    FOREIGN KEY (GID) REFERENCES Genre(GID)
);

INSERT INTO `Artist` (artist_ID, artist_name, listeners_no, photo_cover, birth_date, hometown_state, bio, GID) VALUES
(1, 'John Doe', 150000, 'https://example.com/photos/john_doe.jpg', '1990-05-15', 'California', 'An emerging indie rock artist.', 1),
(2, 'Jane Smith', 200000, 'https://example.com/photos/jane_smith.jpg', '1985-10-30', 'New York', 'A pop sensation with multiple hits.', 3),
(3, 'Mike Jones', 50000, 'https://example.com/photos/mike_jones.jpg', '1992-03-22', 'Texas', 'Known for his deep country roots.', 4),
(4, 'Sara Connor', 300000, 'https://example.com/photos/sara_connor.jpg', '1998-12-11', 'Florida', 'A talented singer-songwriter.', 2),
(5, 'Alice Wonder', 85000, 'https://example.com/photos/alice_wonder.jpg', '1995-07-18', 'Oregon', 'A captivating folk artist.', 5),
(6, 'Bob Builder', 60000, 'https://example.com/photos/bob_builder.jpg', '1988-01-25', 'Nevada', 'Renowned for his construction-themed music.', 6),
(7, 'Charlie Brown', 45000, 'https://example.com/photos/charlie_brown.jpg', '1993-08-02', 'Illinois', 'A versatile artist crossing genres.', 7),
(8, 'Diana Prince', 300000, 'https://example.com/photos/diana_prince.jpg', '1986-09-19', 'Washington', 'Known for her powerful ballads.', 9),
(9, 'Elmo Red', 50000, 'https://example.com/photos/elmo_red.jpg', '2010-02-03', 'New York', 'A children’s music favorite.', 12),
(10, 'Fiona Fair', 120000, 'https://example.com/photos/fiona_fair.jpg', '1990-11-21', 'Alaska', 'A charming artist with a fairy-tale theme.', 8),
(11, 'Harry Potter', 70000, 'https://example.com/photos/harry_potter.jpg', '1985-07-31', 'United Kingdom', 'A magical performer with enchanting songs.', 5),
(12, 'Ron Weasley', 65000, 'https://example.com/photos/ron_weasley.jpg', '1985-03-01', 'United Kingdom', 'Known for his lively and humorous tracks.', 3),
(13, 'Hermione Granger', 90000, 'https://example.com/photos/hermione_granger.jpg', '1985-09-19', 'United Kingdom', 'A brilliant artist with intellectual lyrics.', 4),
(14, 'Thor Odinson', 40000, 'https://example.com/photos/thor_odinson.jpg', '1990-03-29', 'Asgard', 'A rock star with a thunderous presence.', 1),
(15, 'Bruce Wayne', 100000, 'https://example.com/photos/bruce_wayne.jpg', '1980-02-19', 'Gotham', 'A mysterious figure with dark melodies.', 11);


CREATE TABLE `Album` (
    `album_ID` INT PRIMARY KEY,
    `title_album` VARCHAR(100) NOT NULL,
    `release_date` DATE,
    `photo` VARCHAR(255),
    `release_type` ENUM('Single', 'EP', 'Album') NOT NULL,
    `artist_ID` INT,
    `GID` INT,
    FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID),
    FOREIGN KEY (GID) REFERENCES Genre(GID)
);

INSERT INTO `Album` (album_ID, title_album, release_date, photo, release_type, artist_ID, GID) VALUES
(1, 'Chasing Dreams', '2023-01-15', 'https://example.com/albums/chasing_dreams.jpg', 'Album', 1, 1),
(2, 'Melodies of the Heart', '2022-09-10', 'https://example.com/albums/melodies_of_the_heart.jpg', 'Album', 2, 3),
(3, 'Country Roads', '2021-05-20', 'https://example.com/albums/country_roads.jpg', 'Single', 3, 4),
(4, 'Songs of Freedom', '2022-06-30', 'https://example.com/albums/songs_of_freedom.jpg', 'EP', 4, 2),
(5, 'Folk Tales', '2023-02-15', 'https://example.com/albums/folk_tales.jpg', 'Album', 5, 5),
(6, 'Builder\'s Anthem', '2021-11-12', 'https://example.com/albums/builders_anthem.jpg', 'Single', 6, 6),
(7, 'Mixed Emotions', '2022-01-20', 'https://example.com/albums/mixed_emotions.jpg', 'Album', 7, 7),
(8, 'Ballads of the Brave', '2023-03-01', 'https://example.com/albums/ballads_of_the_brave.jpg', 'EP', 8, 9),
(9, 'Elmo\'s Sing-Along', '2023-03-15', 'https://example.com/albums/elmos_sing_along.jpg', 'Album', 9, 12),
(10, 'Fairy Dreams', '2021-08-22', 'https://example.com/albums/fairy_dreams.jpg', 'Single', 10, 8),
(11, 'Wizarding Tunes', '2020-12-01', 'https://example.com/albums/wizarding_tunes.jpg', 'EP', 11, 5),
(12, 'Ron’s Rhythms', '2022-10-05', 'https://example.com/albums/rons_rhythms.jpg', 'Single', 12, 3),
(13, 'Songs of Wisdom', '2021-07-14', 'https://example.com/albums/songs_of_wisdom.jpg', 'Album', 13, 4),
(14, 'Asgardian Rock', '2022-04-30', 'https://example.com/albums/asgardian_rock.jpg', 'Album', 14, 1),
(15, 'Gotham Nights', '2023-05-25', 'https://example.com/albums/gotham_nights.jpg', 'Album', 15, 11);



CREATE TABLE `User` (
    `UID` INT PRIMARY KEY,
    `user_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `birthday_user` DATE,
    `followers_no` INT DEFAULT 0,
    `following_no` INT DEFAULT 0,
    `subscription_ID` INT,
	`profile_picture` VARCHAR(255),
	`street_address` VARCHAR(255),
    `city` VARCHAR(100),
    `state` VARCHAR(100),
    `zip_code` VARCHAR(10)
);

INSERT INTO `User` (UID, user_name, email, password, birthday_user, followers_no, following_no, subscription_ID, profile_picture, street_address, city, state, zip_code) VALUES
(101, 'john_doe', 'john.doe@example.com', 'password123', '1990-05-15', 120, 50, 1, 'https://example.com/profiles/john.jpg', '123 Elm St', 'Springfield', 'IL', '62701'),
(102, 'jane_smith', 'jane.smith@example.com', 'securePass456', '1985-10-30', 200, 150, 2, 'https://example.com/profiles/jane.jpg', '456 Oak St', 'Hometown', 'CA', '90210'),
(103, 'mike_jones', 'mike.jones@example.com', 'mypassword789', '1992-03-22', 75, 30, 1, 'https://example.com/profiles/mike.jpg', '789 Pine St', 'Metropolis', 'NY', '10001'),
(104, 'sara_connor', 'sara.connor@example.com', 'pass1234', '1998-12-11', 300, 200, 3, 'https://example.com/profiles/sara.jpg', '321 Maple St', 'Gotham', 'NJ', '07001'),
(105, 'alice_wonder', 'alice.wonder@example.com', 'alicePassword!', '1995-07-18', 50, 20, NULL, 'https://example.com/profiles/alice.jpg', '654 Birch St', 'Wonderland', 'TX', '73301'),
(106, 'bob_builder', 'bob.builder@example.com', 'buildIt123', '1988-01-25', 10, 5, 1, 'https://example.com/profiles/bob.jpg', '987 Cedar St', 'Tooltown', 'FL', '33101'),
(107, 'charlie_brown', 'charlie.brown@example.com', 'goodgrief!', '1993-08-02', 85, 45, 2, 'https://example.com/profiles/charlie.jpg', '555 Cherry St', 'Peanuts', 'MA', '02101'),
(108, 'diana_prince', 'diana.prince@example.com', 'wonderWoman99', '1986-09-19', 150, 80, 3, 'https://example.com/profiles/diana.jpg', '888 Amazon St', 'Themyscira', 'WA', '98001'),
(109, 'elmo_red', 'elmo.red@example.com', 'tickleMe123', '2010-02-03', 500, 500, NULL, 'https://example.com/profiles/elmo.jpg', '444 Sesame St', 'New York', 'NY', '10002'),
(110, 'fiona_fair', 'fiona.fair@example.com', 'fairyTale456', '1990-11-21', 120, 60, 1, 'https://example.com/profiles/fiona.jpg', '222 Fairy St', 'Enchanted', 'OR', '97001'),
(111, 'harry_potter', 'harry.potter@example.com', 'expelliarmus!', '1985-07-31', 300, 200, 4, 'https://example.com/profiles/harry.jpg', '12 Grimmauld Pl', 'London', 'UK', 'W1A 1AA'),
(112, 'ron_weasley', 'ron.weasley@example.com', 'weasley123', '1985-03-01', 250, 180, 4, 'https://example.com/profiles/ron.jpg', '4 The Burrow', 'Ottery St Catchpole', 'UK', 'EX11 1AA'),
(113, 'hermione_granger', 'hermione.granger@example.com', 'knowitall99', '1985-09-19', 350, 300, 4, 'https://example.com/profiles/hermione.jpg', '7/8 Grimmauld Pl', 'London', 'UK', 'W1A 1AA'),
(114, 'thor_odinson', 'thor.odinson@example.com', 'mjolnir2021', '1990-03-29', 150, 100, NULL, 'https://example.com/profiles/thor.jpg', 'Asgard', 'Asgard', 'NA', '00001'),
(115, 'bruce_wayne', 'bruce.wayne@example.com', 'batman@wayne.com', '1980-02-19', 400, 350, 5, 'https://example.com/profiles/bruce.jpg', '1007 Mountain Dr', 'Gotham', 'NJ', '07002');



CREATE TABLE `User_Contact` (
    `UID` INT,
    `phone_number` VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (UID) REFERENCES User(UID)
);

INSERT INTO `User_Contact` (UID, phone_number) VALUES
(101, '123-456-7890'),
(102, '234-567-8901'),
(103, '345-678-9012'),
(104, '456-789-0123'),
(105, '567-890-1234'),
(106, '678-901-2345'),
(107, '789-012-3456'),
(108, '890-123-4567'),
(109, '901-234-5678'),
(110, '012-345-6789'),
(101, '111-222-3333'),  
(102, '222-333-4444'),  
(111, '333-444-5555'),
(112, '444-555-6666'),
(113, '555-666-7777'),
(114, '666-777-8888'),
(115, '777-888-9999');


CREATE TABLE `Subscription` (
    `subscription_ID` INT PRIMARY KEY,
    `start_date` DATE,
    `end_date` DATE,
    `plan_type` ENUM('Individual', 'Family', 'Student', 'Trial') NOT NULL,
    `cost` DECIMAL(6, 2)
);

INSERT INTO `Subscription` (subscription_ID, start_date, end_date, plan_type, cost) VALUES
(1, '2023-01-01', '2024-01-01', 'Individual', 9.99),
(2, '2023-02-15', '2024-02-15', 'Family', 14.99),
(3, '2023-03-01', '2024-03-01', 'Student', 4.99),
(4, '2023-04-10', '2024-04-10', 'Trial', 0.00),
(5, '2023-05-20', '2024-05-20', 'Individual', 9.99),
(6, '2023-06-15', '2024-06-15', 'Family', 14.99),
(7, '2023-07-05', '2024-07-05', 'Student', 4.99),
(8, '2023-08-30', '2024-08-30', 'Trial', 0.00),
(9, '2023-09-15', '2024-09-15', 'Individual', 9.99),
(10, '2023-10-01', '2024-10-01', 'Family', 14.99),
(11, '2023-11-10', '2024-11-10', 'Student', 4.99),
(12, '2023-12-01', '2024-12-01', 'Trial', 0.00),
(13, '2024-01-05', '2025-01-05', 'Individual', 9.99),
(14, '2024-02-20', '2025-02-20', 'Family', 14.99),
(15, '2024-03-15', '2025-03-15', 'Student', 4.99);


CREATE TABLE `Playlist` (
    `playlist_ID` INT PRIMARY KEY,
    `playlist_name` VARCHAR(100) NOT NULL,
    `UID` INT,
    FOREIGN KEY (UID) REFERENCES User(UID)
);

INSERT INTO Playlist (playlist_ID, playlist_name, UID) VALUES
(1, 'Chill Vibes', 101),
(2, 'Workout Pump', 102),
(3, 'Study Playlist', 103),
(4, 'Road Trip Jams', 104),
(5, 'Party Mix', 101),
(6, 'Classical Favorites', 105),
(7, 'Rock Classics', 106),
(8, 'Pop Hits', 102),
(9, 'Relax & Unwind', 107),
(10, 'Indie Discoveries', 103),
(11, 'Jazz Essentials', 108),
(12, 'Throwback Tunes', 104),
(13, 'Hip Hop Anthems', 106),
(14, 'Country Roads', 105),
(15, 'EDM Party', 107);

CREATE TABLE `Song` (
    `SID` INT PRIMARY KEY,
    `sname` VARCHAR(100) NOT NULL,
    `duration` TIME,
    `artist_ID` INT,
    `album_ID` INT,
    `GID` INT,
    FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID),
    FOREIGN KEY (album_ID) REFERENCES Album(album_ID),
    FOREIGN KEY (GID) REFERENCES Genre(GID)
);

INSERT INTO `Song` (SID, sname, duration, artist_ID, album_ID, GID) VALUES
(1, 'Dreams Unfold', '00:03:45', 1, 1, 1),
(2, 'Heartstrings', '00:04:20', 2, 2, 3),
(3, 'Take Me Home', '00:02:50', 3, 3, 4),
(4, 'Freedom Call', '00:03:15', 4, 4, 2),
(5, 'Whispers in the Wind', '00:03:10', 5, 5, 5),
(6, 'Building Up', '00:02:40', 6, 6, 6),
(7, 'Emotional Waves', '00:03:55', 7, 7, 7),
(8, 'Courageous Hearts', '00:04:05', 8, 8, 9),
(9, 'Elmo’s Fun Song', '00:02:30', 9, 9, 12),
(10, 'Fairy Tale Endings', '00:03:50', 10, 10, 8),
(11, 'Magic in the Air', '00:04:30', 11, 11, 5),
(12, 'Ron’s Dance', '00:03:05', 12, 12, 3),
(13, 'Wisdom’s Echo', '00:04:15', 13, 13, 4),
(14, 'Thunderous Rock', '00:03:40', 14, 14, 1),
(15, 'Nights in Gotham', '00:04:00', 15, 15, 11);


CREATE TABLE `Playlist_Song` (
    `playlist_ID` INT,
    `SID` INT,
    PRIMARY KEY (playlist_ID, SID),
    FOREIGN KEY (playlist_ID) REFERENCES Playlist(playlist_ID),
    FOREIGN KEY (SID) REFERENCES Song(SID)
);


INSERT INTO Playlist_Song (playlist_ID, SID) VALUES
(11, 2),
(3, 10),
(3, 5),
(4, 12),
(14, 13),
(5, 12),
(11, 10),
(9, 3),
(7, 12),
(4, 9),
(15, 14),
(10, 12),
(10, 9),
(13, 4),
(5, 3);



CREATE TABLE `Song_Review` (
    `review_ID` INT PRIMARY KEY,
    `rating` INT CHECK (rating BETWEEN 1 AND 5),
    `review_date` DATE,
    `review_text` TEXT,
    `UID` INT,
    `SID` INT,
    FOREIGN KEY (UID) REFERENCES User(UID),
    FOREIGN KEY (SID) REFERENCES Song(SID)
);

INSERT INTO `Song_Review` (review_ID, rating, review_date, review_text, UID, SID) VALUES
(1, 5, '2023-01-15', 'Absolutely loved this song!', 101, 1),
(2, 4, '2023-02-20', 'Great melody and lyrics.', 102, 2),
(3, 3, '2023-03-10', 'It was okay, not my favorite.', 103, 3),
(4, 5, '2023-04-05', 'A masterpiece!', 104, 4),
(5, 2, '2023-05-22', 'Not really my style.', 105, 5),
(6, 4, '2023-06-17', 'Enjoyable but a bit repetitive.', 106, 6),
(7, 1, '2023-07-12', 'Did not like it at all.', 107, 7),
(8, 5, '2023-08-20', 'Perfect for my playlist!', 108, 8),
(9, 3, '2023-09-15', 'Had higher expectations.', 109, 9),
(10, 4, '2023-10-01', 'Very catchy tune!', 110, 10),
(11, 2, '2023-11-11', 'Not bad, but could be better.', 111, 11),
(12, 5, '2023-12-05', 'Love this artist!', 112, 12),
(13, 4, '2024-01-10', 'Great production quality.', 113, 13),
(14, 1, '2024-02-15', 'Really not impressed.', 114, 14),
(15, 5, '2024-03-20', 'An instant classic!', 115, 15);


SELECT user_name AS UserName, followers_no AS Followers
FROM User
ORDER BY followers_no DESC
LIMIT 5;

SELECT artist_name AS Artist, genre_name AS Genre
FROM Artist
JOIN Genre ON Artist.GID = Genre.GID
WHERE Genre.genre_name = 'Fantasy'; 

SELECT user_name AS User, plan_type AS SubscriptionPlan, cost AS MonthlyCost
FROM User
JOIN Subscription ON User.subscription_ID = Subscription.subscription_ID
WHERE plan_type = 'Trial';

SELECT User.user_name AS User, Song_Review.rating AS Rating, Song_Review.review_text AS Review
FROM Song_Review
JOIN User ON Song_Review.UID = User.UID
WHERE Song_Review.SID = 2; 

SELECT *
FROM Song
ORDER BY SID DESC
LIMIT 5;
