SELECT destination , 
time,
AVG(temperature),
SUM(temperature),
COUNT(temperature),
COUNT(DISTINCT temperature)
FROM dataset_1
WHERE time != '10PM'
GROUP BY destination ,time --GROUP BY fxn basically crunch all the same files into one 
ORDER BY time