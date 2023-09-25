-- Especificiacion 
create or replace package PKG_UTILIDADES is
 v_n1 number(10);
 v_n2 number(10);
 
    function FN_DOBLE_DE_UN_NUMERO(P_NUM number) return number;
    procedure SP_SALUDAR_CON_NOMBRE(P_NOMBRE VARCHAR2);
    function FN_CALCULAR(p_n1 number, p_n2 number) return number;
end;
--para llamar las funciones y procedimientos debo declararlas en el package principal y luego crearlas en el package body.



--CUERPO 
create or replace package body PKG_UTILIDADES is
    function FN_DOBLE_DE_UN_NUMERO(P_NUM number)return number is
    begin
        return P_NUM * 2;
    end;
    
    procedure SP_SALUDAR_CON_NOMBRE(P_NOMBRE varchar2) is 
    begin
        dbms_output.put_line('HOLA '||P_NOMBRE);
    end;
    
    FUNCTiON FN_CALCULAR(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 + v_n2;
    end;
end;


--LLAMANDO LOS PACKAGE
declare
    v_resultado number;
begin
    pkg_utilidades.sp_saludar_con_nombre('lucho');
    v_resultado := pkg_utilidades.fn_doble_de_un_numero(5);
    dbms_output.put_line('EL DOBLE DE 5 ES: '||v_resultado);
    pkg_utilidades.v_n1 := 2;
    pkg_utilidades.v_n2 := 5;
    
    
    --suma de variables
    v_resultado := pkg_utilidades.v_n1 + pkg_utilidades.v_n2;
    dbms_output.put_line('RESULTADO SUMA DE VARIABLES : '||v_resultado);
    
    --otro ejemplo del uso de variables en la funcion
     v_resultado := pkg_utilidades.fn_calcular(3,4);
    dbms_output.put_line('El resultado es: '||v_resultado);
end;

    -- obtener el salario * 2 con esquema hr
select  first_name,
        salary,
        PKG_UTILIDADES.FN_DOBLE_DE_UN_NUMERO(salary) 
from employees
    

function FN_POTENCIA(p_n1 number, p_n2 number) return number;
    FUNCTiON FN_POTENCIA(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 + v_n2;
    end;



----------------------
actividad

-- Especificiacion 
create or replace package PKG_OPERACIONES is
 v_n1 number(10);
 v_n2 number(10);
 

    function FN_SUMAR(p_n1 number, p_n2 number) return number;
    function FN_RESTAR(p_n1 number, p_n2 number) return number;
    function FN_MULTIPLICAR(p_n1 number, p_n2 number) return number;
    function FN_DIVIDIR(p_n1 number, p_n2 number) return number;
    function FN_POTENCIA(p_n1 number, p_n2 number) return number;
    
    procedure sp_operaciones(p_n1 number, p_n2 number);
    
end;

--CUERPO 
create or replace package body PKG_OPERACIONES is
    
     
    
    
    
    
    FUNCTiON FN_SUMAR(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 + v_n2;
    end;
    
    FUNCTiON FN_RESTAR(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 - v_n2;
    end;
    
    FUNCTiON FN_MULTIPLICAR(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 * v_n2;
    end;
    
    FUNCTiON FN_DIVIDIR(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 / v_n2;
    end;
    
    FUNCTiON FN_POTENCIA(p_n1 number, p_n2 number) return number is
    begin
        v_n1 := p_n1;
        v_n2 := p_n2;
        return v_n1 ** v_n2;
    end;
    
    procedure SP_SALUDAR_CON_NOMBRE(P_NOMBRE varchar2) is 
    begin
        dbms_output.put_line('HOLA '||P_NOMBRE);
    end;
    
    
end;


--------
declare
    v_resultado number;
begin
    
    v_resultado := pkg_operaciones.fn_sumar(5,5);
    dbms_output.put_line('EL valor de la suma: '||v_resultado);
    v_resultado := pkg_operaciones.fn_restar(5,5);
    dbms_output.put_line('EL valor de la resta: '||v_resultado);
    v_resultado := pkg_operaciones.fn_multiplicar(5,5);
    dbms_output.put_line('EL valor de la multiplicacion: '||v_resultado);
    v_resultado := pkg_operaciones.fn_dividir(5,5);
    dbms_output.put_line('EL valor de la division: '||v_resultado);
    v_resultado := pkg_operaciones.fn_potencia(5,5);
    dbms_output.put_line('EL valor de la potencia: '||v_resultado);
    
    
    
    
    
    
end;