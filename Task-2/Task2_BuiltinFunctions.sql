USE PlayStoredb;

-- LEVEL 0

SELECT UPPER(DeveloperName) FROM developers;
SELECT LOWER(DeveloperName) FROM developers;

select length(Appname) from Apps;
SELECT Appname,LENGTH(Appname) FROM APPS;

select current_date(), current_time();

select rating, round(rating, 0) from apps;

-- LEVEL 1
select Appname, substring(Appname,1,5) from Apps;

select concat(DeveloperName,' ',Country) from Developers;

select round(rating) from apps;

select ceil(Price) from Apps;

select DeveloperName, FoundedYear from Developers;

select cast(Downloads as char) from Apps;

-- LEVEL 2

select upper(Appname),rating from Apps;

select substring(CategoryName, 1, 3) from Categories;

select Appname, abs(Price - 200) from Apps;

select DeveloperName, Length(DeveloperName) from Developers;

Select current_date(), current_timestamp();

select cast(1234 as char);


