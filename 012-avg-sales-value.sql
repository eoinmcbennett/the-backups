-- As a member of the Sales team I want to see a list of clients with the average value of their projects
SELECT `name`, AVG(value) FROM project GROUP BY `name`;