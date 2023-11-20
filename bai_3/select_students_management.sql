SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';
    
SELECT 
    *
FROM
    class
WHERE
    start_date LIKE '%-12-%';
    
SELECT 
    *
FROM
    subject
WHERE
    credit BETWEEN 3 AND 5;
    
SET sql_safe_updates = 0;
    
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';

SET sql_safe_updates = 1;

SELECT 
    std.student_name, sub.sub_name, m.mark
FROM
    (mark m
    INNER JOIN student std ON m.student_id = std.student_id
    INNER JOIN subject sub ON sub.sub_id = m.sub_id)
ORDER BY mark DESC , student_name ASC;