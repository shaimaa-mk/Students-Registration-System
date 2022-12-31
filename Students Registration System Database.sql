USE gsg_std_sys;

CREATE TABLE level (
    level_id INT AUTO_INCREMENT,
    level_name VARCHAR(40),
    CONSTRAINT PRIMARY KEY (level_id)
);

CREATE TABLE contact (
    contact_id INT AUTO_INCREMENT,
    mobile_number VARCHAR(40),
    email VARCHAR(120),
    CONSTRAINT PRIMARY KEY (contact_id)
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT,
    level_id INT,
    course_name VARCHAR(40),
    max_capacity VARCHAR(40),
    rate_per_hour NUMERIC,
    CONSTRAINT PRIMARY KEY (course_id),
    CONSTRAINT FOREIGN KEY (level_id)
    REFERENCES level(level_id)
);

CREATE TABLE course_schedule (
    course_schedule_id INT AUTO_INCREMENT,
    course_id INT,
    course_day VARCHAR(40),
    duration INT,
    start_time TIME,
    CONSTRAINT PRIMARY KEY (course_schedule_id),
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE address (
    address_id INT AUTO_INCREMENT,
    state VARCHAR(40),
    city VARCHAR(40),
    Street VARCHAR(40),
    CONSTRAINT PRIMARY KEY (address_id)
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    student_name VARCHAR(40),
    contact_id INT,
    address_id INT,
    level_id INT,
    BOD DATE,
    CONSTRAINT PRIMARY KEY (student_id),
    CONSTRAINT FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    CONSTRAINT FOREIGN KEY (address_id) REFERENCES address(address_id),
    CONSTRAINT FOREIGN KEY (level_id) REFERENCES level(level_id)
);

CREATE TABLE enrollment_history(
    enroll_id INT AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATETIME,
    total_hours INT,
    total DECIMAL(4,2),
    CONSTRAINT PRIMARY KEY (enroll_id),
    CONSTRAINT FOREIGN KEY (student_id) REFERENCES student(student_id),
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES course(course_id)
);

ALTER TABLE course MODIFY rate_per_hour DECIMAL(4,2);