-- HOMEWORK 2
-- EDILSON ALBERTO, BESNIK SHUAIPAJ, WILL MORRISSEY, HRIDETA RIMU

-- EXERCISE 1
SELECT count(*) as LOADEDeachTime FROM hw2.coach;
SELECT count(*) as LOADEDeachTime FROM hw2.person;
SELECT count(*) as LOADEDeachTime FROM hw2.player;
SELECT count(*) as LOADEDeachTime FROM hw2.team;

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

-- EXERCISE 9
SELECT BioID, Won AS MostGamesWon
FROM hw2.coach
WHERE Won = (SELECT MAX(Won) FROM hw2.coach);

-- EXERCISE 10
SELECT concat(round((sum(CASE WHEN `points` = 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 4), '%') as NONSCORERS
FROM hw2.player;

-- EXERCISE 11
SELECT count(*) AS LOSERS
FROM hw2.team
WHERE `Lost` > `Won`;

-- EXERCISE 12
SELECT `confID`, COUNT(*) AS CONFSIZE
FROM hw2.team
GROUP BY `confID`;

-- EXERCISE 13
SELECT  `BirthCountry,`, COUNT(*) AS NUMLANDS
FROM hw2.person
WHERE `BirthCountry,` is not NULL
GROUP BY `BirthCountry,`;

-- EXERCISE 14
SELECT 
    t1.Won,
    t1.Lost,
    LEAST(t1.Name, t2.Name) AS TEAM1,
    GREATEST(t1.Name, t2.Name) AS TEAM2
FROM 
    hw2.team t1
JOIN 
    hw2.team t2 ON t1.Won = t2.Won 
                AND t1.Lost = t2.Lost 
                AND t1.Name <> t2.Name
ORDER BY 
    TEAM1, TEAM2;

-- EXERCISE 15
SELECT Ranking, AVG(Lost) as AVLOSSES
FROM hw2.team
WHERE ConfID = 'EC'
GROUP BY `Ranking`;

-- EXERCISE 16

SELECT 'INVALID' AS ANYPROBLEMS
FROM hw2.team
WHERE Games != (Won + Lost)

UNION ALL

SELECT 'INVALID' AS ANYPROBLEMS
FROM hw2.person
WHERE `BirthCountry,` = ',';

SELECT NULL AS ANYPROBLEMS
WHERE NOT EXISTS (SELECT 1 FROM hw2.team WHERE Games != (Won + Lost)) AND NOT EXISTS (SELECT 1 FROM hw2.person WHERE BirthCountry = ',');
