create table users(
user_id serial primary key,
user_name varchar(50),
email varchar(100),
phone_no bigint,
);


create table courses (
course_id serial primary key,
course_name VARCHAR(200),
instructor_id INT REFERENCES users(user_id)
);

create table lessons (
    lesson_id int PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    lesson_name VARCHAR(200),
    duration_minutes INT
);

create table enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    course_id INT REFERENCES courses(course_id),
    status VARCHAR(20), -- active, inactive
    enrolled_at date
);

create table user_activity (
    activity_id BIGSERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    lesson_id INT REFERENCES lessons(lesson_id),
    activity_type VARCHAR(50),
    activity_time date
);

create table assessments (
    assessment_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    assessment_name VARCHAR(200),
    max_score NUMERIC(5,2)
);

create table assessment_submissions (
    submission_id BIGSERIAL PRIMARY KEY,
    assessment_id INT REFERENCES assessments(assessment_id),
    user_id INT REFERENCES users(user_id),
    score NUMERIC(5,2),
    submitted_at date
);