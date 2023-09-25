-- drop table producto;

CREATE TABLE producto
(
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY 
    MINVALUE 1 
    MAXVALUE 9999999999
    START WITH 1
    INCREMENT BY 1 CONSTRAINT PK_PRODUCTO PRIMARY KEY,
    descripcion varchar2(100),
    precio number(10) NOT NULL CONSTRAINT ck_precio_prod CHECK (precio > 1000),
    fecha_registro date default sysdate,
    id_categoria CONSTRAINT FK_PROD_CAT REFERENCES categoria (id_categoria)
);

insert into producto (descripcion,precio,fecha_registro,id_categoria)
values ('Microondas',90990,'24-05-2022',1);

insert into producto (descripcion,precio,fecha_registro,id_categoria)
values ('Horno eléctrico',800,'24-05-2022',1);