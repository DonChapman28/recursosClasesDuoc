ALTER SEQUENCE RESUMEN_CLIENTES_VENTAS_SEQ RESTART;


var b_id number(4);

DECLARE
  b_fecha NUMBER(2):= :b_id;
  
  CURSOR cur_venta IS
    SELECT id_cliente,fecha_venta
    FROM venta
    WHERE EXTRACT(MONTH FROM fecha_venta) = b_fecha;
    
  CURSOR cur_detalle IS
    SELECT cli.id_cliente AS id_cliente,
           cli.nombre_cliente AS nombre_cliente,
           EXTRACT(MONTH FROM ven.fecha_venta) AS mes,
           vd.nombres AS nombre_vendedor,
           SUM(art.precio * det.cantidad) AS total_ventas
    FROM detalleventa det
    JOIN venta ven ON ven.id_venta = det.id_venta
    JOIN cliente cli ON cli.id_cliente = ven.id_cliente
    JOIN vendedor vd ON vd.ID_VENDEDOR = ven.id_vendedor
    JOIN articulo art ON art.id_articulo = det.id_articulo
    WHERE EXTRACT(MONTH FROM ven.fecha_venta) = :b_fecha
    GROUP BY cli.id_cliente, cli.nombre_cliente, EXTRACT(MONTH FROM ven.fecha_venta), vd.nombres;
    
  TYPE type_arr_comision IS VARRAY(8) OF NUMBER(6, 3);
  v_arr_c type_arr_comision;
  
  mes_encontrado BOOLEAN := FALSE;
  venta_encontrada BOOLEAN := FALSE;
  v_resultado NUMBER(19);
  
  v_id_insertado NUMBER(5);
  
  mes_exception EXCEPTION;
BEGIN
  v_arr_c := type_arr_comision(0, 0.015, 0.027, 0.035, 0.045, 0.052, 0.058, 0.065);

  FOR ven IN cur_venta LOOP
    IF b_fecha = EXTRACT(MONTH FROM ven.fecha_venta) THEN
      mes_encontrado := TRUE;
      DBMS_OUTPUT.PUT_LINE('---');
    END IF;
    
    FOR det IN cur_detalle LOOP
      IF det.id_cliente = ven.id_cliente and EXTRACT(MONTH FROM ven.fecha_venta) = b_fecha THEN
        v_id_insertado := RESUMEN_CLIENTES_VENTAS_SEQ.NEXTVAL;
        DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || det.id_cliente);
        DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || det.nombre_cliente);
        DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || det.mes);
        DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || det.nombre_vendedor);
        DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || det.total_ventas);
        
       
        IF det.total_ventas BETWEEN 0 AND 50000 THEN
          v_resultado := 0;
        ELSIF det.total_ventas BETWEEN 50001 AND 150000 THEN
          v_resultado := ROUND(det.total_ventas * v_arr_c(2));
        ELSIF det.total_ventas BETWEEN 150001 AND 350000 THEN
          v_resultado := ROUND(det.total_ventas * v_arr_c(3));
        ELSIF det.total_ventas BETWEEN 350001 AND 650000 THEN
          v_resultado := ROUND(det.total_ventas * v_arr_c(4));
        ELSIF det.total_ventas BETWEEN 650001 AND 950000 THEN
          v_resultado := ROUND(det.total_ventas * v_arr_c(5));
        ELSIF det.total_ventas BETWEEN 950001 AND 1350000 THEN
          v_resultado := ROUND(det.total_ventas * v_arr_c(6));
        ELSIF det.total_ventas BETWEEN 1350001 AND 10000000 THEN
        v_resultado := ROUND(det.total_ventas * v_arr_c(7));
        ELSIF det.total_ventas BETWEEN 10000001 AND 50000000 THEN
        v_resultado := ROUND(det.total_ventas * v_arr_c(8));
        END IF;
        
            DBMS_OUTPUT.PUT_LINE('Empleado(a): ' || v_resultado);
    venta_encontrada := TRUE;
    
  
    INSERT INTO RESUMEN_CLIENTES_VENTAS (
      id_clientes_ventas,
      id_cliente,
      nombre_cliente,
      mes,
      nombre_vendedor,
      total_ventas_vendedor,
      giftcard
    )
    VALUES (
      v_id_insertado,
      det.id_cliente,
      det.nombre_cliente,
      EXTRACT(MONTH FROM ven.fecha_venta),
      det.nombre_vendedor,
      det.total_ventas,
      v_resultado
    );
    
    DBMS_OUTPUT.PUT_LINE('listo');
  END IF;
END LOOP;

IF NOT venta_encontrada THEN
  DBMS_OUTPUT.PUT_LINE('No hay detalles de ventas');
END IF;
 END LOOP;

IF NOT mes_encontrado THEN
RAISE mes_exception;
END IF;
EXCEPTION
WHEN mes_exception THEN
DBMS_OUTPUT.PUT_LINE('Error: mes no encontrado');
END;