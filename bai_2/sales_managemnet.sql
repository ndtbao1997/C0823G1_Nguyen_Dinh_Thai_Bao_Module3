CREATE DATABASE sales_managemnet;

USE sales_managemnet;

CREATE TABLE customer (
    c_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(255),
    c_age INT,
    CHECK (c_age >= 18)
);

CREATE TABLE order_product (
    o_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id),
    o_date DATE,
    o_total_price LONG,
    CHECK (o_total_price > 0)
);

CREATE TABLE product (
    p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(255) UNIQUE,
    p_price LONG,
    CHECK (p_price > 0)
);

CREATE TABLE order_detail (
    o_id INT NOT NULL,
    FOREIGN KEY (o_id)
        REFERENCES order_product (o_id),
    p_id INT NOT NULL,
    FOREIGN KEY (p_id)
        REFERENCES product (p_id),
    od_qty INT,
    CHECK (od_qty > 0),
    PRIMARY KEY (o_id , p_id)
);