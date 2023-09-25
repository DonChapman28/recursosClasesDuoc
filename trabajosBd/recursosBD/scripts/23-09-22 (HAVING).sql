SELECT  department_id,  MAX(salary)
 FROM employees
GROUP BY department_id
HAVING MAX(salary) > 8000;

SELECT department_id, MIN(salary), MAX(salary)
 FROM employees
GROUP BY department_id
HAVING MIN(salary) > 2500 AND MAX(salary) > 5000;

SELECT  ROUND(MAX(AVG(salary)))
 FROM employees
GROUP BY department_id;






