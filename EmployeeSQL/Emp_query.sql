--Details of employee
select 
	a.emp_no, 
	a.first_name,
	a.last_name,
	a.gender,
	b.salary
from employees a
inner join salaries b on a.emp_no=b.emp_no;

--Employees hired in 1986
select * from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date desc;

--manager by department
select 
	a.dept_no,
	b.dept_name,
	a.emp_no,
	c.first_name,
	c.last_name,
	d.from_date as employment_start_date,
	d.to_date as employment_end_date	
from dept_manager a
left join departments b on a.dept_no=b.dept_no
left join employees c on a.emp_no=c.emp_no
left join dept_emp d on a.emp_no=d.emp_no;

--Department of each employee
select 
	a.emp_no,
	a.first_name,
	a.last_name,
	c.dept_name
from employees a 
left join dept_emp b on a.emp_no=b.emp_no
left join departments c on b.dept_no=c.dept_no
order by emp_no; 
 
--Employees first name and last names
select * from employees
where first_name = 'Hercules' and last_name like 'B%'

--List employees
select 
	a.emp_no,
	a.first_name,
	a.last_name,
	c.dept_name
from employees a 
left join dept_emp b on a.emp_no=b.emp_no
left join departments c on b.dept_no=c.dept_no
where dept_name='Sales'
order by emp_no;

--List employees in the Sales departments
select 
	a.emp_no,
	a.first_name,
	a.last_name,
	c.dept_name
from employees a 
left join dept_emp b on a.emp_no=b.emp_no
left join departments c on b.dept_no=c.dept_no
where c.dept_name='Sales' or c.dept_name='Development'
order by emp_no;

--Frequency of employee last name
select last_name, count(last_name)
from employees
group by last_name
order by last_name desc;
