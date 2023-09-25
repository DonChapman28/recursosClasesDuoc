select min(salary),max(salary), avg(salary), sum(salary), 
        min(first_name), max(first_name), 
        min(hire_date), max(hire_date),
        count(salary)
from employees;

/*
    COUNT(*): retorna el número de filas que satisfacen el criterio 
    de la sentencia SELECT incluyendo filas duplicadas y filas que contengan 
    valores Nulos en cualquiera de sus columnas. 
    
    COUNT(columna|expresión): retorna el número de filas que poseen 
    valores NO Nulos en la columnade la tabla  o expresión.
*/

select count(*), count(commission_pct)
from employees;

select count(distinct department_id)
from employees;

select avg(commission_pct),
        avg(nvl(commission_pct,0))
from employees;

select department_id, 
        round(avg(salary)) as promedio, 
        sum(salary),
        min(salary),
        max(salary),
        count(salary)
from employees
group by department_id
order by promedio desc;






