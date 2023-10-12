-- As a member of the Management team I want to be able to see the project 
	-- with the most delivery employees currently working on it

SELECT project.`name` as 'Project Name', COUNT(employee_project.employee_id) as 'Delivery Employee Count' FROM employee
	LEFT JOIN employee_project ON employee.employee_id = employee_project.employee_id
    LEFT JOIN project ON employee_project.project_id = project.project_id
    WHERE employee_project.role = 'delivery' AND employee_project.active = 1;


