create database if not exists student_management_database;

use student_management_database;

CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(200)
);
insert into class(class_name)
values('C0823G1'),
('C0923G1'),
('C1023G1');
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(200),
    age INT,
    country VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
insert into teacher(teacher_name,age, country, class_id)
values("Nguyễn Văn A",25,"Việt Nam",1),
("Nguyễn Văn B",25,"Việt Nam",2),
("Nguyễn Văn C",25,"Việt Nam",3);
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(200),
    age INT,
    country VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id),
    teacher_id INT,
    FOREIGN KEY (teacher_id)
        REFERENCES teacher (teacher_id)
);
insert into student(student_name,age,country,class_id,teacher_id)
values("Lê Văn A",25,"Việt Nam",1,4),
("Lê Văn B",25,"Việt Nam",2,5),
("Lê Văn C",25,"Việt Nam",3,6);


