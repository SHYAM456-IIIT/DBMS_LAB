USE PlaystoreDB;

-- LEVEL 1

-- 1
CREATE VIEW All_Apps as 
SELECT *
FROM Apps;
SELECT * FROM All_Apps;

-- 2 
CREATE VIEW App_Summary as 
SELECT AppID, AppName, Rating, Price
FROM Apps;
SELECT * From App_Summary;

-- 3
CREATE VIEW Highly_Rated_Apps as 
SELECT AppID, AppName, Rating
FROM Apps
WHERE Rating > 4.5;
SELECT * FROM Highly_Rated_Apps;

-- 4
CREATE VIEW Free_Apps as 
SELECT AppID, AppName, Price
FROM Apps
WHERE Price = 0;
SELECT * FROM Free_Apps;

-- 5
SELECT * FROM Highly_Rated_Apps;

-- 6
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- LEVEL 2
-- 1
CREATE VIEW App_Developer_VIEW as
SELECT A.AppName, D.DeveloperName 
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM App_Developer_VIEW;

 -- 2
CREATE VIEW App_Publisher_VIEW as
SELECT A.AppName, P.PublisherName 
FROM Apps as A
INNER JOIN Publishers as P
ON A.PublisherID = P.PublisherID;
SELECT * FROM App_Publisher_VIEW;

-- 3
CREATE VIEW App_Categories_VIEW as
SELECT A.AppName, C.CategoryName
FROM Apps as A
INNER JOIN Categories as C
ON A.CategoryID = C.CategoryID;
SELECT * FROM App_Categories_VIEW;

-- 4
CREATE VIEW App_Developer_Details as 
SELECT A.AppName, D.DeveloperName, D.Country
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM App_Developer_Details;

-- 5
CREATE VIEW Category_App_Count as 
SELECT CategoryID, COUNT(*) as Total_Applications
FROM Apps 
GROUP BY CategoryID;
SELECT * FROM Category_App_Count;

-- LEVEL 3
-- 1
CREATE VIEW Category_Details as 
SELECT C.CategoryName, COUNT(A.AppID) as Total_Applications
FROM Apps as A
INNER JOIN Categories as C
ON A.CategoryID = C.CategoryID
GROUP BY C.CategoryName;
SELECT * FROM Category_Details;

-- 2
CREATE VIEW MultiApp_Developers as 
SELECT D.DeveloperName, COUNT(A.AppID) as Total_Applications
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID
GROUP BY D.DeveloperID
HAVING COUNT(A.AppID) > 1;
SELECT * FROM MultiApp_Developers;

-- 3
CREATE VIEW Category_Rating_Range as
SELECT C.CategoryName, MAX(A.Rating) as Highest_Rating, MIN(A.Rating) as Lowest_Rating
FROM Categories as C
INNER JOIN Apps as A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID,C.CategoryName;
SELECT * FROM Category_Rating_Range;

-- 4
CREATE VIEW Developers_Applications as 
SELECT D.DeveloperName, COUNT(A.AppID) as Total_Applications
FROM Developers as D
LEFT JOIN Apps as A
ON A.DeveloperID = D.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName;
SELECT * FROM Developers_Applications;

-- 5
CREATE OR REPLACE VIEW Complete_App_Details as 
SELECT A.AppName, D.DeveloperName, P.PublisherName, C.CategoryName
FROM Apps as A
INNER JOIN Developers as D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers as P
ON P.PublisherID = A.PublisherID
INNER JOIN Categories as C
ON C.CategoryID = A.CategoryID;
SELECT * FROM Complete_App_Details;

