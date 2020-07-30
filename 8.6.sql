DECLARE
v_course course.course_no%type := 430;
v_instructor_id instructor.instructor_id%type := 102;
v_sec_num section.section_no%type := 0;
BEGIN 
WHILE v_sec_num < 10 LOOP 
-- increment section number by one
v_sec_num := v_sec_num + 1;
INSERT INTO section
(section_id, course_no, section_no, instructor_id,
created_date, created_by, modified_date,
modified_by)
VALUES
(1, v_course, v_sec_num,
v_instructor_id, SYSDATE, USER, SYSDATE, USER);
-- if number of sections added is ten exit the loop
END LOOP;
COMMIT;
END;
