USE PlayStoreDB;

-- Level 0

SELECT COUNT(*)
FROM Apps;

SELECT AVG(rating) as AverageRating
FROM Apps;

SELECT MAX(rating)
FROM Apps;

SELECT MIN(rating)
FROM Apps;

SELECT SUM(downloads) as TotalDownloads
FROM Apps;

SELECT AppName, Rating 
FROM Apps
ORDER BY rating DESC;

-- Level 1

SELECT CategoryID, COUNT(AppID)
FROM Apps
GROUP BY CategoryID; 

SELECT CategoryID, AVG(rating)
FROM Apps
GROUP BY CategoryID;

SELECT MAX(price) as MaxPrice, MIN(price) as MinPrice
FROM Apps;

SELECT AppName, Downloads 
FROM Apps
ORDER BY Downloads DESC;

SELECT DeveloperID, COUNT(AppID) as Apps
FROM Apps
GROUP BY DeveloperID;

SELECT CategoryID, COUNT(AppID)
FROM Apps
GROUP BY CategoryID 
HAVING COUNT(AppID) > 1;

-- Level 3
SELECT DeveloperID, SUM(Downloads) as Downloads
FROM Apps
GROUP BY DeveloperID;

SELECT PublisherID, AVG(Rating) as Rating
FROM Apps
GROUP BY PublisherID;

SELECT DeveloperID, COUNT(AppID)
FROM Apps
GROUP BY DeveloperID
HAVING COUNT(AppID) > 1;

SELECT CategoryID, AVG(rating) as Rating
FROM Apps
GROUP BY CategoryID
HAVING AVG(rating) > 4.3;

SELECT CategoryID, COUNT(AppID) as Apps
FROM Apps
GROUP BY CategoryID
ORDER BY COUNT(AppID) DESC;

SELECT AppName, Rating
FROM Apps
WHERE Rating = (SELECT MAX(Rating) FROM Apps);

SELECT DeveloperID, SUM(Price) as TotalPrice
FROM Apps
GROUP BY DeveloperID;

