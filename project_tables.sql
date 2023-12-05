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
INSERT INTO Student VALUES ('gaustin', 'Gordon', 'Austin', 21, 'Gonzaga', 'Biology');


-- inserting values for courses in DB

INSERT INTO Courses VALUES ('MUSC131', 'Applied Trumpet', 'Individual lessons in applied trumpet, open to music majors, minors, and non-music majors');
INSERT INTO Courses VALUES ('CHEM230', 'Organic Chemistry 1', 'Essential concepts in bonding and structure, acid-base chemistry, reactivity and synthesis of functional groups, nomenclature, and mechanisms of fundamental organic reactions.');
INSERT INTO Courses VALUES ('CHEM231', 'Organic Chemistry 2', 'A significant focus of the course is on aromatic compounds and carbonyl chemistry.');
INSERT INTO Courses VALUES ('FILM202', 'Hollywood Cinema', 'This course serves as an introduction to the history of film as a medium, ranging from its origins to the current moment.');
INSERT INTO Courses VALUES ('JPNE201', 'Intermediate Japanese', 'Intensive oral work to develop fluency in the language; written composition and reading at the intermediate level. 200 kanji in addition to those introduced in JPNE 102.');
INSERT INTO Courses VALUES ('JPNE101', 'Elementary Japanese', 'Grammar, composition, conversation, and discussion of cultural topics. Mastery of hiragana, katakana, and approximately 50 kanji.');
INSERT INTO Courses VALUES ('SPAN321', 'Medieval Literature', 'This survey course is designed to give students a broad understanding of Spanish literature from its origins to the XVIII century.');
INSERT INTO Courses VALUES ('PSYC416', 'Psych of Gender', 'A review of both the theory and empirical literature investigating the psychology of gender, including biological cognitive, developmental and psychosocial models.');
INSERT INTO Courses VALUES ('PSYC340', 'Psych of Personality', 'A survey and critique of major theories of personality.');
INSERT INTO Courses VALUES ('SOCI223', 'Sex, Gender, and Society', 'Explores theories and research on the constructions of masculinity and femininity and how these influence our individual lives and social institutions.');
INSERT INTO Courses VALUES ('PSYC357', 'Lifespan Development', 'Lifespan development explores the physical, cognitive, and socio-emotional changes that humans experience across the lifespan from birth through old age.');
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
INSERT INTO Courses_in VALUES ('lnguyen9', 'FILM202', 'Hollywood Cinema', 2021, 'A', 'This course serves as an introduction to the history of film as a medium, ranging from its origins to the current moment.');

INSERT INTO Courses_in VALUES ('mtiu', 'BIO105', 'Info Flow in Biol Systems', 2022, 'A', 'This course provides a foundation in the principles of biology by examining the fundamental role of information in generating the properties of life.');
INSERT INTO Courses_in VALUES ('mtiu', 'CPSC223', 'Algorithm and Abstract Data Structures', 2023, 'A', 'Algorithm analysis using Big-O notation, sorting, heaps, balanced binary search trees, and hash tables.');
INSERT INTO Courses_in VALUES ('mtiu', 'CPSC222', 'Into to Data Science', 2022, 'A', 'This course provides an introduction to the underlying ideas, concepts, and techniques used in data science.');
INSERT INTO Courses_in VALUES ('mtiu', 'MATH321', 'Statistics for Experimentalists', 2023, 'B', 'An applied statistics course for those with calculus preparation.');
INSERT INTO Courses_in VALUES ('mtiu', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');

INSERT INTO Courses_in VALUES ('dmaxwell', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');
INSERT INTO Courses_in VALUES ('tfrausto', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');
INSERT INTO Courses_in VALUES ('adomingo', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');
INSERT INTO Courses_in VALUES ('lchin', 'CPSC121', 'Computer Science 1', 2021, 'A', 'An introduction to programming. Emphasis is on how to design, code, debug, and document programs using good programming style.');

INSERT INTO Courses_in VALUES ('mgiusti', 'FILM202', 'Hollywood Cinema', 2022, 'D', 'This course serves as an introduction to the history of film as a medium, ranging from its origins to the current moment.');
INSERT INTO Courses_in VALUES ('mgiusti', 'JPNE201', 'Intermediate Japanese', 2023, 'A', 'Intensive oral work to develop fluency in the language; written composition and reading at the intermediate level. 200 kanji in addition to those introduced in JPNE 102.');
INSERT INTO Courses_in VALUES ('mgiusti', 'JPNE101', 'Elementary Japanese', 2021, 'B', 'Grammar, composition, conversation, and discussion of cultural topics. Mastery of hiragana, katakana, and approximately 50 kanji.');

INSERT INTO Courses_in VALUES ('mshrull', 'SPAN321', 'Medieval Literature', 2023, 'A', 'This survey course is designed to give students a broad understanding of Spanish literature from its origins to the XVIII century.');
INSERT INTO Courses_in VALUES ('mshrull', 'PSYC416', 'Psych of Gender', 2023, 'A', 'A review of both the theory and empirical literature investigating the psychology of gender, including biological cognitive, developmental and psychosocial models.');
INSERT INTO Courses_in VALUES ('mshrull', 'PSYC340', 'Psych of Personality', 2023, 'B' ,'A survey and critique of major theories of personality.');
INSERT INTO Courses_in VALUES ('mshrull', 'SOCI223', 'Sex, Gender, and Society',2023, 'B', 'Explores theories and research on the constructions of masculinity and femininity and how these influence our individual lives and social institutions.');
INSERT INTO Courses_in VALUES ('mshrull', 'PSYC357', 'Lifespan Development', 2023, 'B', 'Lifespan development explores the physical, cognitive, and socio-emotional changes that humans experience across the lifespan from birth through old age.');

INSERT INTO Courses_in VALUES ('oharrington', 'SPAN321', 'Medieval Literature', 2023, 'A', 'This survey course is designed to give students a broad understanding of Spanish literature from its origins to the XVIII century.');
INSERT INTO Courses_in VALUES ('oharrington', 'PSYC416', 'Psych of Gender', 2023, 'A', 'A review of both the theory and empirical literature investigating the psychology of gender, including biological cognitive, developmental and psychosocial models.');
INSERT INTO Courses_in VALUES ('oharrington', 'PSYC340', 'Psych of Personality', 2023, 'A' ,'A survey and critique of major theories of personality.');
INSERT INTO Courses_in VALUES ('oharrington', 'SOCI223', 'Sex, Gender, and Society',2023, 'A', 'Explores theories and research on the constructions of masculinity and femininity and how these influence our individual lives and social institutions.');

INSERT INTO Courses_in VALUES ('gaustin', 'MUSC131', 'Applied Trumpet', 2022, 'C', 'Individual lessons in applied trumpet, open to music majors, minors, and non-music majors');
INSERT INTO Courses_in VALUES ('gaustin', 'CHEM230', 'Organic Chemistry 1', 2022, 'A', 'Essential concepts in bonding and structure, acid-base chemistry, reactivity and synthesis of functional groups, nomenclature, and mechanisms of fundamental organic reactions.');
INSERT INTO Courses_in VALUES ('gaustin', 'CHEM231', 'Organic Chemistry 2', 2023, 'A', 'A significant focus of the course is on aromatic compounds and carbonyl chemistry.');

INSERT INTO Courses_in VALUES ('etollett', 'SPAN321', 'Medieval Literature', 2023, 'A', 'This survey course is designed to give students a broad understanding of Spanish literature from its origins to the XVIII century.');
INSERT INTO Courses_in VALUES ('etollett', 'FILM202', 'Hollywood Cinema', 2021, 'A', 'This course serves as an introduction to the history of film as a medium, ranging from its origins to the current moment.');



-- inserting clubs
INSERT INTO Clubs VALUES ('Women in Computing','Club to support women in the computing field', 30);
INSERT INTO Clubs VALUES ('Association of Computer Machinery', 'Club to support students in the computing field', 130);
INSERT INTO Clubs VALUES ('Society of Women Engineers', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs VALUES ('Japan Club','Japanese cultural club', 35);
INSERT INTO Clubs VALUES ('Adventure Seekers','A club for thrill-seekers and outdoor enthusiasts', 35);
INSERT INTO Clubs VALUES ('Bookworms Society','Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs VALUES ('Artistry Collective','A space for artists to collaborate and showcase their creativity', 18);
INSERT INTO Clubs VALUES ('Film Buffs Society','Passionate about cinema and film-making', 16);
INSERT INTO Clubs VALUES ('Culinary Creators','Exploring the world of flavors and culinary arts', 20);
INSERT INTO Clubs VALUES ('Environmental Guardians','Working towards a greener and sustainable future', 30);


-- inserting clubs in
INSERT INTO Clubs_in VALUES ('oharrington', 'Adventure Seekers', 2019, 'President','A club for thrill-seekers and outdoor enthusiasts', 35);
INSERT INTO Clubs_in VALUES ('mshrull', 'Adventure Seekers', 2019, 'Member','A club for thrill-seekers and outdoor enthusiasts', 35);
INSERT INTO Clubs_in VALUES ('etollett', 'Adventure Seekers', 2019, 'Member','A club for thrill-seekers and outdoor enthusiasts', 35);

INSERT INTO Clubs_in VALUES ('lnguyen9', 'Culinary Creators', 2021, 'Member', 'Exploring the world of flavors and culinary arts', 20);
INSERT INTO Clubs_in VALUES ('tfrausto', 'Culinary Creators', 2021, 'Member', 'Exploring the world of flavors and culinary arts', 20);
INSERT INTO Clubs_in VALUES ('mmikesell', 'Culinary Creators', 2021, 'President', 'Exploring the world of flavors and culinary arts', 20);
INSERT INTO Clubs_in VALUES ('etollett', 'Culinary Creators', 2021, 'Member', 'Exploring the world of flavors and culinary arts', 20);

INSERT INTO Clubs_in VALUES ('tfrausto', 'Artistry Collective', 2020,'President','A space for artists to collaborate and showcase their creativity', 18);
INSERT INTO Clubs_in VALUES ('dmaxwell', 'Artistry Collective', 2020,'President','A space for artists to collaborate and showcase their creativity', 18);
INSERT INTO Clubs_in VALUES ('mtiu', 'Artistry Collective', 2020,'President','A space for artists to collaborate and showcase their creativity', 18);
INSERT INTO Clubs_in VALUES ('mshurll', 'Artistry Collective', 2020,'President','A space for artists to collaborate and showcase their creativity', 18);
INSERT INTO Clubs_in VALUES ('mmikesell', 'Artistry Collective', 2020,'President','A space for artists to collaborate and showcase their creativity', 18);

INSERT INTO Clubs_in VALUES ('oharrington', 'Film Buffs Society', 2022, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('mmikesell', 'Film Buffs Society', 2022, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('adomingo', 'Film Buffs Society', 2023, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('lchin', 'Film Buffs Society', 2022, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('etollett', 'Film Buffs Society', 2019, 'President','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('dmaxwell', 'Film Buffs Society', 2022, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('gaustin', 'Film Buffs Society', 2023, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('tfrausto', 'Film Buffs Society', 2023, 'Member','Passionate about cinema and film-making', 16);
INSERT INTO Clubs_in VALUES ('lnguyen9', 'Film Buffs Society', 2023, 'Member','Passionate about cinema and film-making', 16);

INSERT INTO Clubs_in VALUES ('mtiu', 'Environmental Guardians', 2020, 'President','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('dmaxwell', 'Environmental Guardians', 2021, 'Member','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('tfrausto', 'Environmental Guardians', 2021, 'Member','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('lchin', 'Environmental Guardians', 2022, 'Member','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('adomingo', 'Environmental Guardians', 2020, 'Member','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('mgiusti', 'Environmental Guardians', 2020, 'Member','Working towards a greener and sustainable future', 30);
INSERT INTO Clubs_in VALUES ('lnguyen9','Women in Computing', 2022, 'President', 'Club to support women in the computing field', 30);

INSERT INTO Clubs_in VALUES ('mtiu','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('dmaxwell','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('tfrausto','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('lchin','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);
INSERT INTO Clubs_in VALUES ('adomingo','Women in Computing', 2022, 'Member', 'Club to support women in the computing field', 30);

INSERT INTO Clubs_in VALUES ('lnguyen9','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('mtiu','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('adomingo','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('lchin','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('tfrausto','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);
INSERT INTO Clubs_in VALUES ('dmaxwell','Association of Computer Machinery', 2021, 'Member', 'Club to support students in the computing field', 130);


INSERT INTO Clubs_in VALUES ('lnguyen9','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('lchin','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('tfrausto','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('dmaxwell','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('mtiu','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);
INSERT INTO Clubs_in VALUES ('adomingo','Society of Women Engineers', 2022, 'Member', 'Club to support women in the engineering field', 45);


INSERT INTO Clubs_in VALUES ('lnguyen9','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mgiusti','Japan Club', 2022, 'Social Media Chair', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('oharrington','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('etollett','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mmikesell','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);
INSERT INTO Clubs_in VALUES ('mshrull','Japan Club', 2022, 'Member', 'Japanese cultural club', 35);

INSERT INTO Clubs_in VALUES ('gaustin', 'Bookworms Society', 2019, 'Vice President', 'Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs_in VALUES ('lnguyen9', 'Bookworms Society', 2019, 'President', 'Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs_in VALUES ('adomingo', 'Bookworms Society', 2019, 'Member', 'Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs_in VALUES ('lchin', 'Bookworms Society', 2019, 'Member', 'Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs_in VALUES ('mmikesell', 'Bookworms Society', 2019, 'Member', 'Dedicated to the love of literature and meaningful discussions', 28);
INSERT INTO Clubs_in VALUES ('mshrull', 'Bookworms Society', 2019, 'Member', 'Dedicated to the love of literature and meaningful discussions', 28);


-- inserting activities
INSERT INTO Activities VALUES ('Knitting', 'Recreational', 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities VALUES ('Movies', 'Educational', 'Watching different movies across a wide range of genres');
INSERT INTO Activities VALUES ('Photography', 'Educational', 'Capturing different subjects with different cameras');
INSERT INTO Activities VALUES ('Hiking', 'Recreational', 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities VALUES ('Board Game Night', 'Recreational', 'Enjoying social interactions and friendly competition through various board games');
INSERT INTO Activities VALUES ('Yoga in the Park', 'Recreational', 'Relaxing and rejuvenating the body and mind with outdoor yoga sessions');
INSERT INTO Activities VALUES ('Gardening', 'Educational', 'Learning about plant care, landscaping, and creating beautiful gardens');
INSERT INTO Activities VALUES ('Karaoke', 'Recreational', 'Singing and having a great time with friends in a karaoke event');
INSERT INTO Activities VALUES ('Video Games', 'Recreational', 'Playing a variety of different online games with friends or solo');
INSERT INTO Activities VALUES ('Painting', 'Educational', 'Exploring the evolution of art movements and significant artistic periods');


-- inserting activities in
INSERT INTO Activities_in VALUES ('lnguyen9', 'Knitting', 2010, 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities_in VALUES ('mgiusti', 'Knitting', 2010, 'Using yarn and needles to create blankets and scarfs');
INSERT INTO Activities_in VALUES ('etollett', 'Knitting', 2013, 'Using yarn and needles to create blankets and scarfs')

INSERT INTO Activities_in VALUES ('gaustin', 'Video Games', 2007, 'Playing a variety of different online games with friends or solo');
INSERT INTO Activities_in VALUES ('mmikesell', 'Video Games', 2021, 'Playing a variety of different online games with friends or solo');
;
INSERT INTO Activities_in VALUES ('lnguyen9', 'Movies', 2020, 'Watching different movies across a wide range of genres');
INSERT INTO Activities_in VALUES ('etollett', 'Movies', 2011, 'Watching different movies across a wide range of genres');
INSERT INTO Activities_in VALUES ('oharrington', 'Movies', 2021, 'Watching different movies across a wide range of genres');

INSERT INTO Activities_in VALUES ('lnguyen9', 'Photography', 2010, 'Capturing different subjects with different cameras');
INSERT INTO Activities_in VALUES ('oharrington', 'Photography', 2015, 'Capturing different subjects with different cameras');

INSERT INTO Activities_in VALUES ('lnguyen9', 'Hiking', 2016, 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities_in VALUES ('mmikesell', 'Hiking', 2010, 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities_in VALUES ('mgiusti', 'Hiking', 2021, 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities_in VALUES ('etollett', 'Hiking', 2020, 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities_in VALUES ('oharrington', 'Hiking', 2014, 'Exploring nature and scenic landscapes through outdoor hiking adventures');
INSERT INTO Activities_in VALUES ('mshrull', 'Hiking', 2012, 'Exploring nature and scenic landscapes through outdoor hiking adventures');

INSERT INTO Activities_in VALUES ('mtiu', 'Board Game Night', 2008, 'Enjoying social interactions and friendly competition through various board games');
INSERT INTO Activities_in VALUES ('dmaxwell', 'Board Game Night', 2015, 'Enjoying social interactions and friendly competition through various board games');
INSERT INTO Activities_in VALUES ('tfrausto', 'Board Game Night', 2022, 'Enjoying social interactions and friendly competition through various board games');
INSERT INTO Activities_in VALUES ('gaustin', 'Board Game Night', 2021, 'Enjoying social interactions and friendly competition through various board games');

INSERT INTO Activities_in VALUES ('lchin', 'Yoga in the Park', 2020, 'Relaxing and rejuvenating the body and mind with outdoor yoga sessions');
INSERT INTO Activities_in VALUES ('mmikesell', 'Yoga in the Park', 2023, 'Relaxing and rejuvenating the body and mind with outdoor yoga sessions');
INSERT INTO Activities_in VALUES ('adomingo', 'Yoga in the Park', 2023, 'Relaxing and rejuvenating the body and mind with outdoor yoga sessions');

INSERT INTO Activities_in VALUES ('etollett', 'Gardening', 2005, 'Learning about plant care, landscaping, and creating beautiful gardens');
INSERT INTO Activities_in VALUES ('mshrull', 'Gardening', 2017, 'Learning about plant care, landscaping, and creating beautiful gardens');
INSERT INTO Activities_in VALUES ('mmikesell', 'Gardening', 2023, 'Learning about plant care, landscaping, and creating beautiful gardens');

INSERT INTO Activities_in VALUES ('mshrull', 'Karaoke', 2020, 'Singing and having a great time with friends in a karaoke event');
INSERT INTO Activities_in VALUES ('lchin', 'Karaoke', 2020, 'Singing and having a great time with friends in a karaoke event');
INSERT INTO Activities_in VALUES ('adomingo', 'Karaoke', 2022, 'Singing and having a great time with friends in a karaoke event');

INSERT INTO Activities_in VALUES ('lchin', 'Painting', 2014, 'Exploring the evolution of art movements and significant artistic periods');
INSERT INTO Activities_in VALUES ('adomingo', 'Painting', 2018, 'Exploring the evolution of art movements and significant artistic periods');
INSERT INTO Activities_in VALUES ('etollett', 'Painting', 2013, 'Exploring the evolution of art movements and significant artistic periods');





