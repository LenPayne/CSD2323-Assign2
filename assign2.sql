CREATE DATABASE assign2;
CREATE USER 'assign2'@'localhost' IDENTIFIED BY 'P@ssw0rd';
GRANT ALL PRIVILEGES ON assign2.* TO 'assign2'@'localhost';
FLUSH PRIVILEGES;
USE assign2;
CREATE TABLE personal (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    description TEXT);

INSERT INTO personal (name, email, description)
    VALUES ("Sample", "no-reply@example.com", "This isn't a real description");
