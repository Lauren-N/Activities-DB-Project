/**********************************************************************
 * NAME: Lauren Nguyen
 * CLASS: CPSC321
 * DATE: 11/28/23
 * DESCRIPTION: SQL PROJECT TABLES
 **********************************************************************/

-- TODO: add drop table statements
DROP TABLE IF EXISTS Activities_in;
DROP TABLE IF EXISTS Activities;
DROP TABLE IF EXISTS Clubs_in;
DROP TABLE IF EXISTS Clubs;
DROP TABLE IF EXISTS Courses_in;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Student;

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

CREATE TABLE Courses(
    course_class_id CHAR(100),
    course_class_name CHAR(100),
    course_long_desc CHAR(250),
    PRIMARY KEY(course_class_id)
);

CREATE TABLE Courses_in(
    student_id CHAR(100),
    class_id CHAR(100),
    class_name CHAR(100),
    year_completed YEAR,
    grade_given CHAR(2),
    long_desc CHAR(250),
    PRIMARY KEY(student_id, class_id),
    FOREIGN KEY(class_id) REFERENCES Courses(course_class_id)
);

CREATE TABLE Clubs(
    club_name CHAR(100),
    long_desc CHAR(200),
    club_size INT,
    PRIMARY KEY(club_name)
);

CREATE TABLE Clubs_in(
    student_id CHAR(100),
    student_club_name CHAR(100),
    year_joined YEAR,
    club_role CHAR(100),
    long_desc CHAR(200),
    club_size INT,
    PRIMARY KEY(student_id, student_club_name),
    FOREIGN KEY(student_club_name) REFERENCES Clubs(club_name)
);

CREATE TABLE Activities(
    activity_name CHAR(100),
    activity_type CHAR(100),
    long_desc CHAR(200),
    PRIMARY KEY(activity_name)
);

CREATE TABLE Activities_in(
    student_id CHAR(100),
    activity_name CHAR(100),
    year_joined YEAR,
    long_desc CHAR(200),
    PRIMARY KEY(student_id, activity_name),
    FOREIGN KEY(activity_name) REFERENCES Activities(activity_name)
);


-- inserting students
INSERT INTO Student VALUES ('lnguyen9', 'Lauren', 'Nguyen', 20, 'Gonzaga', 'Computer Science');
INSERT INTO Student VALUES ('mgiusti', 'Madeline', 'Giusti', 20, 'Gonzaga', 'Human Physiology');
INSERT INTO Student VALUES ('oharrington', 'Olivia', 'Harrington', 20, 'Gonzaga', 'Psychology');
INSERT INTO Student VALUES ('mshrull', 'Madeleine', 'Shrull', 20, 'Gonzaga', 'Psychology');
INSERT INTO Student VALUES ('mmikesell', 'Marlee', 'Mikesell', 21, 'Gonzaga', 'Political Science');
INSERT INTO Student VALUES ('etollett', 'Ellie', 'Tollett', 20, 'Gonzaga', 'Psychology');
INSERT INTO Student VALUES ('mtiu', 'Maya', 'Tiu', 20, 'Gonzaga', 'Computer Science');
INSERT INTO Student VALUES ('dmaxwell', 'Delainey', 'Maxwell', 21, 'Gonzaga', 'Computer Science');
INSERT INTO Student VALUES ('tfrausto', 'Talia', 'Frausto', 20, 'Gonzaga', 'Computer Science');
INSERT INTO Student VALUES ('adomingo', 'Alicia', 'Domingo', 20, 'Gonzaga', 'Computer Science');
INSERT INTO Student VALUES ('lchin', 'Lauren', 'Chin', 19, 'Gonzaga', 'Computer Science');




-- inserting values for courses in DB
INSERT INTO Courses VALUES ('CPSC321', 'Database Management Systems', 'Introduction to relational database concepts and techniques.');
INSERT INTO Courses VALUES ('CPSC333', 'Mobile App Development','This course provides an introduction to mobile application development.');
INSERT INTO Courses VALUES ('CPSC323', 'Machine Learning and Intelligent Systems', 'A look into ML...');
INSERT INTO Courses VALUES ('CPSC346', 'Operating Systems', 'Study of operating systems internals.');
INSERT INTO Courses VALUES ('MATH321', 'Statistics for Experimentalists', 'An applied statistics course for those with calculus preparation.');
INSERT INTO Courses VALUES ('LIT105', 'Literature of the Open Road', 'This course introduces students to literary study through the exploration of a particular theme.');

INSERT INTO Courses VALUES ('BIO105', 'Info Flow in Biol Systems', 'This course provides a foundation in the principles of biology by examining the fundamental role of information in generating the properties of life.');
INSERT INTO Courses VALUES ('CPSC223', 'Algorithm and Abstract Data Structures', 'Algorithm analysis using Big-O notation, sorting, heaps, balanced binary search trees, and hash tables.');
INSERT INTO Courses VALUES ('CPSC222', 'Into to Data Science', 'This course provides an introduction to the underlying ideas, concepts, and techniques used in data science.');
INSERT INTO Courses VALUES ('HIST201', 'History of the US', 'This course surveys North American history from the continents first peopling through the end of the U.S. Civil War.');
INSERT INTO Courses VALUES ('MATH231', 'Discrete Structures', 'A study of propositional logic, set theory, functions, algorithms, divisibility, introductory number theory, elementary proof techniques, counting techniques, recursive definitions, mathematical induction, and graph theory.');

INSERT INTO Courses VALUES ('CPSC121', 'Computer Science 1', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');
INSERT INTO Courses VALUES ('MATH157', 'Calculus 1', 'An introduction to calculus for engineering, science and mathematics students, with an emphasis on conceptual understanding, problem solving, and modeling.');
INSERT INTO Courses VALUES ('EDPE157', 'Yoga', 'This class is designed to promote individual fitness for total mind/body health.');
INSERT INTO Courses VALUES ('ENVS193', 'Digital Ecology', 'The First-Year Seminar (FYS) introduces new Gonzaga students to the University, the Core Curriculum, and Gonzagas Jesuit mission and heritage.');
INSERT INTO Courses VALUES ('ENGL101', 'Writing', 'This course helps students develop the foundational skills of critical reading, thinking, analysis, and writing.');
INSERT INTO Courses VALUES ('THEA100', 'Introduction to Theatre Arts', 'An introductory survey of the history, aesthetics, and literature of the theatre, and the various areas of theatrical production.');


-- inserting values for courses a student is in
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC321', 'Database Management Systems', 2023, 'A', 'Introduction to relational database concepts and techniques.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC333', 'Mobile App Development', 2023, 'B', 'This course provides an introduction to mobile application development.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC323', 'Machine Learning and Intelligent Systems', 2023, 'A', 'A look into ML...');
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC346', 'Operating Systems', 2023, 'A', 'Study of operating systems internals.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'MATH321', 'Statistics for Experimentalists', 2023, 'A', 'An applied statistics course for those with calculus preparation.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'LIT105', 'Literature of the Open Road', 2023, 'A', 'This course introduces students to literary study through the exploration of a particular theme.');

INSERT INTO Courses_in VALUES ('lnguyen9', 'BIO105', 'Info Flow in Biol Systems', 2022, 'B', 'This course provides a foundation in the principles of biology by examining the fundamental role of information in generating the properties of life.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC223', 'Algorithm and Abstract Data Structures', 2023, 'A', 'Algorithm analysis using Big-O notation, sorting, heaps, balanced binary search trees, and hash tables.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC222', 'Into to Data Science', 2022, 'A', 'This course provides an introduction to the underlying ideas, concepts, and techniques used in data science.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'HIST201', 'History of the US', 2022, 'B', 'This course surveys North American history from the continents first peopling through the end of the U.S. Civil War.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'MATH231', 'Discrete Structures', 2022, 'A', 'A study of propositional logic, set theory, functions, algorithms, divisibility, introductory number theory, elementary proof techniques, counting techniques, recursive definitions, mathematical induction, and graph theory.');

INSERT INTO Courses_in VALUES ('lnguyen9', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'MATH157', 'Calculus 1', 2021, 'C', 'An introduction to calculus for engineering, science and mathematics students, with an emphasis on conceptual understanding, problem solving, and modeling.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'EDPE157', 'Yoga', 2021, 'A', 'This class is designed to promote individual fitness for total mind/body health.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'ENVS193', 'Digital Ecology', 2021, 'A', 'The First-Year Seminar (FYS) introduces new Gonzaga students to the University, the Core Curriculum, and Gonzagas Jesuit mission and heritage.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'ENGL101', 'Writing', 2021, 'B', 'This course helps students develop the foundational skills of critical reading, thinking, analysis, and writing.');
INSERT INTO Courses_in VALUES ('lnguyen9', 'THEA100', 'Introduction to Theatre Arts', 2021, 'A', 'An introductory survey of the history, aesthetics, and literature of the theatre, and the various areas of theatrical production.');

-- inserting clubs
INSERT INTO Clubs VALUES ('Women in Computing','Club to support women in the computing field', 30);
INSERT INTO Clubs VALUES ('Association of Computer Machinery', 'Club to support students in the computing field', 130);
INSERT INTO Clubs VALUES ('Society of Women Engineers', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs VALUES ('Japan Club','Japanese cultural club', 35);
INSERT INTO Clubs VALUES ('Example Club','Example club', 21);

-- inserting clubs in
INSERT INTO Clubs_in VALUES ('lnguyen9','Women in Computing', 2022, 'President', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('mtiu','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('dmaxwell','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('tfrausto','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('lchin','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('adomingo','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('lnguyen9','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('lnguyen9','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('lnguyen9','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mgiusti','Japan Club', 2022, 'Member', 'Social Media Chair', 35);
INSERT INTO Clubs_in VALUES ('oharrington','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('etollett','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mmikesell','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mshrull','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);

-- inserting activities
INSERT INTO Activities VALUES ('Knitting', 'Recreational', 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities VALUES ('Movies', 'Recreational', 'Watching different movies across a wide range of genres');
INSERT INTO Activities VALUES ('Photography', 'Educational', 'Capturing different subjects with different cameras');

-- inserting activities in
INSERT INTO Activities_in VALUES ('lnguyen9', 'Knitting', 2010, 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities_in VALUES ('mgiusti', 'Knitting', 2022, 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities_in VALUES ('lnguyen9', 'Movies', 2020, 'Watching different movies across a wide range of genres');
INSERT INTO Activities_in VALUES ('lnguyen9', 'Photography', 2010, 'Capturing different subjects with different cameras');
