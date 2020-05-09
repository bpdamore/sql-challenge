-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT e.emp_no
	,e.last_name
	,e.first_name
	,e.gender
	,s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT dm.dept_no
	,d.dept_name
	,dm.emp_no
	,e.last_name
	,e.first_name
	,dm.from_date
	,dm.to_date
FROM employees AS e
JOIN department_manager as dm
ON dm.emp_no = e.emp_no
JOIN department as d
ON dm.dept_no = d.dept_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name 
FROM employees AS e
JOIN department_employee AS de
ON e.emp_no = de.emp_no
JOIN department AS d
ON de.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department d007, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no
	,de.dept_no 
	,d.dept_name
	,e.first_name
	,e.last_name 
FROM employees AS e
JOIN department_employee AS de
ON e.emp_no = de.emp_no
JOIN department AS d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007',

-- List all employees in the Sales (d007) and Development (d005) departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no
	,de.dept_no 
	,d.dept_name
	,e.first_name
	,e.last_name 
FROM employees AS e
JOIN department_employee AS de
ON e.emp_no = de.emp_no
JOIN department AS d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007'
OR d.dept_no = 'd005';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT 
	last_name
	,COUNT(*) AS name_count
FROM employees 
GROUP BY last_name
ORDER BY name_count DESC;