-- TRANSACCIONES
-- SAVEPOINT

select * from departments;

insert into departments values (280,'Ventas',null,null);
insert into departments values (290,'Compras',null,null);

savepoint svp_2_inserts;

update departments set department_name = 'Administración' where department_id = 10;
update departments set department_name = 'Finanzas' where department_id = 100;

savepoint svp_2_updates;

delete from departments where department_id = 220;

rollback to svp_2_inserts;
rollback to svp_2_updates;
commit;

rollback;

insert into departments (department_id,department_name,manager_id,location_id)
values                  (300,'Testing',null,null);

-- insertar un empleado (tabla employees)
select * from employees;
desc employees;
insert into employees
values (207,'Anita','Molina','AMOLINA','22255547',sysdate,'IT_PROG',2500,NULL,NULL,150);

/*
    INSERT ALL
    INTO tabla_1(col1,col2,col3, …) VALUES(valor1,valor2, valor3, …)
    INTO tabla_2(col1,col2,col3, …) VALUES(valor4,valor5, valor6, …)
    INTO tabla_3(col1,col2,col3, …) VALUES(valor7,valor8, valor9, …)
    Subconsulta;

*/

create table tabla1(codigo number,nombre varchar2(30));
create table tabla2(codigo number,nombre varchar2(30));

insert all
    into tabla1 (codigo,nombre) values (employee_id,first_name)
    into tabla2 (codigo,nombre) values (employee_id,first_name)
select employee_id, first_name from employees;

select * from tabla1;
select * from tabla2;


CREATE TABLE TABLA_PRUEBA1
(ID_AUTO NUMBER(10) GENERATED ALWAYS AS IDENTITY 
MINVALUE 1
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1 
START WITH 1,
NOMBRE_DEPTO VARCHAR2(30) NOT NULL,
TOTAL_EMPLEADOS NUMBER(4));

SELECT * FROM TABLA_PRUEBA1;

insert into TABLA_PRUEBA1 (NOMBRE_DEPTO,TOTAL_EMPLEADOS)
values ('TESTING',20);

insert into TABLA_PRUEBA1 (NOMBRE_DEPTO,TOTAL_EMPLEADOS)
values ('NOC',10);

SELECT * FROM TABLA_PRUEBA1;








