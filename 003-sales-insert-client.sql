CREATE TABLE `client` (
    `client_id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(11) NOT NULL,
    `employee_id` SMALLINT UNSIGNED NULL,
    `win_date` TIMESTAMP NULL,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);

INSERT INTO client(name,address,phone) VALUES('Test Client','Testing test street','0284173423');
