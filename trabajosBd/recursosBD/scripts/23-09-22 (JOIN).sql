-- JOIN / ON
select employees.first_name,
        employees.last_name,
        departments.department_name
from employees
join departments
on employees.department_id = departments.department_id;

select e.first_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e
join jobs j
on e.job_id = j.job_id;

-- JOIN / USING
select emp.first_name,
        emp.last_name,
        dep.department_name
from employees emp
join departments dep
using(department_id);
-- on emp.department_id = dep.department_id;

select e.first_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e
join jobs j
using(job_id);
-- on e.job_id = j.job_id;

-- NATURAL JOIN
select emp.first_name, dep.department_name
from employees emp
natural join departments dep;

-- select count(*) from employees;

select emp.first_name,
        emp.last_name,
        dep.department_name
from employees emp
join departments dep
using(department_id)
where department_id in(10,20,60,100);
-- where dep.department_name in('Administration','Marketing','IT','Finance');

select  emp.employee_id,
        emp.first_name,
        emp.last_name,
        dep.department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_id in(10,20,60,100)
and emp.employee_id > 150;









