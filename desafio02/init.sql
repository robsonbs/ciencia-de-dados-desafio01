CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    contact_name VARCHAR(30) NOT NULL,
    company_name VARCHAR(40) NULL,
    contact_email VARCHAR(128) NOT NULL,
    address VARCHAR(120) NULL,
    city VARCHAR(30) NULL,
    country VARCHAR(30) NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(40) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    birth_date DATE NULL,
    hire_date DATE NULL,
    address VARCHAR(128) NULL,
    city VARCHAR(30) NULL,
    country VARCHAR(30) NULL,
    report_to INT NULL,
    FOREIGN KEY (report_to) REFERENCES employees(employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    description TEXT NULL,
    parent_category_id INT NULL,
    FOREIGN KEY (parent_category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(40) NOT NULL,
    description TEXT NULL,
    category_id INT NULL,
    quantity_per_unit INT NULL,
    unit_price DECIMAL(10, 2) NULL,
    units_in_stock INT NULL,
    discontinued BOOLEAN NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    purchase_date DATE NULL,
    shipped_date DATE NULL,
    ship_address VARCHAR(60) NULL,
    ship_city VARCHAR(30) NULL,
    ship_country VARCHAR(30) NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE purchase_items (
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

\d+ public.* 