INSERT INTO customer(c_name,c_age)
VALUES('Minh Quan',19),
('Ngoc Oanh',20),
('Hong Ha',50);

INSERT INTO order_product(c_id,o_date)
VALUES(1,'2006-3-11'),
(2,'2006-3-23'),
(1,'2006-3-16');

INSERT INTO product(p_name,p_price)
VALUES('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

INSERT INTO order_detail(o_id,p_id,od_qty)
VALUES(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT 
    order_product.o_id,
    order_product.o_date,
    order_product.o_total_price
FROM
    order_product;
    
SELECT 
    customer.c_name, product.p_name
FROM
    ((order_product
    JOIN customer ON order_product.c_id = customer.c_id)
    JOIN order_detail ON order_product.o_id = order_detail.o_id
    JOIN product ON order_detail.p_id = product.p_id);
    
SELECT 
    customer.c_name
FROM
    customer
        LEFT JOIN
    order_product ON customer.c_id = order_product.c_id
WHERE
    order_product.c_id IS NULL;
    
SELECT 
    order_product.o_id,
    order_product.o_date,
    SUM(product.p_price * order_detail.od_qty) AS oTotalPrice
FROM
    ((order_product
    JOIN order_detail ON order_product.o_id = order_detail.o_id)
    JOIN product ON product.p_id = order_detail.p_id)
GROUP BY order_product.o_id , order_product.o_date;