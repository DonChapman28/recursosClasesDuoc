-- Especificiacion 
create or replace package PKG_OPERACIONES is
 v_n1 number(10);
 v_n2 number(10);

    function FN_SUMAR(p_n1 number, p_n2 number) return number;
    function FN_RESTAR(p_n1 number, p_n2 number) return number;
    function FN_MULTIPLICAR(p_n1 number, p_n2 number) return number;
    function FN_DIVIDIR(p_n1 number, p_n2 number) return number;
    function FN_POTENCIA(p_n1 number, p_n2 number) return number;
    procedure sp_aritmetica(p_n1 number, p_n2 number);
    
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
    
    procedure sp_aritmetica (p_n1 number, p_n2 number) is
    begin
        dbms_output.put_line('SUMA '||fn_sumar(p_n1,p_n2));
        dbms_output.put_line('RESTA '||fn_restar(p_n1,p_n2));
        dbms_output.put_line('MULTIPLICACION '||fn_multiplicar(p_n1,p_n2));
        dbms_output.put_line('DIVISION '||fn_dividir(p_n1,p_n2));
        dbms_output.put_line('POTENCIA '||fn_potencia(p_n1,p_n2));
    end;
end;

--LLAMAR PACKAGE
declare
    v_resultado number;
begin
    pkg_operaciones.sp_aritmetica(2,2);
end;