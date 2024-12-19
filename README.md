# Pewlett Hackard Employee Analysis  

## Project Overview  
This repository contains the research project for data engineering and analysis of Pewlett Hackard's employee data. The focus is on employees hired during the 1980s and 1990s. This project involved creating six tables from CSV files to address various research questions about the employees. The project incorporates **data modeling**, **data engineering**, and **data analysis**.  

---

## Project Components  

### 1. **Data Modeling**  
For data modeling, two tools were used to design the database schema:  
- **QuickDBD**: A platform for instant database schema design.  
- **pgAdmin Built-in Data Modeling Tools**: A built-in feature of pgAdmin for creating data models.  

Both diagrams have been saved as image files and are included in this repository for reference.

---

### 2. **Data Engineering**  
This part focused on creating the database schema and populating it with data from CSV files:  
- A table schema was created for six CSV files containing employee and department information for Pewlett Hackard.  
- Data types were defined for each table, including primary keys, foreign keys, and constraints.  
- The CSV files were loaded into the database tables.  

---

### 3. **Data Analysis**  
The data analysis aimed to answer the following eight research questions:  
1. List the employee number, last name, first name, sex, and salary of each employee.  
2. List the first name, last name, and hire date of employees hired in 1986.  
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.  
4. List the department number for each employee along with their employee number, last name, first name, and department name.  
5. List the first name, last name, and sex of employees whose first name is "Hercules" and whose last name starts with the letter "B."  
6. List each employee in the Sales department, including their employee number, last name, and first name.  
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.  
8. Provide frequency counts, in descending order, of all employee last names (i.e., how many employees share each last name).  

---

## Tools Used  
The following tools were utilized in this project:  
1. **PostgreSQL**: For creating and managing the database.  
2. **pgAdmin**: For database administration and schema design using built-in tools.  
3. **QuickDBD**: For designing the initial database schema.

---

## Repository Contents  
The repository contains the following:  
1. **ERD Diagrams**: Both QuickDBD and pgAdmin-generated diagrams (in image format).  
2. **SQL Scripts**: Scripts to create and populate tables, and queries used for data analysis.  
3. **CSV Files**: Original datasets used to populate the database.  
4. **README.md**: This documentation file.  

---

## How to Use This Repository  
1. Clone the repository.  
2. Use the provided SQL scripts to create and populate the database in PostgreSQL.  
3. Run the analysis queries in pgAdmin or any SQL editor connected to your PostgreSQL instance.  
4. Refer to the ERD diagrams for database design and relationships.  
