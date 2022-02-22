-- Student ID: 2019-3-60-041
-- Lab No. : 01

--Lab Task: 01(a)

CREATE TABLE instructor_2019360041(
	id NUMBER,
	name VARCHAR2(15),
	dept_name VARCHAR2(15),
	salary NUMBER
) ;

--Lab Task: 01(b)

CREATE TABLE course_2019360041(
	course_id VARCHAR2(15),
	title VARCHAR2(30),
	dept_name VARCHAR2(15),
	credits NUMBER
) ;

--Lab Task: 02(a)
INSERT INTO instructor_2019360041 VALUES (10101, 'Srinivasan', 'Comp. Sci.' , 65000);
INSERT INTO instructor_2019360041 VALUES (12121, 'Wu', 'Finance' , 90000);
INSERT INTO instructor_2019360041 VALUES (15151, 'Mozart', 'Music' , 40000);
INSERT INTO instructor_2019360041 VALUES (22222, 'Einstein', 'Physics' , 95000);
INSERT INTO instructor_2019360041 VALUES (32343, 'El Said', 'History' , 60000);
INSERT INTO instructor_2019360041 VALUES (33456, 'Gold', 'Physics' , 87000);
INSERT INTO instructor_2019360041 VALUES (45565, 'Katz', 'Comp. Sci' , 75000);
INSERT INTO instructor_2019360041 VALUES (58583, 'Califieri', 'History' , 62000);
INSERT INTO instructor_2019360041 VALUES (76543, 'Singh', 'Finance' , 80000);
INSERT INTO instructor_2019360041 VALUES (76766, 'Crick', 'Biology' , 72000);
INSERT INTO instructor_2019360041 VALUES (83821, 'Brandt', 'Comp. Sci.' , 92000);
INSERT INTO instructor_2019360041 VALUES (98345, 'Kim', 'Elec. Eng.' , 80000);

--Lab Task: 02(b)
INSERT INTO course_2019360041 VALUES ('BIO-101', 'Intro. to Biology' , 'Biology', 4);
INSERT INTO course_2019360041 VALUES ('BIO-301', 'Genetics' , 'Biology', 4);
INSERT INTO course_2019360041 VALUES ('BIO-399', 'Computational Biology' , 'Biology', 3);
INSERT INTO course_2019360041 VALUES ('CS-101', 'Intro. to Comp. Science' , 'Comp. Sci.', 4);
INSERT INTO course_2019360041 VALUES ('CS-190', 'Game Design' , 'Comp. Sci.', 4);
INSERT INTO course_2019360041 VALUES ('CS-315', 'Robotics' , 'Comp. Sci.', 3);
INSERT INTO course_2019360041 VALUES ('CS-319', 'Image Processing' , 'Comp. Sci.', 3);
INSERT INTO course_2019360041 VALUES ('CS-347', 'Database System Concepts' , 'Comp. Sci.', 3);
INSERT INTO course_2019360041 VALUES ('EE-181', 'Intro. to Digital Systems' , 'Elec. Eng.', 3);
INSERT INTO course_2019360041 VALUES ('FIN-201', 'Investment Banking' , 'Finance', 3);
INSERT INTO course_2019360041 VALUES ('HIS-351', 'World History' , 'History', 3);
INSERT INTO course_2019360041 VALUES ('MU-199', 'Music Video Production' , 'Music', 3);
INSERT INTO course_2019360041 VALUES ('PHY-101', 'Physical Principles' , 'Physics', 4);

--Lab Task: 03(i)
SELECT name FROM INSTRUCTOR_2019360041;

--Lab Task: 03(ii)
SELECT course_id,title FROM course_2019360041;

--Lab Task: 03(iii)
SELECT name, dept_name
from instructor_2019360041
where id=22222;

--Lab Task: 03(iv)
SELECT title, credits
from course_2019360041
where dept_name='Comp. Sci.';

--Lab Task: 03(v)
SELECT name, dept_name
from instructor_2019360041
where salary>70000;

--Lab Task: 03(vi)
SELECT title
from course_2019360041
where credits>=4;

--Lab Task: 03(vii)
SELECT name, dept_name
from instructor_2019360041
where salary>=80000 and salary<=100000;

--Lab Task: 03(viii)
SELECT title, credits
from course_2019360041
where dept_name!='Comp. Sci.';

--Lab Task: 03(ix)
SELECT *
from instructor_2019360041;

--Lab Task: 03(x)
SELECT *
from course_2019360041
where dept_name='Biology' and credits!=4;