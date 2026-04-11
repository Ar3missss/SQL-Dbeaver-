SELECT 
destination,
weather,
AVG(temperature) OVER (PARTITION BY weather) AS 'avg_temp_by_weather' 
FROM dataset_1 d;
-- OVER() is used with window functions. It tells SQL: “Don’t collapse rows like GROUP BY—just calculate something across rows while keeping all rows.”
-- PARTITION BY is used inside OVER().
-- It divides data into groups (like GROUP BY), but:
--	•	It does NOT reduce rows
--	•	It just creates separate windows


-- You can also write this


--AVG Just give you the Average of the value
SELECT 
destination, 
weather, 
AVG(temperature) OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;



-- ROW_NUMBER()---->
-- Gives a unique number to every row
-- No ties allowed (even if values are same
SELECT 
destination, 
weather, 
ROW_NUMBER() OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;


-- RANK()----->
-- Same values → same rank
-- But skips numbers after tie
SELECT 
destination, 
weather, 
RANK() OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;

-- DENSE_RANK()----->
-- Same values → same rank
-- But NO gaps
SELECT 
destination, 
weather, 
DENSE_RANK() OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;


-- NTILE()----->
-- Splits rows into n equal groups 
SELECT time, NTILE (50) OVER (ORDER BY time)
FROM dataset_1;

-- LAG() ----- >
-- syntax ----> LAG(column, offset, default_value) OVER(...)
-- Offset = how far you move from the current row (backward in LAG, forward in LEAD)

SELECT destination , time , LAG(row_count , 1, 9999) OVER (ORDER BY row_count) AS 'LaggedCount'
FROM dataset_1;

SELECT destination, time, LEAD(row_count , 2, '99999') OVER (ORDER BY row_count) AS 'LaggedCount' 
FROM dataset_1;




















