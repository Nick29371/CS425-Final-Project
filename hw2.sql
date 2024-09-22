-- HOMEWORK 2
-- EDILSON ALBERTO, BESNIK SHUAIPAJ, WILL MORRISSEY, HRIDETA RIMU

-- EXERCISE 1
SELECT * FROM hw2.coach;
SELECT * FROM hw2.person;
SELECT * FROM hw2.player;
SELECT * FROM hw2.team;
-- EXERCISE 2
SELECT * 
FROM hw2.team
ORDER BY `TmID` ASC;

-- EXERCISE 3
SELECT * 
FROM hw2.team
WHERE `Name` LIKE 'MIL%W%K%';

-- EXERCISE 4
SELECT MIN(Games) AS LOWEST,MAX(Games) AS HIGHEST
FROM hw2.coach;

-- EXERCISE 5
SELECT BioID, TmID, Points, Attempts
FROM hw2.player
WHERE `points` > 2000
ORDER BY `points` DESC, `BioID` ASC;

-- EXERCISE 6
SELECT *
FROM hw2.person
WHERE `BirthCountry,` IN ('GAB,', 'EGY,');

-- EXERCISE 7
SELECT 
    p.Points, 
    t.Name AS TeamFullName, 
    c.BioID AS CoachBioID
FROM 
    hw2.player p
JOIN 
    hw2.team t ON p.TmID = t.TmID
JOIN 
    hw2.coach c ON t.TmID = c.TmID
WHERE 
    p.BioID = 'Jamesle01';

-- EXERCISE 8
SELECT *
FROM hw2.person
WHERE (TRIM(`BirthCountry,`) IS NOT NULL AND TRIM(`BirthCountry,`) != ',' AND TRIM(`BirthCountry,`) != '') AND (`BirthCity` IS NULL OR TRIM(`BirthCity`) = '');

