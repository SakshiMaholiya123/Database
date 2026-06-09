-- --For each course, calculate:
-- Total number of enrolled users
-- Total number of lessons
-- Average lesson duration

select c.course_id,c.course_name,count(distinct(e.enrollment_id)) as total_no_of_enrolled_users ,count(distinct(l.lesson_id)) as total_no_of_lessons,avg(l.duration_minutes) as average_lesson_duration_in_min
from courses as c 
join enrollments as e
on c.course_id=e.course_id
join lessons as l
on e.course_id=l.course_id
group by c.course_id,c.course_name;

--Identify the top three most active users based on total activity count.

select u.user_id,u.user_name,count(a.activity_id) as activity_count
from users as u
join user_activity as a
on u.user_id=a.user_id
group by u.user_id,u.user_name
order by activity_count desc 
limit 3;


--Calculate course completion percentage per user based on lesson activity.
