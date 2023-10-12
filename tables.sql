CREATE DATABASE thebackups_TaylorC;

USE thebackups_TaylorC;

CREATE TABLE client (
    `client_id` SMALLINT UNSIGNED, 
    `name` VARCHAR(255),
    `address` VARCHAR(255), 
    `phone` VARCHAR(11), 
    `employee_id` SMALLINT UNSIGNED, 
    `win_date` TIMESTAMP
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

CREATE TABLE technology (
    `technology_id` SMALLINT UNSIGNED, 
    `name` VARCHAR(255)
);

