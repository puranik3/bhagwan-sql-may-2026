For these topics, I would introduce them in this exact order:

1. Aggregate Functions
2. GROUP BY
3. HAVING

Students should first understand that aggregate functions produce **one value from many rows**. Only then does GROUP BY make sense.

---

# Part 1 — Aggregate Functions

## Query 1 — Count countries

```sql
SELECT COUNT(*)
FROM country;
```

### New Concept

* `COUNT(*)`
* Aggregate over all rows
* Single-row result

---

## Query 2 — Count known life expectancies

```sql
SELECT COUNT(LifeExpectancy)
FROM country;
```

### New Concept

* COUNT(column)
* NULL values are ignored

---

## Query 3 — Largest population

```sql
SELECT MAX(Population)
FROM country;
```

### New Concept

* MAX

---

## Query 4 — Smallest population

```sql
SELECT MIN(Population)
FROM country;
```

### New Concept

* MIN

---

## Query 5 — Average film length

```sql
SELECT AVG(length)
FROM film;
```

### New Concept

* AVG

---

## Query 6 — Total replacement cost of all films

```sql
SELECT SUM(replacement_cost)
FROM film;
```

### New Concept

* SUM

---

## Query 7 — Multiple aggregates together

```sql
SELECT
    MIN(length),
    MAX(length),
    AVG(length)
FROM film;
```

### New Concept

* Multiple aggregates in one query

---

# Part 2 — GROUP BY

Now students already understand aggregates.

---

## Query 8 — Number of countries per continent

```sql
SELECT
    Continent,
    COUNT(*)
FROM country
GROUP BY Continent;
```

### New Concept

* GROUP BY
* One result row per group

---

## Query 9 — Average population by continent

```sql
SELECT
    Continent,
    AVG(Population)
FROM country
GROUP BY Continent;
```

### New Concept

* Aggregate calculated separately for each group

---

## Query 10 — Number of films per rating

```sql
SELECT
    rating,
    COUNT(*)
FROM film
GROUP BY rating;
```

### New Concept

* Grouping business data

---

## Query 11 — Average film length by rating

```sql
SELECT
    rating,
    AVG(length)
FROM film
GROUP BY rating;
```

### New Concept

* Same groups, different aggregate

---

## Query 12 — Multiple aggregates per group

```sql
SELECT
    rating,
    COUNT(*),
    MIN(length),
    MAX(length)
FROM film
GROUP BY rating;
```

### New Concept

* Multiple aggregate calculations for each group

---

## Query 13 — Grouping by multiple columns

```sql
SELECT
    Continent,
    Region,
    COUNT(*)
FROM country
GROUP BY Continent, Region;
```

### New Concept

* Composite grouping key

---

# Part 3 — HAVING

Students now know:

* WHERE filters rows
* GROUP BY creates groups

Now introduce filtering groups.

---

## Query 14 — Continents with more than 40 countries

```sql
SELECT
    Continent,
    COUNT(*)
FROM country
GROUP BY Continent
HAVING COUNT(*) > 40;
```

### New Concept

* HAVING
* Filtering aggregate results

---

## Query 15 — Ratings having more than 200 films

```sql
SELECT
    rating,
    COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;
```

### New Concept

* HAVING with COUNT

---

## Query 16 — Continents whose average population exceeds 20 million

```sql
SELECT
    Continent,
    AVG(Population)
FROM country
GROUP BY Continent
HAVING AVG(Population) > 20000000;
```

### New Concept

* HAVING with AVG

---

## Query 17 — Average film length by rating, ordered

```sql
SELECT
    rating,
    AVG(length) AS AvgLength
FROM film
GROUP BY rating
HAVING AVG(length) > 110
ORDER BY AvgLength DESC;
```

### New Concept

* Complete reporting query
* GROUP BY + HAVING + ORDER BY

---

# Very Important Demonstration

Use these two queries back-to-back:

### WHERE filters rows

```sql
SELECT
    Continent,
    COUNT(*)
FROM country
WHERE Population > 10000000
GROUP BY Continent;
```

### HAVING filters groups

```sql
SELECT
    Continent,
    COUNT(*)
FROM country
GROUP BY Continent
HAVING COUNT(*) > 20;
```

This is usually the moment students finally understand:

> WHERE filters rows before grouping.
>
> HAVING filters groups after grouping.

That distinction is the single most important learning objective of the entire GROUP BY/HAVING section.
