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
    op.o_id,
    op.o_date,
    op.o_total_price
FROM
    order_product op;
    
SELECT 
    GROUP_CONCAT(DISTINCT c.c_name) as danh_sach_khach_hang, GROUP_CONCAT(DISTINCT p.p_name) as danh_sach_san_pham
FROM
    (order_product op
    JOIN customer c ON op.c_id = c.c_id
    JOIN order_detail od ON op.o_id = od.o_id
    JOIN product p ON od.p_id = p.p_id);
    
SELECT 
    c.c_name
FROM
    customer c
        LEFT JOIN
    order_product op ON c.c_id = op.c_id
WHERE
    op.c_id IS NULL;
    
SELECT 
    op.o_id,
    op.o_date,
    SUM(p.p_price * od.od_qty) AS oTotalPrice
FROM
    (order_product op
    JOIN order_detail od ON op.o_id = od.o_id
    JOIN product p ON p.p_id = od.p_id)
GROUP BY op.o_id;