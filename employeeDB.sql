DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

--create tables in the following order:
--Titles
--Employees
--Departments
--Dept_Manager
--Dept_Emp
--Salaries

CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

CREATE TABLE employees
(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR, 
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments
(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE dept_manager
(
	dept_no VARCHAR, FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT, FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp
(
	emp_no INT, FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR, FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)	
);

CREATE TABLE salaries
(
	emp_no INT PRIMARY KEY, 
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--List the following details of each employee: employee number, last name, first name, sex, and salary.


--List first name, last name, and hire date for employees who were hired in 1986.


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


--List the department of each employee with the following information: employee number, last name, first name, and department name.


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--SELECT * FROM employees;
--SELECT first_name, last_name, sex FROM employees 
--WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.