USE playstoredb;

-- LEVEL 0
-- 1
SELECT Dev.DeveloperID,Dev.DeveloperName,Apps.AppName
FROM Developers as Dev
INNER JOIN Apps 
ON Dev.DeveloperID = Apps.DeveloperID;

-- 2
SELECT Apps.AppName, P.PublisherName
FROM Apps
INNER JOIN Publishers as P
ON Apps.PublisherID = P.PublisherID;

-- 3
SELECT Apps.AppName, C.CategoryName
FROM Apps
INNER JOIN Categories as C
ON Apps.CategoryID = C.CategoryID;

-- 4
SELECT Apps.AppName, Dev.DeveloperName, P.PublisherName
FROM Apps
INNER JOIN Developers as Dev
ON Apps.DeveloperID = Dev.DeveloperID
INNER JOIN Publishers as P
ON Apps.PublisherID = P.PublisherID;

-- 5
SELECT Apps.AppName, Dev.DeveloperName, C.CategoryName
FROM Apps
INNER JOIN Developers as Dev
ON Apps.DeveloperID = Dev.DeveloperID
INNER JOIN Categories as C
ON Apps.CategoryID = C.CategoryID;

-- LEVEL 1
-- 1
SELECT P.PublisherName, Apps.AppName
FROM Publishers as P
LEFT JOIN Apps
ON P.PublisherID = Apps.PublisherID;

-- 2
SELECT Apps.AppName, P.PublisherID
FROM Publishers as P
RIGHT JOIN Apps
ON Apps.PublisherID = P.PublisherID;

-- 3
SELECT C.CategoryName, Apps.AppName
FROM Categories as C
LEFT JOIN Apps
ON C.CategoryID = Apps.CategoryID;

-- 4
SELECT A.AppName, D.DeveloperName, D.Country
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID;

-- 5
SELECT A.AppName, D.DeveloperName, P.PublisherName, C.CategoryName
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers as P
ON P.PublisherID = A.PublisherID
INNER JOIN Categories as C
ON C.CategoryID = A.CategoryID;

-- Level 2
-- 2
SELECT P.PublisherName, A.AppName
FROM Publishers as P
LEFT JOIN Apps as A
ON P.PublisherID = A.PublisherID
WHERE A.AppID IS NULL;

-- 3
SELECT A.AppName, C.CategoryName
FROM Apps as A
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID
ORDER BY CategoryName ASC;

-- 4
SELECT A.AppName, D.DeveloperName, P.PublisherName, C.CategoryName, A.Rating
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Categories as C
ON C.CategoryID = A.CategoryID
INNER JOIN Publishers as P
ON A.PublisherID = P.PublisherID;

-- 5
SELECT A.AppName, D.DeveloperName, D.Country, P.PublisherName
FROM Apps as A
INNER JOIN Developers as D
ON D.DeveloperID = A.DeveloperID
INNER JOIN Publishers as P
ON P.PublisherID = A.PublisherID
WHERE D.Country = 'USA' AND P.PublisherName = 'Google Play';

-- 7
SELECT D1.DeveloperName as Developer1, D2.DeveloperName as Developer2, D1.Country
FROM Developers as D1
INNER JOIN Developers as D2
ON D1.Country = D2.Country AND D1.DeveloperID < D2.DeveloperID;

