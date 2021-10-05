SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no=s.emp_no;



SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date=1986;





SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';


