
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments(
          dept_no CHAR(10) PRIMARY KEY NOT NULL,
          dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE titles(
            title_id CHAR(10) PRIMARY KEY,
            title VARCHAR(20)
); 

CREATE TABLE employees(
            emp_no INT PRIMARY KEY,
            emp_title_id CHAR(10),
            birth_date DATE,
            first_name VARCHAR(20),
            last_name VARCHAR(20),
            sex CHAR,
            hire_date DATE
            FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);
CREATE TABLE dept_emp(
            emp_no INT REFERENCES employees(emp_no),
            dept_no CHAR(10) REFERENCES departments(dept_no),
            PRIMARY KEY(emp_no, dept_no)
            
);

CREATE TABLE dept_manager(
            dept_no CHAR(10) REFERENCES departments(dept_no),
            emp_no INT  REFERENCES employees(emp_no)
);


CREATE TABLE salaries(
            emp_no INT REFERENCES employees(emp_no),
            salary INT
);



