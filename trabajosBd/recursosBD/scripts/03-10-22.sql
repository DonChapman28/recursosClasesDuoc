-- Determinar salario de Abel
select salary from employees where last_name = 'Abel';

-- Determinar empleados(as) con salarios mayores que el de Abel
select * 
from employees 
where salary > 11000;

select * 
from employees 
where salary > (select salary from employees where last_name = 'Abel');


-- Determinar el salario máximo
select max(salary) from employees;
select * from employees where salary = 24000;

update employees set salary = 24000 where employee_id = 101;
rollback;

select *
from employees
where salary = (select max(salary) from employees);

-- Determinar salarios del depto 30
select department_id, salary from employees where department_id = 30;

-- Determinar los salarios de empleados(as) que trabajan en el depto 30
-- in
select * 
from employees
where salary in (select salary from employees where department_id = 30);

-- any
select * 
from employees
where salary > any (select salary from employees where department_id = 30);

-- all
select * 
from employees
where salary > all (select salary from employees where department_id = 30);

select * 
from employees
where salary > any (15000,16000,17000,18000);

select * 
from employees
where salary > all (15000,16000,17000,18000);

-- exists
select * 
from employees
where exists (select 'hola' from dual);

select *
from employees emp
where exists (select * from departments dep where emp.department_id = dep.department_id);

select *
from employees
where exists (select * from jobs);

-- Subconsultas en otras zonas
select j.job_title from (select * from jobs) j;
select job_title from jobs;


create table employees_copia
    as select * from employees;
    
create table depto_80
    as select * from employees where department_id = 80;

select * from depto_80;




















