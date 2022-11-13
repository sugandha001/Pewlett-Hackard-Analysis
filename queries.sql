CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE dept_employee (
    emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- Mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employee as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;






SELECT 
	e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees e
JOIN titles t
USING (emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;




SELECT DISTINCT ON (r.emp_no)
    r.emp_no,
    r.first_name,
    r.last_name,
    r.title
INTO unique_titles
FROM retirement_titles r 
AND (retirement_titles.to_date = '9999-01-01');

SELECT * FROM retirement_titles
ORDER BY to_date DESC;

 
 
 SELECT DISTINCT ON (r.emp_no)
    r.emp_no,
    r.first_name,
    r.last_name,
    r.title
 INTO unique_titles
 FROM retirement_titles r 
 WHERE r.to_date = ('9999-01-01')
 ORDER BY emp_no ASC, to_date DESC;
 
 SELECT * FROM unique_titles


 SELECT title, COUNT(*)
 FROM unique_titles
 INTO retiring_titles
 GROUP BY coun DESC;
 
 
SELECT COUNT(title),title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles