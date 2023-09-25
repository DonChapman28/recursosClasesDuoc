DROP TABLE producto;

CREATE TABLE producto
(
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY 
    MINVALUE 1 
    MAXVALUE 9999999999
    START WITH 1
    INCREMENT BY 1 CONSTRAINT PK_PRODUCTO PRIMARY KEY,
    descripcion varchar2(100),
    precio number(10) NOT NULL,
    fecha_registro date default sysdate
);

INSERT INTO producto (descripcion,precio)
VALUES ('Mesa de centro',NULL);

INSERT INTO producto (descripcion,precio,fecha_registro)
VALUES ('Silla mecedora',80990,NULL);

INSERT INTO producto (descripcion,precio)
VALUES ('Velador',25990);
