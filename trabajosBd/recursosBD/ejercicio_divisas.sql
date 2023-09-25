/*
    Construir una rutina que permita convertir el salario de cada empleado 
    en las siguientes divisas:

    .Dólar a Peso chileno -> 802,50
    .Dólar a Euro -> 0,91
    .Dólar a Libra esterlina -> 0,80

    -El valor de cada divisa debe ser ingresado por el usuario y almacenado en un array.
    -Cada elemento del array debe ser utilizado para hacer los cálculos de conversión.
*/
declare
    TYPE type_arr_divisas IS VARRAY(3) OF VARCHAR2(20);
    v_arr_divisas type_arr_divisas;    
begin
    v_arr_divisas := type_arr_divisas(802.50,0.91,0.80);
    dbms_output.put_line(to_char(v_arr_divisas(1)*1000,'$999G999G999'));
end;

































