
SELECT  emp.employee_id "ID EMPLEADO", emp.first_name || ' ' || emp.last_name "NOMBRE EMPLEADO", 
        emp.manager_id "ID JEFE",  jefe.first_name || ' '  || jefe.last_name "NOMBRE JEFE"
 FROM   employees emp JOIN  employees jefe
      ON (emp.manager_id = jefe.employee_id)
ORDER BY emp.employee_id;

SELECT man.first_name || ' '  || man.last_name "NOMBRE JEFE", man.hire_date fecha_contrato_jefe,
             COUNT(emp.employee_id) "EMPLEADOS A SU CARGO"
 FROM   employees emp   JOIN  employees man
      ON (emp.manager_id = man.employee_id)
GROUP BY man.first_name, man.last_name, man.hire_date
ORDER BY "EMPLEADOS A SU CARGO" DESC, man.last_name ;

select e.first_name, e.salary, j.job_title, j.max_salary
from employees e
join jobs j
on e.salary > j.max_salary;

-- left outer join
select e.first_name, d.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;

-- right outer join
select e.first_name, d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;


-- full outer join
select NVL(e.first_name,'SIN EMPLEADOS'), nvl(TO_CHAR(d.department_id),'SIN DEPARTAMENTO')
from employees e full outer join departments d
on e.department_id = d.department_id;

-- CROSS JOIN
/*
    El CROSS Join o combinación cruzada, retorna todas las filas existentes en todas las tablas 
    que se usan en la consulta. 
    Cada fila en la primera tabla se empareja con todas las filas en la segunda tabla. 
    Esto sucede cuando no hay relación definida entre las dos tablas. 
*/
SELECT emp.employee_id, dep.department_id, dep.department_name 
 FROM employees emp CROSS JOIN departments dep
ORDER BY emp.employee_id;

-- join / on - Más de 1 tabla
select emp.first_name, dep.department_name, loc.street_address, loc.city, cou.country_name
from employees emp
join departments dep on emp.department_id = dep.department_id
join locations loc on dep.location_id = loc.location_id
join countries cou on loc.country_id = cou.country_id;

-- join / using - Más de 1 tabla
select emp.first_name, dep.department_name, loc.street_address, loc.city, cou.country_name
from employees emp
join departments dep using(department_id)
join locations loc using(location_id)
join countries cou using(country_id);











