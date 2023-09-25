-- UPDATE

-- UPDATE cuentas SET saldo = 0;

-- UPDATE cuentas SET saldo = 0
-- WHERE rut = "1212122";

-- UPDATE cuentas SET saldo = 0
-- WHERE rut = "1212122"
-- AND tipo_cuenta = 2;

update employees set email = 'D.GRANT' where employee_id = 199;
update employees set first_name = 'Diego', last_name = 'Rojas';

rollback;

-- update employees set department_id = 9563 where employee_id = 199;
-- update employees set salary = sysdate where employee_id = 199;

-- DELETE
select * from countries;

-- delete from cuentas;
delete from countries where country_id = 'FR';
delete from countries where country_id = 'AU';

desc countries;
select * from employees;
select * from LOCATIONS;

rollback;

create table paises
    as select * from countries;

select * from paises;
delete from paises where country_id = 'JP';

-- commit;
-- alter session disable parallel dml;

-- TRUNCATE
truncate table paises;

insert into paises
    select * from countries;






