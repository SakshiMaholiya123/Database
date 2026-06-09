
--1.List all users who are enrolled in more than three courses.
select user_id,count(course_id) from enrollments group by user_id having count(course_id)>3;

--2.Find courses that currently have no enrollments.
select c.course_id,c.course_name,e.enrollment_id from courses as c join enrollments as e on c.course_id=e.course_id where enrollment_id is null;

--3.Display each course along with the total number of enrolled users.
select course_id,count(enrollment_id) as number_of_enrollments_in_course from enrollments group by course_id;


--4. Identify users who enrolled in a course but never accessed any lesson.
SELECT e.user_id,e.course_idFROM enrollments eWHERE NOT EXISTS (SELECT 1
    FROM user_activity ua
    JOIN lessons l
      ON ua.lesson_id = l.lesson_id
    WHERE ua.user_id = e.user_id
      AND l.course_id = e.course_id
);
--5.Fetch lessons that have never been accessed by any user.

--7.List users who submitted an assessment but scored less than 50 percent of the maximum score.
select submission_id,user_id,score from assessment_submissions where score(select max(score) from assessment_submissions)<max(score)*0.50;


--8.Find assessments that have not received any submissions.
select a.assessment_id,a,assessment_name ,s.submission_id 
from assessments as a
left join assessment_submissions as s
on a.assessment_id=s.assessment_id 
where s.submission_id is null;

--9. Display the highest score achieved for each assessment.
select a.assessment_id,a.assessment_name,max(s.score) as highest_score
from assessments as a 
join assessment_submissions as s 
on a.assessment_id=s.assessment_id group by a.assessment_id,a.assessment_name;

--10.Identify users who are enrolled in a course but have an inactive enrollment status.
select u.user_id,u.user_name,e.status
from users as u 
left join enrollments as e
on u.user_id=e.user_id
where e.status='inactive';




