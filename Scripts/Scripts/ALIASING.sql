SELECT 
destination,
passanger,
time as 'The Time'  --Aliasing Give new name to the column you want to give like time now called The Time you can also change the name of dataset
FROM dataset_1  -- You can also do dataset-1 d    here you give dataset_1 name d
WHERE passanger = 'Alone'
ORDER BY time DESC;