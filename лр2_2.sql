CREATE DATABASE CarDealership2;

USE CarDealership2;

-- Hubs
CREATE TABLE Hub_Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    record_source VARCHAR(50),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Hub_Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    record_source VARCHAR(50),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Hub_Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    record_source VARCHAR(50),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Hub_Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    record_source VARCHAR(50),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Links
CREATE TABLE Link_Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    car_id INT,
    employee_id INT,
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES Hub_Clients(client_id),
    FOREIGN KEY (car_id) REFERENCES Hub_Cars(car_id),
    FOREIGN KEY (employee_id) REFERENCES Hub_Employees(employee_id)
);

CREATE TABLE Link_Purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    car_id INT,
    employee_id INT,
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Hub_Suppliers(supplier_id),
    FOREIGN KEY (car_id) REFERENCES Hub_Cars(car_id),
    FOREIGN KEY (employee_id) REFERENCES Hub_Employees(employee_id)
);

-- Satellites
CREATE TABLE Satellite_Clients (
    client_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES Hub_Clients(client_id)
);

CREATE TABLE Satellite_Cars (
    car_id INT,
    make VARCHAR(50),
    model VARCHAR(50),
    year YEAR,
    price DECIMAL(10, 2),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id) REFERENCES Hub_Cars(car_id)
);

CREATE TABLE Satellite_Employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    phone VARCHAR(15),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES Hub_Employees(employee_id)
);

CREATE TABLE Satellite_Suppliers (
    supplier_id INT,
    name VARCHAR(100),
    contact_info VARCHAR(255),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Hub_Suppliers(supplier_id)
);

