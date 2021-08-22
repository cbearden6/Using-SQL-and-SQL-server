# Project 2 - Cody Bearden

USE world;

#1 - 4079 rows returned
SELECT Name, District, population
FROM city;

#2 - 239 rows returned 
SELECT Name AS `Country`, SurfaceArea AS `Area`, Continent
From country;

#3 - 239 rows returned
SELECT Name, round(Population * .11) AS `Expected Population`
FROM country;

#4 - 179 rows returned
SELECT Name, Population
FROM country
WHERE Population <= 15000000;

#5 - 457 rows returned
SELECT DISTINCT Language
From CountryLanguage;

#6 - 24 rows returned 
SELECT Name, GNP, GNPOld
FROM country
WHERE GNP > '200000' || GNPOld > '200000';

#7 - 59 rows returned
SELECT *
FROM countrylanguage
WHERE IsOfficial = 'T' && Percentage > '90';

#8 - 151 rows returned
SELECT Name, GovernmentForm
FROM country
WHERE GovernmentForm IN ('Republic', 'constitutional monarchy');

#9 - 39 rows returned
SELECT Name, IndepYear
FROM country
WHERE IndepYear BETWEEN 1900 AND 1950;

#10 - 2 rows returned
SELECT DISTINCT Language
FROM countrylanguage
WHERE Language like 'Ne%';

#11 - 17 rows returned 
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NULL;

#12 - 5 rows returned
SELECT DISTINCT Language
FROM countrylanguage
WHERE Language LIKE 'Y%'
ORDER BY language;

#13 - 5 rows returned
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy >= '80'
ORDER BY LifeExpectancy DESC;

#14 - 548 rows returned 
SELECT Name, District, Population
FROM city
WHERE Name = District
ORDER BY Population DESC;

#15 - 50 rows returned 
SELECT Name, Region, SurfaceArea, Population
FROM country
WHERE Region = 'Caribbean'&& SurfaceArea < 500 || Population < 100000;


/* 1.2 Design
postalcodes table:
City(PK)          CHAR(20)     Not Null
Postal Code       CHAR(6)      Not Null
Households        INT(8)       Not Null      
Active            CHAR(1)      Not Null
*/


