---FUNCION 1
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
    return '';
end;

---FUNCION 2
create or replace function fn_get_nombre_depto(p_employee_id in employees.employee_id%type) 
  return varchar2 is
  v_nombre_depto departments.department_name%type;
begin
  select d.department_name
  into v_nombre_depto
  from departments d
  where d.department_id = (select department_id from employees where employee_id = (select manager_id from employees where employee_id = p_employee_id));
  
  return v_nombre_depto;
exception
  when no_data_found then
    return '';
end;

---FUNCION 3
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

--------------------------------

---PROCEDIMIENTO

create or replace procedure sp_get_empleados is
  v_nombre_jefe varchar2(100);
  v_departamento_jefe varchar2(100);
  v_recibe_premio varchar2(50);
begin
  for emp in (select first_name || ' ' || last_name as empleado,
                     fn_get_nombre_jefe(employee_id) as jefe,
                     fn_get_nombre_depto(employee_id) as departamento,
                     fn_recibe_premio(hire_date) as premio
              from employees)
  loop
    v_nombre_jefe := emp.jefe;
    v_departamento_jefe := emp.departamento;
    v_recibe_premio := case emp.premio
                         when 'si' then '*** RECIBE PREMIO ***'
                         else '*** NO RECIBE PREMIO ***'
                       end;
    
    dbms_output.put_line('-----------------------------------------------------------------------');
    dbms_output.put_line('Empleado');
    dbms_output.put_line(emp.empleado);
    dbms_output.put_line('Jefe(a)');
    dbms_output.put_line(v_nombre_jefe);
    dbms_output.put_line('Departamento');
    dbms_output.put_line(v_departamento_jefe);
    dbms_output.put_line(v_recibe_premio);
    dbms_output.put_line('-----------------------------------------------------------------------');
  end loop;
end;


begin
  sp_get_empleados;
end;
