/**********************************************************************
 * NAME: Lauren Nguyen
 * CLASS: CPSC321
 * DATE: 11/28/23
 * DESCRIPTION: SQL PROJECT QUERIES
 **********************************************************************/

-- TODO: add drop table statements
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Courses_in;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Clubs_in;
DROP TABLE IF EXISTS Clubs;
DROP TABLE IF EXISTS Activities;
DROP TABLE IF EXISTS Activities_in;

-- TODO: add create table statements
CREATE TABLE Student(
    student_id CHAR(100),
    first_name CHAR(100),
    last_name CHAR(100),
    age INT,
    college CHAR(100),
    major CHAR(100),
    PRIMARY KEY(student_id)
);

CREATE TABLE Courses_in(
    student_id CHAR(100),
    class_id CHAR(100),
    class_name CHAR(100),
    year_completed YEAR,
    grade_given CHAR(2),
    long_desc CHAR(200),
    PRIMARY KEY(student_id, class_id)
);

CREATE TABLE Courses(
    class_id CHAR(100),
    class_name CHAR(100),
    long_desc CHAR(100),
    PRIMARY KEY(class_id)
);

CREATE TABLE Clubs_in(
    student_id CHAR(100),
    club_id CHAR(100),
    club_name CHAR(100),
    year_joined YEAR,
    club_role CHAR(100),
    long_desc CHAR(200),
    club_size INT,
    PRIMARY KEY(student_id, club_id)
);

CREATE TABLE Clubs(
    club_id CHAR(100),
    club_name CHAR(100),
    long_desc CHAR(200),
    club_size INT,
    PRIMARY KEY(club_id)
);

CREATE TABLE Activities(
    activity_id CHAR(100),
    activity_name CHAR(100),
    activity_type CHAR(100),
    long_desc CHAR(200),
    PRIMARY KEY(activity_id)
);

CREATE TABLE Activities_in(
    student_id CHAR(100),
    activity_id CHAR(100),
    activity_name CHAR(100),
    year_joined YEAR,
    long_desc CHAR(200),
    PRIMARY KEY(activity_id)
);


