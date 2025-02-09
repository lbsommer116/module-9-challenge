-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex,
	(SELECT salary FROM "Salaries" s WHERE s.emp_no = e.emp_no) AS salary
FROM "Employees" e;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_no, 
	(SELECT "Departments".dept_name FROM "Departments" WHERE "Departments".dept_no = "Department_Manager".dept_no) AS Department_Name,
	emp_no,
	(SELECT "Employees".first_name FROM "Employees" WHERE "Employees".emp_no = "Department_Manager".emp_no) AS First_Name,
	(SELECT "Employees".last_name FROM "Employees" WHERE "Employees".emp_no = "Department_Manager".emp_no) AS Last_Name
FROM "Department_Manager";

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT emp_no, 
	(SELECT "Employees".first_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS First_Name,
	(SELECT "Employees".last_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS Last_Name,
	dept_no,
	(SELECT "Departments".dept_name FROM "Departments" WHERE "Departments".dept_no = "Department_Employee".dept_no) AS Department_Name
FROM "Department_Employee";
	
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, 
	(SELECT "Employees".first_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS First_Name,
	(SELECT "Employees".last_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS Last_Name,
	dept_no,
	(SELECT "Departments".dept_name FROM "Departments" WHERE "Departments".dept_no = "Department_Employee".dept_no) AS Department_Name
FROM "Department_Employee"
WHERE dept_no = 'd007';
	
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, 
	(SELECT "Employees".first_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS First_Name,
	(SELECT "Employees".last_name FROM "Employees" WHERE "Employees".emp_no = "Department_Employee".emp_no) AS Last_Name,
	dept_no,
	(SELECT "Departments".dept_name FROM "Departments" WHERE "Departments".dept_no = "Department_Employee".dept_no) AS Department_Name
FROM "Department_Employee"
WHERE dept_no = 'd007' OR dept_no = 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM "Employees"
GROUP BY last_name
ORDER BY "Last Name Count" DESC;


