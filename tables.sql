CREATE DATABASE thebackups_TaylorC;

USE thebackups_TaylorC;

CREATE TABLE employee_type (
	`employee_type_id` TINYINT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
);

CREATE TABLE employee (
	`employee_id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(35) NOT NULL,
    `last_name` VARCHAR(35) NOT NULL,
    `salary` MEDIUMINT UNSIGNED NOT NULL,
    `sort_code` VARCHAR(6) NOT NULL,
    `account_number` VARCHAR(8) NOT NULL,
    `nin` VARCHAR(9) NOT NULL,
    `username` VARCHAR(35) NOT NULL,
    `password` VARCHAR(35) NOT NULL,
    `type_id` TINYINT UNSIGNED NOT NULL,
    CHECK (LENGTH(sort_code) = 6),
    CHECK (LENGHT(account_number = 8)),
    CHECK (LENGHT(nin = 9)),
    CHECK (salary > 0 AND salary <= 500000)
);

ALTER TABLE employee ADD CONSTRINT fk_employee_employee_type FOREIGN KEY(type_id) REFERENCES employee(type_id);

CREATE TABLE client (
    `client_id` SMALLINT UNSIGNED,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(11) NOT NULL,
    `employee_id` SMALLINT UNSIGNED NOT NULL,
    `win_date` TIMESTAMP NULL
);

ALTER TABLE client ADD CONSTRAINT fk_client_employee FOREIGN KEY(employee_id) REFERENCES client(employee_id);

CREATE TABLE project(
    `project_id` AUTO_INCREMENT PRIMARY KEY SMALLINT UNSIGNED,
    `name` VARCHAR(50) NOT NULL,
    `value` DECIMAL(10) NOT NULL,
    `client_id` SMALLINT NOT NULL UNSIGNED,
    `status` TINYINT(2) NOT NULL UNSIGNED DEFAULT 0,
    `tech_lead` SMALLINT NOT NULL UNSIGNED,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CHECK(`value` > 0)
);

ALTER TABLE project ADD CONSTRAINT fk_project_client FOREIGN KEY(client_id) REFRENCES client(client_id);
ALTER TABLE project ADD CONSTRAINT fk_project_tech_lead FOREIGN KEY(tech_lead) REFRENCES employee(employee_id);

CREATE TABLE technology (
    `technology_id` AUTO_INCREMENT PRIMARY KEY SMALLINT UNSIGNED,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE employee_technology (
    employee_id SMALLINT UNSIGNED NOT NULL,
    technology_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(employee_id,technology_id)
)

ALTER TABLE employee_technology ADD CONSTRAINT fk_employee_technology FOREIGN KEY(employee_id) REFERENCES employee(employee_id);
ALTER TABLE employee_technology ADD CONSTRAINT fk_emp_technology_technology FOREIGN KEY(technology_id) REFERENCES technology(technology_id);

CREATE TABLE project_technology(
    project_id SMALLINT UNSIGNED NOT NULL,
    technology_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(project_id,technology_id)
)

ALTER TABLE project_technology ADD CONSTRAINT fk_project_technology_project FOREIGN KEY(project_id) REFERENCES project(project_id);
ALTER TABLE project_technology ADD CONSTRAINT fk_project_technology_technology FOREIGN KEY(technology_id) REFERENCES technology(technology_id);

CREATE TABLE employee_project(
    employee_project_id AUTO_INCREMENT PRIMARY KEY SMALLINT UNSIGNED,
    employee_id SMALLINT UNSIGNED NOT NULL,
    project_id SMALLINT UNSIGNED NOT NULL,
    active TINYINT(2) UNSIGNED NOT NULL DEFAULT 0,
    role VARCHAR(30) NOT NULL
);

ALTER TABLE employee_project ADD CONSTRAINT fk_employee_project_employee FOREIGN KEY(employee_id) REFERENCES employee(employee_id);
ALTER TABLE employee_project ADD CONSTRAINT fk_employee_project_project FOREIGN KEY(project_id) REFERENCES project(project_id);

