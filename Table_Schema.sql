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
first_name VARCHAR(30) NOT NULL, -- when I define the number of number for VactersR, I used reasonable a maximum 
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
dept_no VARCHAR(20) NOT NULL,
emp_no VARCHAR(20) NOT NULL,
emp_no REFERENCES employees(emp_no), 
dept_no REFERENCES departments(dept_no)
)