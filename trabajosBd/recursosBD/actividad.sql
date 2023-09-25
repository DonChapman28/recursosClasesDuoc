---1
create or replace function fn_get_nombre_jefe(p_employee_id in employees.employee_id%type) 
  return varchar2 is
  v_nombre_jefe employees.first_name%type;
  v_apellido_jefe employees.last_name%type;
begin
  select e.first_name, e.last_name
  into v_nombre_jefe, v_apellido_jefe
  from employees e
  where e.employee_id = (select manager_id from employees where employee_id = p_employee_id);
  
  return v_nombre_jefe || ' ' || v_apellido_jefe;
exception
  when no_data_found then
    return 'NO TIENE';
end;

---2
create or replace function fn_get_nombre_depto(p_employee_id in employees.employee_id%type) 
  return varchar2 is
  v_nombre_depto departments.department_name%type;
begin
  select d.department_name
  into v_nombre_depto
  from departments d
  where d.department_id = p_employee_id;
  
  return v_nombre_depto;
exception
  when no_data_found then
    return'NO TIENE';
end;

---3
create or replace function fn_recibe_premio(p_hire_date in employees.hire_date%type) 
  return varchar2 is
  v_recibe_premio varchar2(2);
begin
  if months_between(sysdate, p_hire_date)/12 >= 18 then
    v_recibe_premio := 'si';
  else
    v_recibe_premio := 'no';
  end if;
  
  return v_recibe_premio;
end;

---4
create or replace function fn_get_pais(p_department_id in departments.department_id%type) 
  return varchar2 is
  v_nombre_pais countries.country_name%type;
  
begin
  select cou.country_name 
    into v_nombre_pais
    from departments dep
    join locations loc on loc.location_id = dep.location_id
    join countries cou on cou.country_id = loc.country_id
  
  where dep.department_id = p_department_id;
  
  return v_nombre_pais;
exception
  when no_data_found then
    
    return 'NO TIENE';
end;

---5
create or replace function fn_get_total(p_department_id in departments.department_id%type) 
  return varchar2 is
  v_total_emp number(3);
begin
  select count(*) 
  into v_total_emp
  from employees
 where department_id = p_department_id;
  
 return v_total_emp;
exception
  when no_data_found then
    return 'NO TIENE';
end;

---6
create or replace function fn_get_salario(p_department_id in departments.department_id%type) 
  return varchar2 is
  v_salario employees.salary%type;
begin
  select trunc(avg(salary)) 
  into v_salario
  from employees
  where department_id = p_department_id;
  
  
 return v_salario;
exception
  when no_data_found then
    return 'NO TIENE';
end;

-------PROCEDIMIENTO

create or replace procedure sp_get_empleados is
  v_nombre_jefe varchar2(100);
  v_departamento_jefe varchar2(100);
  v_recibe_premio varchar2(50);
  v_pais varchar2(50);
  v_total number(3);
  v_promedio number(20);
begin
  for emp in (select first_name || ' ' || last_name as empleado,
                     fn_get_nombre_jefe(employee_id) as jefe,
                     fn_get_nombre_depto(employee_id) as departamento,
                     fn_recibe_premio(hire_date) as premio,
                     fn_get_pais(department_id) as pais,
                     fn_get_total(department_id) as total,
                     fn_get_salario(department_id) as promedio
              from employees)
  loop
    v_nombre_jefe := emp.jefe;
    v_departamento_jefe := emp.departamento;
    v_pais := emp.pais;
    v_total := emp.total;
    v_promedio := emp.promedio;
    v_recibe_premio := case emp.premio
                         when 'si' then '*** RECIBE PREMIO ***'
                         
                         
                         else '*** NO RECIBE PREMIO ***'
                       end;
    
    
    dbms_output.put_line('EMPLPEADO: '||emp.empleado);
    dbms_output.put_line('JEFE(a): '||v_nombre_jefe);
    dbms_output.put_line('DEPARTAMENTO: '||v_departamento_jefe);
    dbms_output.put_line('PREMIO: '||v_recibe_premio);
    dbms_output.put_line('PAIS DEL DEPARTAMENTO: '||v_pais);
    dbms_output.put_line('TOTAL EMPLEADOS: '||v_total);
    dbms_output.put_line('SALARIO PROMEDIO: '||v_promedio);
    dbms_output.put_line('-----------------------------------------------------------------------');
  end loop;
end;


begin
  sp_get_empleados;
end;