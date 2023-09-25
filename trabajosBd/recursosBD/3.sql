CREATE TABLE producto
(
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY 
    MINVALUE 1 
    MAXVALUE 9999999999
    START WITH 1
    INCREMENT BY 1,
    descripcion varchar2(100),
    precio number(10),
    fecha_registro date default sysdate
);


INSERT INTO producto (descripcion,precio)
VALUES ('Mesa de centro',56990);

INSERT INTO producto (descripcion,precio)
VALUES ('Silla mecedora',80990);
