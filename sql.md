
# SQL
----------------------------------------------------------
**References: <https://www.programiz.com/sql> and <https://sqlbolt.com/>**

## Retrive Data from a Database Table
To do this, use the `SELECT` statement. for example, the code below selects the `first_name` and `last_names` of all custumers in that table
```sql
SELECT first_name, last_name 
FROM Custumers
```

To select all columns in the table use: `SELECT *` 
You can also select from using the `WHERE` clause. Here all custumers with `last_name = Doe` will be selected:
```sql
SELECT *
FROM Customers
WHERE last_name = 'Doe';
```

### Select DISTICT Statement
This statement selects unique data from a table:
```sql
SELECT DISTINCT country
FROM Customers;
```

Here, an unique combination of `country` and `first_name`
```sql
SELECT DISTINCT country, first_name
FROM Customers;
```

Using **COUNT()** function can tell you the unique amount of data points
```sql
SELECT COUNT(DISTINCT country)
FROM Customers;
```

### SELECT AS Statement





## Other

### SQL Operators
reference: <https://www.programiz.com/sql/operators>

- Equal to (`=`)
- Greater than (`>`)
- AND (`AND`): selects data if all conditions are true
- OR (`OR`): selects data if any conditions are true
- NOT (`NOT`): selects data if the condition is false

Use parenthesis to use multiple:
```sql
SELECT *
FROM Customers
WHERE (country = 'USA' OR country = 'UK') AND age < 26;

/* or without parenthesis */

SELECT *
FROM customers
WHERE NOT country = 'USA' AND NOT last_name = 'Doe';
```



















