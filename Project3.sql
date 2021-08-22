# Project 3 - Cody Bearden

USE world;

# 1 - 190 rows returned
SELECT c.Name AS `Country`, cl.Language, cl.Percentage
FROM country c JOIN countrylanguage cl ON c.code = cl.CountryCode
WHERE cl.Percentage > 40
ORDER BY Name;

# 2 - 190 rows returned
SELECT c.Name AS `Country`, cl.Language, cl.Percentage
FROM country c, countrylanguage cl
WHERE c.code = cl.CountryCode && cl.Percentage > 40
ORDER BY Name;

# 3 - 127 rows returned 
SELECT c.Name AS `City`, co.Name AS `Country`
FROM city c JOIN country co ON c.CountryCode = co.code
	JOIN countrylanguage cl ON co.code  = cl.CountryCode
WHERE cl.Language = 'French' && cl.IsOfficial = 'T'
ORDER BY Country, City;

# 4 - 30670 rows returned
SELECT c.Name AS `City`, cl.language, c.population
FROM city c JOIN countrylanguage cl USING (CountryCode);

# 5 - 30670 rows returned
SELECT c.Name AS `City`, cl.language, c.population
FROM city c NATURAL JOIN countrylanguage cl;

# 6 - 30670 rows returned 
SELECT c.Name AS `City`, cl.language
FROM city c LEFT JOIN countrylanguage cl USING (CountryCode);

# 7 - 30670 rows returned
SELECT cl.language, c.Name AS `City`
FROM city c LEFT JOIN countrylanguage cl USING (CountryCode)
ORDER BY cl.language;

# 8 - 239 rows returned - I really made a mess of this one. I left only the parts of the query that worked...
SELECT Name AS `CountryName`, population AS `Small`
FROM country
WHERE population < 1000000
ORDER BY CountryName;

USE ex;

#9 - 6 rows returned
SELECT concat(Emps.first_name, ' ', Emps.last_name) AS `Employee`, concat(Mgrs.first_name, ' ', Mgrs.last_name) AS `Manager`, concat(Execs.first_name, ' ', Execs.last_name) AS `Executive`
FROM Employees Emps JOIN Employees Mgrs ON Emps.manager_id = Mgrs.employee_id
    JOIN Employees Execs ON Execs.employee_id = Mgrs.manager_id
ORDER BY Emps.last_name, Emps.first_name;

# 10 - 72 rows returned
SELECT concat(I.first_name, ' ', I.last_name) AS `Interviewer`, concat(Inter.first_name, ' ', Inter.last_name) AS `Interviewee`
FROM Employees I JOIN Employees Inter
WHERE i.last_name != Inter.last_name
ORDER BY I.last_name, I.first_name;

USE Sakila;

# 11 - 36 rows returned
SELECT cust.first_name, cust.last_name, c.city, ad.district, ad.postal_code
FROM city c JOIN address ad ON c.city_id = ad.city_id
	JOIN customer cust ON ad.address_id = cust.address_id
WHERE c.country_id = 103;

# 12 - 86 rows returned
SELECT DISTINCT f.title, f.length
FROM film f JOIN film_actor fa USING (film_id)
	JOIN actor a USING (actor_id)
WHERE a.last_name = 'Hoffman';

# 13 - 58 rows returned
SELECT f.title
FROM language l JOIN film f USING (language_id)
	JOIN film_category fc USING (film_id)
    JOIN category c USING (category_id)
WHERE l.language_id = 1 && c.category_id = 5;

/* 1.2 Design
alliances table
Code(PK)		CHAR(3)		NN
CountryName		CHAR(52)	NN
AllianceName	CHAR(100) 	null
DateJoined		date(10)	null
AllianceId(FK)		int(10)		null
*/
	


