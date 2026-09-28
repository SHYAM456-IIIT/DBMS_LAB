USE PlaystoreDB;
 
 -- LEVEL 0

UPDATE Apps
SET rating = 4.6
WHERE AppID = 1002;
COMMIT;

START TRANSACTION;
UPDATE Apps
SET Price = 199
WHERE AppID = 1006;
ROLLBACK;

INSERT INTO Apps
VALUES(1012,'Claude',101,201,303,4.6,80000000,300);
COMMIT;

START TRANSACTION;
INSERT INTO Developers
VALUES(105,'Anthropic','USA',2021);
ROLLBACK;

START TRANSACTION;
UPDATE Apps
SET rating = 4.5
WHERE AppID = 1004;
SAVEPOINT rating_updated;

-- LEVEL 1

START TRANSACTION;

UPDATE Apps
SET rating = 4.7
WHERE AppID = 1004;
SAVEPOINT S1;

UPDATE Apps
SET rating = 5
WHERE AppID = 1005;

-- 2
UPDATE Apps
SET rating = 3.5
WHERE AppID = 1001;

ROLLBACK TO SAVEPOINT S1;

-- 3
START TRANSACTION;
INSERT INTO Apps
VALUES(1013,'Gemini',101,201,301,4.5,100000000,250);

SAVEPOINT app_inserted;

UPDATE Apps
SET Price = 100
WHERE AppID = 1013;

ROLLBACK TO SAVEPOINT app_inserted;
select * from apps;

-- 4
CREATE USER 
'task5user'@'localhost'
IDENTIFIED BY 'Task5@123';

GRANT SELECT 
ON PlaystoreDB.Apps
TO 'task5user'@'localhost';

-- 5
GRANT SELECT, INSERT
ON PlaystoreDB.Apps
TO 'task5user'@'localhost';

-- 6
REVOKE INSERT 
ON PlaystoreDB.Apps
FROM 'task5user'@'localhost';

-- LEVEL 2
UPDATE Apps
SET Price = 460
WHERE AppID = 1002;
SAVEPOINT S1;

UPDATE Apps
SET Price = 90
WHERE AppID = 1004;
SAVEPOINT S2;

ROLLBACK TO SAVEPOINT S1;

-- 2
START TRANSACTION;
INSERT INTO Categories
VALUES
(307,'Health',12),
(308,'Travel',12);

SAVEPOINT category_sp;

INSERT INTO Categories
VALUES(309,'Finance',18);

ROLLBACK TO SAVEPOINT category_sp;

-- 3
GRANT SELECT, INSERT, UPDATE
ON PlaystoreDB.Apps
TO 'task5user'@'localhost';

-- 4
REVOKE SELECT
ON PlaystoreDB.Apps
FROM 'task5user'@'localhost';

-- 5
GRANT SELECT 
ON PlaystoreDB.Developers
TO 'task5user'@'localhost';

REVOKE SELECT
ON PlaystoreDB.Developers
FROM 'task5user'@'localhost';

-- 6
START TRANSACTION;

UPDATE Apps
SET rating = 4.6
WHERE AppID = 1005;

UPDATE Apps
SET Price = 1000
WHERE AppID = 1007;

INSERT INTO Apps
VALUES(1014,'AI Learning App',101,201,301,4.7,1000000,149);

COMMIT;

-- 7
START TRANSACTION;

UPDATE Apps
SET Price = 50
WHERE AppID = 1011;

ROLLBACK;

SELECT * FROM Apps;
SELECT * FROM Publishers;
SELECT * FROM Developers;
SELECT * FROM Categories;