use world;

show tables;

describe city;
describe country;
describe countrylanguage;

select * from city;
select * from country;
select * from countrylanguage;

select Code
from country
WHERE Continent = 'North America';

SELECT *
from countrylanguage
WHERE CountryCode IN (select Code
from country
WHERE Continent = 'North America') AND IsOfficial = 'T' AND Language = 'English';

# 1. count of cities
SELECT COUNT(*)
FROM city;

# 2. Country having highest number of cities
SELECT countrycode, COUNT(*)
FROM city
GROUP BY countrycode
ORDER BY COUNT(*) DESC;

# 3. Which language is its country’s official language and spoken by 80 to 90 percent of people
SELECT CountryCode, Language, Percentage
FROM countrylanguage
WHERE isOfficial = 'T' AND Percentage BETWEEN 80 AND 90;

# 4. In India, how many cities have been listed in “Maharashtra” district?
-- Which table? city table
-- Use WHERE clause to select only cities in Maharashtra district - then count the records
SELECT COUNT(*)
FROM city
WHERE district = 'Maharashtra';

# 5. Which country has the maximum population (if population is taken as the population from the country table)

-- Method 1
-- Step 1a)
SELECT MAX(population)
FROM Country;
-- We note the result: 1277558000

-- Step 1b)
-- use the above result
SELECT Name, Population
FROM country
WHERE population = 1277558000;

-- we can combine 1a) and 1b) together - the SELECT MAX(..).. query is called a "subquery" - the result of the subquery is used in the WHERE clause.
SELECT Name, Population
FROM country
WHERE population = (SELECT MAX(population)
FROM Country);


-- Method 2.
SELECT Name, Population
FROM Country
ORDER BY Population DESC
LIMIT 1;

# 6. Which language is spoken in the maximum number of countries?
SELECT Language, COUNT(*)
FROM countrylanguage
GROUP BY Language
ORDER By COUNT(*) DESC;

# 7. Among the following, which language is the official language of the most number of countries?
-- German, Russian, Chinese
-- solution 1 (better soluton since we filter out unnecessary languages first)
select language, COUNT(*)
from countrylanguage
WHERE IsOfficial = 'T' AND Language IN ('German', 'Russian', 'Chinese')
GROUP By language;

-- solution 2 (not so good since we filter out unnecessary languages only after group by)
select language, COUNT(*)
from countrylanguage
WHERE IsOfficial = 'T'
GROUP By language
HAVING language IN ('German', 'Russian', 'Chinese');

# 8. How many countries in North America are there where English is the official language
select *
from country INNER JOIN countrylanguage ON country.code = countrylanguage.CountryCode
WHERE continent = 'North America' AND Language = 'English' AND IsOfficial = 'T';


# 9. Which city has the maximum population
SELECT Name, population
FROM city
ORDER by population DESC
LIMIT 1;

SELECT Name
FROM city where population = (SELECT MAX(population)
FROM city);


# 10. How many row entries are there with any value in the country table being missing

# 11. How many countries are there whose name starts with I and ends with A
SELECT COUNT(*)
FROM country
WHERE Name LIKE 'I%A';

# 12. Which continent has least surface area
SELECT continent, SUM(SurfaceArea)
FROM country
GROUP BY continent
ORDER BY SUM(SurfaceArea);

# 13. The top 5 languages spoken in India
SELECT language, Percentage
FROM countrylanguage
WHERE CountryCode = 'IND'
ORDER BY Percentage DESC;

/*Hindi
Bengali
Telugu
Marathi
Tamil
*/

# 14. How many languages are spoken (as per data available) in each country?
# Present your results in descending order of number of languages spoken.
SELECT countrycode, COUNT(*)
FROM countrylanguage
GROUP BY countrycode
ORDER BY COUNT(*) DESC;