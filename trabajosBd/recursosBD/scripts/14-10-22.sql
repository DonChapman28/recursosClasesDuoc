SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000;

SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 100;

-- UNION
-- Retorna las filas de ambas consultas despu�s de eliminar las filas duplicadas
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    UNION
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    UNION
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90
    UNION
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 100;


-- UNION ALL
-- Retorna las filas de ambas consultas, incluidas todas las filas duplicadas
SELECT distinct employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    UNION ALL
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90
    UNION ALL
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 100;

-- INTERSECT
-- Retornas todas las filas que se repiten en ambas consultas
SELECT distinct employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    INTERSECT
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90
    INTERSECT
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 100;

-- MINUS
-- Permite obtener todas las filas de la primera consulta 
-- que no se encuentran en la segunda consulta
SELECT distinct employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    MINUS
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90;

SELECT distinct employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 12000
    MINUS
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 90
    MINUS
SELECT employee_id, first_name, last_name, salary, department_id 
FROM employees
WHERE department_id = 100;

SELECT employee_id
 FROM employees
where salary > 10000
    MINUS
SELECT employee_id
 FROM job_history
    INTERSECT 
SELECT employee_id
 FROM employees
 WHERE salary >= (SELECT MAX(salary) FROM employees);


SELECT employee_id, job_id, salary
FROM   employees
    UNION
SELECT employee_id, job_id, 0
FROM   job_history
ORDER BY employee_id DESC;

SELECT e.employee_id, e.salary
 FROM employees e
    MINUS
SELECT employee_id, 5200 as sueldo
 FROM job_history emp
ORDER BY sueldo;


SELECT e.employee_id, e.salary as salary
 FROM employees e
    MINUS
SELECT employee_id, 5200 as salary
 FROM job_history emp
ORDER BY 2 DESC;















