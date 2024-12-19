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





