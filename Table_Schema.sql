-- TITLES TABLE

DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
title_id VARCHAR(20) PRIMARY KEY, 
title VARCHAR(25) NOT NULL
);

-- EMPLOYEES TABLE
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR(20) NOT NULL REFERENCES titles(title_id), -- Foreign Key that references the title_id from titles table
birth_date VARCHAR(20), 
first_name VARCHAR(30) NOT NULL, -- when I define the number of number for VARCHAR, I used reasonable a maximum 
								  -- length data integrity, storage enhancement and validation
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(1) NOT NULL CONSTRAINT check_sex CHECK (sex IN ('M', 'F')), -- I used CHECK constraint to make only M and F are allowed
hire_date DATE NOT NULL
);

-- DEPARTMENT TABLE 
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
dept_no VARCHAR (20) PRIMARY KEY, 
dept_name VARCHAR (30) NOT NULL
)

-- DEPT MANAGER TABLE
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
dept_no VARCHAR(20) NOT NULL REFERENCES departments(dept_no),
emp_no INT NOT NULL REFERENCES employees(emp_no),
/* We can also define FOREIGN KEY constraints directly within the column definition:
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
*/
-- Create a composite key to ensure the uniqueness of the combination of dept_no and emp_no
PRIMARY KEY (dept_no, emp_no)  
);

-- CREATING dep_emp 
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
emp_no INT REFERENCES employees(emp_no),
dept_no VARCHAR(20) NOT NULL REFERENCES departments(dept_no), 
PRIMARY KEY (emp_no, dept_no)  
);

-- SALARIES TABLE
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
emp_no INT PRIMARY KEY, 
salary INT,
-- Foreign key that references emp_no in employees table
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- LIST OF TABLES 
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;

----- DATA ANALYSIS ----

-- (1) List of employees along with employee number, last name, first name, and salary 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees AS e 
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- (2) List of employees who were hired in 1986, along with their first name and last name
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- (3) List of department managers along with employee number, last name, first name and department name 

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM dept_manager AS dm
INNER JOIN departments AS d ON d.dept_no = dm.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no;

-- (4) List of each employee's department number along with their department number, dept name, 
--     employee number, last name first name 
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- (5) List of First Name, Last Name and Sex of each employee whose first name Hercules and whose last name begins with B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- (6) List of employees in the Sales department along with employee number, last name and first name 

SELECT dept_emp.emp_no, e.last_name, e.first_name
FROM dept_emp
INNER JOIN departments AS de ON dept_emp.dept_no = de.dept_no
INNER JOIN employees AS e ON dept_emp.emp_no = e.emp_no
WHERE de.dept_name = 'Sales';


-- (7) List of employees in the Sales and Development department along with employee number, last name and first name 

SELECT dept_emp.emp_no, e.last_name, e.first_name, de.dept_name 
FROM dept_emp
INNER JOIN departments AS de ON dept_emp.dept_no = de.dept_no
INNER JOIN employees AS e ON dept_emp.emp_no = e.emp_no
WHERE de.dept_name IN ('Sales', 'Development');


-- (8) Frequency count of employees sharing the same last name 

SELECT last_name, COUNT(*) AS num_employees
FROM employees
GROUP BY last_name
ORDER BY num_employees DESC;



