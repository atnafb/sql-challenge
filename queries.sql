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
