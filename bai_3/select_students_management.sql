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
    student.student_name, subject.sub_name, mark.mark
FROM
    ((mark
    INNER JOIN student ON mark.student_id = student.student_id)
    INNER JOIN subject ON subject.sub_id = mark.sub_id)
ORDER BY mark DESC , student_name ASC;