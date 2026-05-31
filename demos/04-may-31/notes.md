## NOTES

- When using aggregate functions without GROUP BY, you cannot use any other columns in SELECT clause.

### COUNT() - Valid combinations
- COUNT(*) vs COUNT(ColumnName) -> first counts all rows, second counts a row only if ColumnName value for the row is NOT NULL
- COUNT(DISTINCT ColumnName) - If 2 rows have the SAME NON NULL column name, they are counted as 1 (and not 2 or more)
    - Eg. COUNT(IndepYear) will count India and Pakistan as 1 and not 2
- COUNT(DISTINCT (col1, col2, ..., colN)) - counts all distinct combinations where at least 1 value is NOT NULL

- __IMPORTANT__: SELECT COUNT(Continent, Region) - is INVALID!!

### AVG()
- AVG(ColumnName) -> SUM(ColumnName) / COUNT(ColumnName) -> thus the count does not include rows where ColumnName IS NULL
    - Example:
    ```sql
    SELECT
	AVG(GNPOld) average,
    SUM(GNPOld) total,
    COUNT(*) * AVG(GNPOld) as sum_1,
    COUNT(GNPOld) * AVG(GNPOld) as sum_2 
    FROM country;
    ```
    - In the above, only countries where GNPOld is not null are counted in average

### GROUP BY
- Aggregate function are applied to the rows in a group once we use GROUP BY (not to all the rows together)
- It is usually useful to have the column being grouped by in SELECT clause as well
    - Example:
    ```sql
    SELECT
        Continent,
        SUM(Population)
    FROM
        country
    GROUP BY
        Continent;
    ```
- Apart from aggegate functions, you can use ONLY the columns that you are GROUPing BY
