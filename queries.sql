-- 1.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no=s.emp_no;

-- 2.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date=year(1986));

--3.
SELECT  d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM departments AS d
JOIN dept_manager as dm
ON d.dept_no=dm.dept_no
JOIN employees as e
ON dm.emp_no=e.emp_no;


--4.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no=de.emp_no
JOIN departments as d
on de.dept_no=d.dept_no;


--5.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';


--6.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no=de.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';


--7.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no=de.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--8.
SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;











