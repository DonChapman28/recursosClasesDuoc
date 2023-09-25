CREATE TABLE categoria
(
    id_categoria number(2) primary key,
    nombre varchar2(30) not null
);

INSERT INTO categoria (id_categoria,nombre) VALUES (1,'COCINA');
INSERT INTO categoria (id_categoria,nombre) VALUES (2,'INFANTÍL');
INSERT INTO categoria (id_categoria,nombre) VALUES (3,'EXTERIOR');

-- drop table producto;
CREATE TABLE producto
(
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY 
    MINVALUE 1 
    MAXVALUE 9999999999
    START WITH 1
    INCREMENT BY 1 CONSTRAINT PK_PRODUCTO PRIMARY KEY,
    descripcion varchar2(100),
    precio number(10) NOT NULL,
    fecha_registro date default sysdate,
    id_categoria CONSTRAINT FK_PROD_CAT REFERENCES categoria (id_categoria)
);

INSERT INTO producto (descripcion,precio,fecha_registro,id_categoria)
VALUES ('Silla mecedora',30990,'25-05-2022',2);

INSERT INTO producto (descripcion,precio,fecha_registro,id_categoria)
VALUES ('Macetero',12990,'24-05-2022',3);