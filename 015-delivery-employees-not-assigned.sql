-- As a member of the Management team I want to be able to see a list of delivery employees 
 -- who are not assigned to a project who have previously worked with a technology that is 
 -- currently being used on a project and the name of those projects.

SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name', 
	GROUP_CONCAT(project.`name` SEPARATOR ', ') AS 'Projects'
		FROM employee
			LEFT JOIN employee_project ON employee.employee_id = employee_project.employee_id
			LEFT JOIN project ON employee_project.project_id = project.project_id
			LEFT JOIN employee_technology ON employee.employee_id = employee_technology.employee_id
			LEFT JOIN technology ON employee_technology.technology_id = technology.technology_id
		WHERE role = 'delivery' AND active = 0 AND technology.`name` = 'Hardware'
		ORDER BY group_concat(project.project_id);