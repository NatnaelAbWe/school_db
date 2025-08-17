USE student_enrollment;

INSERT INTO students (name, email, dob, program) VALUES
('Alice Johnson',   'alice@example.com',   '2002-03-14', 'Computer Science'),
('Bob Smith',       'bob@example.com',     '2001-11-02', 'Physics'),
('Charlie Gomez',   'charlie@example.com', '2003-07-22', 'Mathematics'),
('Diana Patel',     'diana@example.com',   '2002-01-30', 'Data Science'),
('Evan Lee',        'evan@example.com',    '2000-09-15', 'Economics');

INSERT INTO courses (course_name, course_code, instructor) VALUES
('Databases',                 'CS201', 'Dr. Nguyen'),
('Linear Algebra',            'MATH210', 'Prof. Rivera'),
('Intro to Econometrics',    'ECON220', 'Dr. Chen');

-- Map emails/course_codes to IDs to keep it simple and deterministic

INSERT INTO enrollments (student_id, course_id, date_enrolled)
SELECT s.id, c.id, '2025-01-20'
FROM students s JOIN courses c
WHERE s.email IN ('alice@example.com','bob@example.com','diana@example.com')
  AND c.course_code = 'CS201';

INSERT INTO enrollments (student_id, course_id, date_enrolled)
SELECT s.id, c.id, '2025-01-22'
FROM students s JOIN courses c
WHERE s.email IN ('charlie@example.com','diana@example.com','evan@example.com')
  AND c.course_code = 'MATH210';

INSERT INTO enrollments (student_id, course_id, date_enrolled)
SELECT s.id, c.id, '2025-01-25'
FROM students s JOIN courses c
WHERE s.email IN ('alice@example.com','evan@example.com')
  AND c.course_code = 'ECON220';
