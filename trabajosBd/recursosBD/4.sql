--drop table producto;

CREATE TABLE producto
(
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY 
    MINVALUE 1 
    MAXVALUE 9999999999
    START WITH 1
    INCREMENT BY 1 CONSTRAINT PK_LOLOLO PRIMARY KEY,
    descripcion varchar2(100),
    precio number(10),
    fecha_registro date default sysdate
);
-- Cambiar nombre de constraint 
alter table "ADMIN"."PRODUCTO" RENAME CONSTRAINT "PK_LOLOLO" TO "PK_PRODUCTO";