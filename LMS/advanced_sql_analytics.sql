--11. --For each course, calculate:
-- Total number of enrolled users
-- Total number of lessons
-- Average lesson duration
select c.course_id,c.course_name,count(distinct(e.enrollment_id)) as total_no_of_enrolled_users ,count(distinct(l.lesson_id)) as total_no_of_lessons,avg(distinct(l.duration_minutes)) as average_lesson_duration_in_min
from courses as c 
join enrollments as e
on c.course_id=e.course_id
join lessons as l
on e.course_id=l.course_id
group by c.course_id,c.course_name;

--12 Identify the top three most active users based on total activity count.
select u.user_id,u.user_name,count(a.activity_id) as activity_count
from users as u
join user_activity as a
on u.user_id=a.user_id
group by u.user_id,u.user_name
order by activity_count desc 
limit 3;


--13. Calculate course completion percentage per user based on lesson activity.
select 


--14 Find users whose average assessment score is higher than the course average.
select asub.user_id,avg(a.max_score),avg(asub.score) 
from  assessments as a 
join assessment_submissions as asub
on a.assessment_id=asub.assessment_id
group by asub.user_id
having avg(asub.score)>avg(a.max_score);


--15 List courses where lessons are frequently accessed but assessments are never attempted.
select c.course_id,c.course_name,count(ua.activity_id)
from courses as c
join lessons as l
on c.course_id=l.course_id
join user_activity ua
ON l.lesson_id = ua.lesson_id
left join assessments as a
on l.course_id=a.course_id
left join assessment_submissions as sub
on a.assessment_id=sub.assessment_id
group by c.course_id,c.course_name 
having count(activity_id)>0 and count(sub.submission_id)=0;

--16 Rank users within each course based on their total assessment score.
select user_id,user_name,course_id,total_assessment_score,
rank() over(partition by course_id order by total_assessment_score desc) as rank_user
from (select u.user_id,u.user_name,a.course_id,sum(asub.score) as total_assessment_score
from users as u
join assessments as a 
on u.course_id=a.course_id
left join assessment_submissions as asub
on u.user_id=asub.user_id
group by u.user_id,u.user_name,a.course_id);

--17 Identify the first lesson accessed by each user for every course.
select l.lesson_id,l.lesson_name,course_id,user_id,user_name
from lessons l
left join courses c
on l.course_id=c.course_id
group by 
