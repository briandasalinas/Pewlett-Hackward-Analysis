select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_data, ti.to_data
INTO retirement_info
FROM employees as e
JOIN INTO titles as ti
ON e.emp_no = ti.emp_no
WHEN (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

select * from retirement_titles

--Used 1991 instead of 9999 because the csv did not have that year
Select distinct (emp_no), first_name, last_name, title 
INTO unique_titles
FROM retirement_titles
WHERE to_date = '1999-01-01'
ORDER BY emp_no ASC
;

select count(title), title 
into retiring_tiles
from unique_titles
group by title
order by count(title) desc;

select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as e
inner join dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1/1/65' AND '12/31/65')
ORDER BY e.emp_no asc