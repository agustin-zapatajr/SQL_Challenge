-- Data Engineering

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW employee_data AS
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Orientation",
	s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

SELECT * FROM employee_data;

--List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW employee_hire_1986 AS
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM
	employees
WHERE
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY
	hire_date;
	
SELECT * FROM employee_hire_1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW department_manager_data AS
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	ds.dept_name AS "Department Name",
	dm.dept_no AS "Department Number"
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS ds ON ds.dept_no = dm.dept_no;

SELECT * FROM department_manager_data;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW department_employee_data AS
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	de.dept_no AS "Department Number",
	ds.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS ds ON de.dept_no = ds.dept_no;

SELECT * FROM department_employee_data;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW EmployeeName_data AS
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Orientation"
FROM employees
WHERE
	first_name = 'Hercules' AND
	last_name LIKE 'B%';
	
SELECT * FROM EmployeeName_data;

--List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW Sales_Department_employees AS
SELECT
	"First Name",
	"Last Name",
	"Employee Number",
	"Department Name"
FROM department_employee_data
WHERE 
	"Department Name" = 'Sales';
	
SELECT * FROM Sales_Department_employees;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_Development_employees AS
SELECT
	"First Name",
	"Last Name",
	"Employee Number",
	"Department Name"
FROM department_employee_data
WHERE 
	"Department Name" = 'Sales' OR 
	"Department Name" = 'Development';
	
SELECT "Department Name", count("Department Name") FROM Sales_Development_employees GROUP BY "Department Name";

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW frequency_employee_lastnames AS
SELECT
	last_name AS "Last Name",
	COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY
	"Frequency" DESC;
	
SELECT * FROM frequency_employee_lastnames;
	