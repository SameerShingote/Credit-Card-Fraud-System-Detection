CREATE DATABASE IF NOT EXISTS fd_database;
USE fd_database;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Fname VARCHAR(100),
    Lname VARCHAR(100)
);

CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    LoginTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES users(id)
);

CREATE TABLE cards (
    CDnumber VARCHAR(50) PRIMARY KEY,
    CDpassword VARCHAR(255) NOT NULL,
    cvvNumber INT NOT NULL,
    expiryDate DATE NOT NULL
);

CREATE TABLE security (
    UserID INT,
    Q1 VARCHAR(255),
    Ans1 VARCHAR(255),
    Q2 VARCHAR(255),
    Ans2 VARCHAR(255),
    Q3 VARCHAR(255),
    Ans3 VARCHAR(255),
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserID) REFERENCES users(id)
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    amount DECIMAL(10,2),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES users(id)
);

-- Insert sample users
INSERT INTO users (Username, Password, Email, Fname, Lname) VALUES
('Sameer', 'sameer1234', 'sameer@example.com', 'Sameer', 'S'),
('Sumit', 'sumit1234', 'sumit@example.com', 'Sumit', 'Y'),
('Arya', 'arya1234', 'arya@example.com', 'Arya', 'S'),
('Raj', 'raj1234', 'raj@example.com', 'Raj', 'S');

-- Insert sample admins
INSERT INTO admins (Username, Password) VALUES
('admin1', 'adminpass1'),
('admin2', 'adminpass2');

-- Insert sample login records
INSERT INTO login (UserID) VALUES
(1), (2), (3), (4);

-- Insert sample card data
INSERT INTO cards (CDnumber, CDpassword, cvvNumber, expiryDate) VALUES
('1234567890', 'cdpass1', 123, '2026-12-31'),
('0987654321', 'cdpass2', 456, '2025-11-30');

-- Insert sample security questions
INSERT INTO security (UserID, Q1, Ans1, Q2, Ans2, Q3, Ans3) VALUES
(1, 'What is your pet name?', 'Fluffy', 'What is your birth city?', 'New York', 'What is your mother’s maiden name?', 'Smith'),
(2, 'What is your favorite color?', 'Blue', 'What is your first school?', 'Greenwood', 'What is your best friend’s name?', 'Tom'),
(3, 'What was your childhood nickname?', 'Ace', 'What is your dream job?', 'Engineer', 'What was your first car?', 'Honda'),
(4, 'What is your favorite food?', 'Pizza', 'Where did you meet your spouse?', 'College', 'What is your hobby?', 'Reading');

-- Insert sample transactions
INSERT INTO transactions (UserID, amount) VALUES
(1, 85000.75),
(2, 92000.00),
(3, 78000.50),
(4, 99000.00);
