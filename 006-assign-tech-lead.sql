-- As a member of the Management team I want to be able to assign a delivery employee 
 -- as a Tech Lead to a project. Each project can only have 1 Tech Lead
 
 UPDATE project 
	SET project.tech_lead = 1
    WHERE project.project_id = 2;