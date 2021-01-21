CREATE TABLE lagou_teacher(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
des VARCHAR(100),
level CHAR(4)
);
CREATE UNIQUE INDEX ind_tname ON lagou_teacher(name)

CREATE TABLE lagou_subject(
id INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR(20),
cdes VARCHAR(40),
createtime DATE,
updatetime DATE
);

CREATE TABLE lagou_course(
	id INT PRIMARY KEY AUTO_INCREMENT,
	teacher_id INT,
	subject_id INT,
	cname VARCHAR(20),
	ctime INT,
	browse BIGINT,
	state CHAR(1),
	FOREIGN KEY (teacher_id) REFERENCES lagou_teacher(id),
	FOREIGN KEY (subject_id) REFERENCES lagou_subject(id)
);

-- 向讲师表插入两条数据
INSERT INTO lagou_teacher 
VALUES (1, '刘德华', '毕业于清华大学，主攻前端技术,授课风格生动活泼,深受学员喜爱', 
'高级讲师');
INSERT INTO lagou_teacher 
VALUES (2, '郭富城', '毕业于北京大学，多年的IT经验，研发多项Java课题,授课经验丰富', 
'首席讲师');

-- 向课程分类表中插入两条数据
INSERT INTO lagou_subject VALUES (1, '后端开发', '后端课程包括 Java PHP Python', '2020-03-27 00:44:04', '2020-03-27 00:44:04');
INSERT INTO lagou_subject VALUES (2, '前端开发', '前端课程包括 JQuery VUE angularJS', '2020-02-27 10:00:04', '2020-02-27 18:44:04');

-- 向课程表中插入两条数据
-- 插入Java课程
INSERT INTO lagou_course VALUES (1,1,1 ,'Java', 300,250000, '1');
-- 插入VUE课程
INSERT INTO lagou_course VALUES (2,2,2, 'VUE', 400,200000,'1');

### 查询需求
-- 查询刘德华老师所教的课程属于哪个课程分类

SELECT cname FROM lagou_subject 
WHERE id = (SELECT subject_id FROM lagou_course WHERE teacher_id = (SELECT id FROM lagou_teacher WHERE name = '刘德华')) 