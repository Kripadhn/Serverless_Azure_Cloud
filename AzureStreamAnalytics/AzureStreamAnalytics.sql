# SQL
SELECT
    deviceId,
    AVG(temperature) as avgTemperature
INTO
    [output-database]
FROM
    [input-database]
GROUP BY TUMBLINGWINDOW(minute, 10), deviceId;
