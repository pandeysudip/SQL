
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;



CREATE TABLE departments(
          dept_no INT PRIMARY KEY NOT NULL,
          dept_name VARCHAR(50) NOT NULL
)


CREATE TABLE dept_emp(
            emp_no INT PRIMARY KEY NOT NULL,
            dept_no INT REFERENCES departments(dept_no)
)


CREATE TABLE dept_manager(
            dept_no INT REFERENCES departments(dept_no),
            emp_no INT REFERENCES dept_emp(emp_no)
)


CREATE TABLE employees(
            emp_no INT REFERENCES dept_emp(emp_no),
            emp_title_id INT NOT NULL,
            birth_date DATE,
            first_name VARCHAR(20),
            last_name VARCHAR(20),
            sex CHAR,
            hire_date DATE
)

CREATE TABLE salaries(
            emp_no INT REFERENCES employees(emp_no),
            salary DEC
)


CREATE TABLE titles(
            title_id INT REFERENCES employees(emp_title_id),
            title VARCHAR(20)
)
