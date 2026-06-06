from faker import Faker
import random
import csv

fake = Faker()

users = []

for user_id in range(1, 201):
    users.append([
        user_id,
        fake.name(),
        fake.email(),
        random.randint(6000000000, 9999999999)
    ])

courses = []

for course_id in range(1, 201):
    courses.append([
        course_id,
        fake.word().title() + " Course",
        random.randint(1, 200)
    ])

lessons = []

for lesson_id in range(1, 201):
    lessons.append([
        lesson_id,
        random.randint(1, 200),
        fake.word().title() + " Lesson",
        random.randint(10, 120)
    ])

enrollments = []

for enrollment_id in range(1, 201):
    enrollments.append([
        enrollment_id,
        random.randint(1, 200),  
        random.randint(1, 200), 
        random.choice(["active", "inactive"]),
        fake.date_this_year()
    ])

user_activity = []

activity_types = [
    "Video Watched",
    "Lesson Completed",
    "Quiz Attempted",
    "Course Accessed"
]

for activity_id in range(1, 201):
    user_activity.append([
        activity_id,
        random.randint(1, 200), 
        random.randint(1, 200),  
        random.choice(activity_types),
        fake.date_this_year()
    ])


assessments = []

for assessment_id in range(1, 201):
    assessments.append([
        assessment_id,
        random.randint(1, 200), 
        fake.word().title() + " Assessment",
        round(random.uniform(50, 100), 2)
    ])
    
assessment_submissions = []

for submission_id in range(1, 201):
    assessment_submissions.append([
        submission_id,
        random.randint(1, 200),  # assessment_id
        random.randint(1, 200),  # user_id
        round(random.uniform(0, 100), 2),  # score
        fake.date_this_year()
    ])

# ---------------- WRITE CSV FILES ----------------

files = [
    (
        "LMS//users.csv",
        ["user_id", "user_name", "email", "phone_no"],
        users
    ),
    (
        "LMS//courses.csv",
        ["course_id", "course_name", "instructor_id"],
        courses
    ),
    (
        "LMS//lessons.csv",
        ["lesson_id", "course_id", "lesson_name", "duration_minutes"],
        lessons
    ),
    (
        "LMS//enrollments.csv",
        ["enrollment_id", "user_id", "course_id", "status", "enrolled_at"],
        enrollments
    ),
    (
        "LMS//user_activity.csv",
        ["activity_id", "user_id", "lesson_id", "activity_type", "activity_time"],
        user_activity
    ),
    (
        "LMS//assessments.csv",
        ["assessment_id", "course_id", "assessment_name", "max_score"],
        assessments
    ),
    (
        "LMS//assessment_submissions.csv",
        ["submission_id", "assessment_id", "user_id", "score", "submitted_at"],
        assessment_submissions
    )
]

for filename, headers, data in files:
    with open(filename, "w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(headers)  # Write header
        writer.writerows(data)

print("All CSV files generated successfully!")