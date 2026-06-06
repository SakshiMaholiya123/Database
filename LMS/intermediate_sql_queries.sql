
--List all users who are enrolled in more than three courses.
select user_id,count(course_id) from enrollments group by user_id having count(course_id)>3;


select user_id,count(course_id) from enrollments group by user_id having count(course_id)>3;


select c.course_id,c.course_name,e.enrollment_id from courses as c join enrollments as e on c.course_id=e.course_id where enrollment_id is null;
select course_id,count(enrollment_id) as number_of_enrollments_in_course from enrollments group by course_id;

select e.user_id,e.course_id,count(l.duration_minutes) from enrollments as e join lessons as l on e.course_id=l.course_id group by e.user_id having count(l.duration_minutes)=0;
