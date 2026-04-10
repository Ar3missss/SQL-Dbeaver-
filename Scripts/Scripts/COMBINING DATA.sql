SELECT *
FROM dataset_1 
UNION              -- UNION WHAT BASICALLY DO IS IT STACK THE THE TABLE ON TOP OF EACH OTHER 
SELECT *           -- Put simply, a union (SQL Union) is the process of stacking two tables on top of one another. You will usually do this when your data is split up into multiple sections like an excel spreadsheet of a year’s sales split by month.
FROM table_to_union;

SELECT DISTINCT destination
FROM dataset_1;


SELECT DISTINCT destination
FROM
(              -- we are making a sunquery just to check if our union worked or not 
SELECT *
FROM dataset_1 
UNION            -- If the same row appears in both tables → it will appear only once
SELECT *           
FROM table_to_union);

SELECT *
FROM dataset_1 
UNION ALL     -- The only difference between union and union all is that union all allows duplicates  If the same row appears twice → it will appear twice
SELECT *
FROM table_to_union;

SELECT *
FROM table_to_join;

SELECT destination , d.time, ttj.part_of_day
FROM dataset_1 d
LEFT JOIN table_to_join ttj
ON d.time = ttj.time;
