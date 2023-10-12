-- As a member of the Sales team I want to see a list of clients, the name of the sales 
	-- employee who works with that client and the list of projects that the client has

SELECT CONCAT(first_name, ' ', last_name) AS 'Employee / Client Name', GROUP_CONCAT(`client`.`name` SEPARATOR ', ') AS 'Clients / Projects'
	FROM `client`
	LEFT JOIN employee ON `client`.employee_id = employee.employee_id
    GROUP BY employee.employee_id
UNION
SELECT `client`.`name` AS 'Employee / Client Name', GROUP_CONCAT(project.`name` SEPARATOR ', ') AS 'Clients / Projects'
	FROM `client`
	LEFT JOIN project ON `client`.client_id = project.client_id
    GROUP BY `client`.`name`;