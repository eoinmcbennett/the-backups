USE thebackups_TaylorC;

CREATE TABLE employee_type (
	`employee_type_id` TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL
);

INSERT INTO employee_type(name) VALUES
('HR'),
('Sales'),
('Management'),

CREATE TABLE employee (
	`employee_id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(35) NOT NULL,
    `last_name` VARCHAR(35) NOT NULL,
    `salary` MEDIUMINT UNSIGNED NOT NULL,
    `sort_code` VARCHAR(6) NOT NULL,
    `account_number` VARCHAR(8) NOT NULL,
    `national_insurance` VARCHAR(9) NOT NULL,
    `commission` DECIMAL(10, 2) NULL,
    `username` VARCHAR(35) NOT NULL,
    `password` VARCHAR(35) NOT NULL,
    `type_id` TINYINT UNSIGNED NOT NULL,
    CHECK (LENGTH(sort_code) = 6),
    CHECK (LENGTH(account_number) = 8),
    CHECK (LENGTH(national_insurance) = 9),
    CHECK (salary > 0 AND salary <= 500000),
    FOREIGN KEY(type_id) REFERENCES employee_type(employee_type_id),
    UNIQUE INDEX(username),
    INDEX(first_name,last_name)
);

INSERT INTO employee (first_name, last_name, salary, sort_code, account_number, national_insurance, username, password, type_id, commission)
VALUES ('James', 'Patterson', '65000', '179350', '15563721', 'AD341349D', 'jpatterson', 'aksasjdasdjasd', '1', '15.50');
