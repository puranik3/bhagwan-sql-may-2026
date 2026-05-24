Here are practice questions only, using the `world` database, focused on `DISTINCT` and “NOT DISTINCT” / NULL-safe comparisons.
Try them yourself; when you’re ready, ask me for explanations/answers.

---

## A. DISTINCT basics

### Q1. Distinct values in one column
Write a query to list all different continents that appear in the `country` table.

---

### Q2. Distinct combinations of two columns
Write a query to list all distinct `(Continent, Region)` pairs from the `country` table, sorted by `Continent` and then `Region`.

---

### Q3. Compare with and without DISTINCT
Run these two queries and compare the results:

```sql world.sql
-- Q3a. Continent values (with duplicates)
SELECT Continent
FROM country
ORDER BY Continent
LIMIT 30;

-- Q3b. Distinct continents (no duplicates)
SELECT DISTINCT Continent
FROM country
ORDER BY Continent;
```

Question:
What is the difference between the result sets, and what does that tell you about `DISTINCT`?

---

### Q4. DISTINCT on an expression
Write a query that:

- Computes `FLOOR(Population / 10000000)` (population in “tens of millions”) for each country, and
- Returns only the distinct values of that expression, sorted in ascending order.

---

## B. COUNT(DISTINCT ...)

### Q5. Counting rows vs distinct values
Run these three queries:

```sql world.sql
-- Q5a. Total number of countries
SELECT COUNT(*) AS total_countries
FROM country;

-- Q5b. Number of distinct regions
SELECT COUNT(DISTINCT Region) AS distinct_regions
FROM country;

-- Q5c. Number of distinct (Continent, Region) pairs
SELECT COUNT(DISTINCT Continent, Region) AS distinct_continent_region_pairs
FROM country;
```

Questions:

1. How do the three counts differ?
2. What does each `COUNT` tell you about the data?

---

## C. NULL, DISTINCT, and “NOT DISTINCT” (NULL-safe comparisons)

### Q6. Equality vs NULL
Run:

```sql world.sql
-- Q6a. Countries that became independent in 1776
SELECT Name, IndepYear
FROM country
WHERE IndepYear = 1776;

-- Q6b. Equality with NULL
SELECT Name, IndepYear
FROM country
WHERE IndepYear = NULL;
```

Then also run:

```sql world.sql
-- Q6c. Checking for NULL correctly
SELECT Name, IndepYear
FROM country
WHERE IndepYear IS NULL;
```

Questions:

1. What results do you get in each query?
2. Why do Q6b and Q6c behave differently?

---

### Q7. NULL-safe equality operator `<=>`
Run:

```sql world.sql
-- Q7. Compare GNP and GNPOld using NULL-safe comparison
SELECT Name, GNP, GNPOld
FROM country
WHERE GNP <=> GNPOld;
```

Questions:

1. What kinds of rows are returned (look especially at NULL values)?
2. How does `<=>` differ from `=` when NULLs are involved?

---

### Q8. “IS NOT DISTINCT FROM” vs `<=>` (if available)

If your MySQL version supports it (8.0.31+), run:

```sql world.sql
-- Q8a. Using standard 'IS NOT DISTINCT FROM'
SELECT Name, GNP, GNPOld
FROM country
WHERE GNP IS NOT DISTINCT FROM GNPOld;
```

If not, run only:

```sql world.sql
-- Q8b. MySQL equivalent with NULL-safe equality
SELECT Name, GNP, GNPOld
FROM country
WHERE GNP <=> GNPOld;
```

Then compare with:

```sql world.sql
-- Q8c. Rows where GNP and GNPOld are distinct (including NULL vs non-NULL)
SELECT Name, GNP, GNPOld
FROM country
WHERE NOT (GNP <=> GNPOld);
-- (Or, if supported: WHERE GNP IS DISTINCT FROM GNPOld;)
```

Questions:

1. How are the result sets of Q8a/Q8b and Q8c related?
2. Conceptually, what does “IS NOT DISTINCT FROM” (or `<=>`) mean?

---

### Q9. Using NULL-safe comparison in a self-join style query

Run this query:

```sql world.sql
-- Q9. Cities whose population equals that of 'New York' (USA),
-- using a NULL-safe comparison
SELECT c2.Name, c2.CountryCode, c2.Population
FROM city AS c1
JOIN city AS c2
  ON c1.Name = 'New York'
 AND c1.CountryCode = 'USA'
WHERE c2.Population <=> c1.Population;
```

Questions:

1. What cities are returned?
2. How would the result differ if you changed the last line to `WHERE c2.Population = c1.Population;`?

---

### Q10. = vs <=> with a constant

Run:

```sql world.sql
-- Q10a. Standard equality with a constant and NULL
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy = 78.0
   OR LifeExpectancy = NULL;

-- Q10b. NULL-safe comparison with a constant
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy <=> 78.0;
```

Questions:

1. How many rows does each query return?
2. Does `LifeExpectancy = NULL` in Q10a have any effect? Why or why not?
3. What does this tell you about how `<=>` behaves?

---

When you’re ready, tell me which question(s) you want to discuss, and I’ll walk through the answers and concepts.