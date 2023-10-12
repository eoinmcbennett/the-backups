CREATE DATABASE thebackups_TaylorC;

USE thebackups_TaylorC;

CREATE TABLE employee_type (
	employee_type_id TINYINT UNSIGNED AUTO_INCREMENT,
    name varchar(30)
);

CREATE TABLE employee (
	employee_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(35),
    last_name varchar(35),
    salary MEDIUMINT UNSIGNED,
    sort_code varchar(6),
    account_number varchar(8),
    nin varchar(9),
    username varchar(35),
    `password` varchar(35),
    type_id TINYINT UNSIGNED,
    CHECK (LENGTH(sort_code) = 6),
    CHECK (LENGHT(account_number = 8)),
    CHECK (LENGHT(nin = 9))
);

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