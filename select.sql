# 1.查询同时存在1课程和2课程的情况
SELECT * FROM student_course where (courseId = '1' and studentId in 
(SELECT studentId FROM student_course where courseId = '2')) OR (courseId = '2' and studentId in 
(SELECT studentId FROM student_course where courseId = '1'))

# 2.查询同时存在1课程和2课程的情况
SELECT * FROM student_course where (courseId = '1' and studentId in 
(SELECT studentId FROM student_course where courseId = '2')) OR (courseId = '2' and studentId in 
(SELECT studentId FROM student_course where courseId = '1'))

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT studentId,NAME,AVG(score) AS avg from student_course,student  
WHERE student.id = student_course.studentId GROUP BY studentId HAVING avg>=60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
 SELECT * FROM student where student.id NOT in (SELECT DISTINCT studentId FROM student_course);

# 5.查询所有有成绩的SQL
 SELECT * FROM student_course

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
 SELECT * FROM student_course where (courseId = '1' and studentId in 
(SELECT studentId FROM student_course where courseId = '2')) OR (courseId = '2' and studentId in 
(SELECT studentId FROM student_course where courseId = '1'))

# 7.检索1课程分数小于60，按分数降序排列的学生信息
 SELECT * FROM student where id in
(SELECT student_course.studentId 
FROM student_course 
where courseId = '1' 
AND score < 60 
GROUP BY score DESC);
 
 

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
 SELECT courseId,AVG(score) FROM student_course GROUP BY courseId ORDER BY AVG(score) DESC;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
 SELECT student.name,student_course.score 
FROM course,student_course,student 
where student_course.score < 60 
AND course.name = '数学'
AND course.id = student_course.courseId
AND student.id = student_course.studentId;
 
