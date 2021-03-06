--Retirement Titles table
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	e.gender,
	ti.title,
	ti.from_date,
	ti.to_date
INTO Retirement_titles
from employees as e
inner join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
