## NOTES

- COUNT(*) vs COUNT(ColumnName) -> first counts all rows, second counts a row only if ColumnName value for the row is NOT NULL
- COUNT(DISTINCT ColumnName) - If 2 rows have the SAME NON NULL column name, they are counted as 1 (and not 2 or more)
    - Eg. COUNT(IndepYear) will count India and Pakistan as 1 and not 2
- COUNT(DISTINCT (col1, col2, ..., colN)) - counts all distinct combinations where at least 1 value is NOT NULL