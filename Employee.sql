Create Database employee_management;
Use employee_management;

Create Table Department ( dept_id int primary key AUTO_INCREMENT,
 dept_name varchar(100) not null);

Create Table Employee (emp_id int primary key AUTO_INCREMENT, 
emp_name varchar(100) not null, email varchar(100) not null unique, 
dept_id int, manager_id int, foreign key (dept_id) references Department(dept_id),
foreign key(manager_id) references Employee(emp_id));

Create Table Project (project_id int primary key AUTO_INCREMENT,
 project_name varchar(100) not null);
 
 Create Table Employee_Project ( emp_id int, project_id int,
 primary key (emp_id, project_id),
 foreign key (emp_id) references Employee(emp_id),
 foreign key (project_id) references Project(project_id));
 
 
Create Table Salary ( salary_id int primary key AUTO_INCREMENT, emp_id int,
amount decimal(10,2), foreign key (emp_id) references Employee(emp_id));

Insert into Department (dept_name)
values ('IT'), ('HR'), ('Finance');

Insert into Employee (emp_name, email, dept_id, manager_id)
values
('Amit', 'amit@gmail.com', 1,1),
('Riya', 'riya@gmail.com', 1, 1),
('Karan', 'karan@gmail.com', 1, 1),
('Sneha', 'sneha@gmail.com', 2, NULL),
('Rahul', 'rahul@gmail.com', 2, 4);

Insert into Project (project_name)
values ('Website'), ('Mobile App'), ('ERP system');

Insert into Employee_Project Values
(2,1),
(2,2),
(3,1),
(3,3),
(5,2);

INSERT INTO Salary (emp_id, amount)
VALUES
(1,90000),
(2,60000),
(3,65000),
(4,70000),
(5,50000);

SELECT e.emp_name, COUNT(ep.project_id) AS total_projects
FROM Employee e
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id
HAVING COUNT(ep.project_id) > 1;

SELECT d.dept_name, SUM(s.amount) AS total_salary
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
JOIN Salary s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

Select m.emp_name as Manager, 
e.emp_name as Subordinate
from Employee e 
join Employee m on e.manager_id = m.emp_id;

WITH RECURSIVE EmployeeHierarchy AS (
    
    -- Top level managers (no manager)
    SELECT emp_id, emp_name, manager_id
    FROM Employee
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Subordinates
    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM Employee e
    INNER JOIN EmployeeHierarchy eh 
        ON e.manager_id = eh.emp_id
)

SELECT * FROM EmployeeHierarchy;

show tables;

Select * from Employee;