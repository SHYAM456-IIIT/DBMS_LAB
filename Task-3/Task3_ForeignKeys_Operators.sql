USE PlaystoreDB;

-- Level 0

ALTER TABLE Apps
ADD CONSTRAINT fk_developer
FOREIGN KEY (DeveloperID)
REFERENCES  Developers(DeveloperID);

ALTER TABLE Apps
ADD CONSTRAINT fk_publisher
FOREIGN KEY (PublisherID)
REFERENCES Publishers(PublisherID);

SELECT * FROM Apps;
SHOW CREATE TABLE APPS;

ALTER TABLE Apps
ADD CONSTRAINT fk_cateories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

SELECT *
FROM APPS 
WHERE rating > 4.5;

SELECT *
FROM APPS 
WHERE PRICE = 0;

SELECT *
FROM Apps
WHERE CategoryID = 305;

-- Level 1

SELECT * 
FROM Apps
WHERE Downloads > 500000000;

SELECT * 
FROM Apps
WHERE rating between 4.5 and 4.7;

SELECT * 
FROM Apps
WHERE price IN(0,299);

SELECT *
FROM Apps 
WHERE Appname LIKE "G%";

SELECT *
FROM Apps
WHERE Appname LIKE "%GOOGLE%";

SELECT *
FROM Apps
WHERE rating > 4.0 and Downloads > 500000000;

SELECT *
FROM Apps
WHERE CategoryID = 301 or CategoryID = 305;

SELECT *
FROM Apps
WHERE Appname NOT LIKE "%G%";

SELECT *
FROM Apps
WHERE rating < 4.5 and Downloads > 1000000000;

SELECT *
FROM Apps
WHERE Appname LIKE "%a%";

SELECT *
FROM Apps
WHERE price between 0 and 300;

SELECT *
FROM Apps
WHERE PublisherID = 201 or PublisherID = 204;

SELECT *
FROM Apps
WHERE PublisherID IN(201,204);

SELECT *
FROM Apps
WHERE CategoryID != 305;


