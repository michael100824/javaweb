USE lianxi01
-- 1. 创建部门表(id,name) 
-- # 创建部门表
create table dept(
	id int primary key auto_increment,
	name varchar(20)
)

insert into dept (name) values ('开发部'),('市场部'),('财务部');

-- 2. 员工表，员工表(id, 姓名，性别，工资，入职日期，部门ID)
-- # 创建员工表
create table employee (
	id int primary key auto_increment,
	name varchar(10),
	gender char(1),   -- 性别
	salary double,   -- 工资
	join_date date,  -- 入职日期
	dept_id int,
	foreign key (dept_id) references dept(id) -- 外键，关联部门表(部门表的主键)
)	

insert into employee(name,gender,salary,join_date,dept_id) values('孙悟空','男',7200,'2013-02-24',1);
insert into employee(name,gender,salary,join_date,dept_id) values('猪八戒','男',3600,'2010-12-02',2);
insert into employee(name,gender,salary,join_date,dept_id) values('唐僧','男',9000,'2008-08-08',2);
insert into employee(name,gender,salary,join_date,dept_id) values('白骨精','女',5000,'2015-10-07',3);
insert into employee(name,gender,salary,join_date,dept_id) values('蜘蛛精','女',4500,'2011-03-14',1);


按要求实现下面的查询功能 

1) 查询工资最高的员工是谁？
SELECT name FROM employee 
WHERE salary = (SELECT MAX(salary) FROM employee);

2) 查询工资小于平均工资的员工有哪些？
SELECT name FROM employee 
WHERE salary < (SELECT AVG(salary) FROM employee);

3) 查询大于5000的员工，来至于哪些部门，输出部门的名字
SELECT e.name, salary, d.name AS department FROM employee e
JOIN dept d on (e.dept_id = d.id)
WHERE salary> 5000;

4) 查询开发部与财务部所有的员工信息，分别使用子查询和表连接实现
SELECT *  FROM employee 
WHERE dept_id in (SELECT id FROM dept  WHERE name in ('开发部', '财务部'));

SELECT * FROM employee e
JOIN dept d on (e.dept_id = d.id)
WHERE d.name in  ('开发部', '财务部');


5) 查询2011年以后入职的员工信息和部门信息，分别使用子查询和表连接实现
SELECT * FROM employee e, dept d WHERE e.dept_id = d.id
AND e.id
IN (SELECT id FROM employee WHERE join_date >= '2011-01-01')


SELECT *  FROM employee e
JOIN dept d on (e.dept_id = d.id)
WHERE join_date > '2011-01-01' 
