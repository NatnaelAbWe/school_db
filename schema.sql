CREATE DATABASE IF NOT EXISTS student_enrollment
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE student_enrollment;

-- drop in dependancy order(safe re-runs)

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    program VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  course_name VARCHAR(150) NOT NULL,
  course_code VARCHAR(20) NOT NULL UNIQUE,
  instructor VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE enrollments(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    date_enrolled DATE NOT NULL,
    PRIMARY KEY(student_id, course_id),
    CONSTRAINT fk_enr_student
    FOREIGN KEY (student_id) REFERENCES students(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_enr_course
    FOREIGN KEY (course_id) REFERENCES courses(id)
    ON DELETE CASCADE ON UPDATE CASCADE

)ENGINE=InnoDB;