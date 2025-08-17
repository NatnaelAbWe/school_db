USE student_enrollment;

-- 1) All students enrolled in a specific course (by course_code)
-- Replace :course_code with a literal like 'CS201' when running in Workbench:
-- Example:
-- SET @course_code := 'CS201';
-- (or just substitute directly in the WHERE)
SELECT s.id, s.name, s.email, s.program, e.date_enrolled
FROM enrollments e
JOIN students s ON s.id = e.student_id
JOIN courses  c ON c.id = e.course_id
WHERE c.course_code = 'CS201'
ORDER BY s.name;

-- 2) All courses a specific student (by email or id) is enrolled in
-- (A) by email
SELECT c.id, c.course_name, c.course_code, c.instructor, e.date_enrolled
FROM enrollments e
JOIN students s ON s.id = e.student_id
JOIN courses  c ON c.id = e.course_id
WHERE s.email = 'alice@example.com'
ORDER BY c.course_code;

-- (B) by id
SELECT c.id, c.course_name, c.course_code, c.instructor, e.date_enrolled
FROM enrollments e
JOIN courses c  ON c.id = e.course_id
WHERE e.student_id = 1
ORDER BY c.course_code;

-- 3) Count of how many students are enrolled in each course
SELECT c.course_code, c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.course_code, c.course_name
ORDER BY c.course_code;
