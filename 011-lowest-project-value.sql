SELECT name AS 'Client Name', SUM(value) AS 'Total Project Value' 
FROM client 
JOIN project USING(client_id) 
GROUP BY name 
ORDER BY value DESC 
LIMIT 1;
