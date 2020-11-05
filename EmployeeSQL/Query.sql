--List the following details of each employee: employee number, last name, first name, sex, and salary.

--Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, e.sex, sal.salary

--Define employees as e
FROM employees AS e

-- Define salaries as sal and join on emp_no
	LEFT JOIN 
	salaries as sal
	ON e.emp_no = sal.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

--Select columns to display from employees table
SELECT first_name, last_name, hire_date
FROM employees

--Filter results for hire dates only in 1986
	WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name.

--Select columns to display
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name

--Define dept_manager as dm
FROM dept_manager AS dm

--Join departments and dept_manager on dept_no
	INNER JOIN departments AS d
		ON dm.dept_no = d.dept_no
		
--Join departments and dept_manager on dept_no
	INNER JOIN employees AS e
		ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

--Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name

--Define employees as e
FROM employees AS e

--Join departments and dept_manager on dept_no and join dept_emp and employees on emp_no
	INNER JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	INNER JOIN departments AS d
		ON d.dept_no = de.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

--Select columns to display
SELECT e.first_name, e.last_name, e.sex

--Define employees as e and filter first name and B last names
FROM employees AS e
	WHERE e.first_name = 'Hercules'
		AND e.last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

--Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name

--Define employees as e
FROM employees AS e

--Join dept_emp and employees on emp_no and join dept_emp and departments on dept_no
	INNER JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	INNER JOIN departments AS d
		ON de.dept_no = d.dept_no
--Filter for Sales department
WHERE d.dept_name = 'Sales';
		

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department 
--name.

--Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name

--Define employees as e
FROM employees AS e

--Join dept_emp and employees on emp_no and then dept_emp and dapartments on dept_no
	INNER JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	INNER JOIN departments AS d
		ON de.dept_no = d.dept_no
		
--Filter results through Sales and Development
WHERE d.dept_name IN ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--Select columns to display and create count function for frequency of last name
SELECT e.last_name,
	COUNT(*) AS "Frequency of last name"

--Define employees as e and group by last name and order by occurance
FROM employees AS e
	GROUP BY last_name
	ORDER BY "Frequency of last name" DESC;

--Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work.
--On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID 
--number is 499942

--Select employees and look for emp_no 499942
SELECT * FROM employees
	WHERE emp_no = 499942;

-- I noticed that my first name, last name, and hire date were incorrectly inputted as Aprils Fools Day, funny joke
-- Updated employee info to my actual name and set hire date to today, a return joke to my boss
UPDATE employees
SET (last_name, first_name, hire_date) = ('Field', 'Lydia', '2020-11-04')
WHERE emp_no = 499942;

-- Select columns to display after info has  been updated
SELECT e.emp_no, e.last_name, e.first_name, e.hire_date, d.dept_name
-- Select employees table as the first table to prepare for later joining
FROM employees AS e
	-- Join dept_emp table with employees on emp_no to link to the employee number with the department name
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		-- Then join departments table to dept_emp to have department name
		JOIN departments AS d
		ON de.dept_no = d.dept_no
-- Apply condition to only employee #499942
WHERE e.emp_no = 499942;
