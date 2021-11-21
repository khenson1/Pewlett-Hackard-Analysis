--Sample code given 
--Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

--Deliverable 1
--Retirement Titles table
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO Retirement_titles
from employees as e
inner join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO Unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--Retrieve the # of employees by their most recent job title
SELECT count(ut.title),
ut.title
into Retiring_titles
from unique_titles as ut
group by ut.title
order by count(ut.title) desc;


--Deliverable 2
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
	);
--Creating a Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
into Mentorship_Eligibility
from employees as e
inner join dept_emp as de 
on e.emp_no = de.emp_no
inner join titles as ti 
on e.emp_no = ti.emp_no
where e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by e.emp_no
