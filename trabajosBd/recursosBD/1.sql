CREATE TABLE producto
(
    id_producto number(10),
    descripcion varchar2(100),
    precio number(10),
    fecha_registro date
);

INSERT INTO producto (id_producto,descripcion,precio,fecha_registro)
VALUES (1,'Mesa de centro',56990,'20-05-2022');

INSERT INTO producto (id_producto,descripcion,precio,fecha_registro)
VALUES (2,'Silla mecedora',80990,'23-05-2022');

INSERT INTO producto (id_producto,descripcion,precio,fecha_registro)
VALUES (3,'Velador de cuarzo',199990,SYSDATE);