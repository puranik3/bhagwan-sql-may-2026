-- ### Q1. Distinct values in one column
-- Write a query to list all different continents that appear in the country table.
SELECT DISTINCT Continent FROM world.country;

-- ### Q2. Distinct combinations of two columns
-- Write a query to list all distinct `(Continent, Region)` pairs from the `country` table, sorted by `Continent` and then `Region`.
SELECT DISTINCT Continent, Region FROM world.country ORDER BY Continent, Region;

-- ### Q3. Compare with and without DISTINCT
-- Run these two queries and compare the results:

-- ```sql world.sql
-- -- Q3a. Continent values (with duplicates)
-- SELECT Continent
-- FROM country
-- ORDER BY Continent
-- LIMIT 30;

-- -- Q3b. Distinct continents (no duplicates)
-- SELECT DISTINCT Continent
-- FROM country
-- ORDER BY Continent;
-- ```

-- Question:
-- What is the difference between the result sets, and what does that tell you about `DISTINCT`?
-- Answer: First returns distinct Continent names, second does not

-- ### Q4. DISTINCT on an expression
-- Write a query that:

-- - Computes `FLOOR(Population / 10000000)` (population in “tens of millions”) for each country, and
-- - Returns only the distinct values of that expression, sorted in ascending order.
SELECT DISTINCT FLOOR(Population / 10000000) AS ten_millions FROM world.country ORDER BY ten_millions;

## B. COUNT(DISTINCT ...)

-- ### Q5. Counting rows vs distinct values
-- Run these three queries:

-- ```sql world.sql
-- Q5a. Total number of countries
SELECT COUNT(*) AS total_countries
FROM country;

-- Q5b. Number of distinct regions
SELECT COUNT(DISTINCT Region) AS distinct_regions
FROM country;

-- Q5c. Number of distinct (Continent, Region) pairs
SELECT COUNT(DISTINCT Continent, Region) AS distinct_continent_region_pairs
FROM country;
-- ```
-- Questions:

-- 1. How do the three counts differ?
-- 2. What does each `COUNT` tell you about the data?


-- ## C. NULL, DISTINCT, and “NOT DISTINCT” (NULL-safe comparisons)

-- ### Q6. Equality vs NULL
-- Run:

-- ```sql world.sql
-- Q6a. Countries that became independent in 1776
SELECT Name, IndepYear
FROM country
WHERE IndepYear = 1776;

-- Q6b. Equality with NULL
SELECT Name, IndepYear
FROM country
WHERE IndepYear = NULL;
-- ```

-- Then also run:

-- Q6c. Checking for NULL correctly
SELECT Name, IndepYear
FROM country
WHERE IndepYear IS NULL;
