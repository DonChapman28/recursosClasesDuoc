-- Eliminar tabla
-- DROP TABLE producto;

CREATE TABLE producto
(
    id_producto number(10),
    descripcion varchar2(100),
    precio number(10),
    fecha_registro date default sysdate
);

INSERT INTO producto (id_producto,descripcion,precio)
VALUES (1,'Mesa de centro',56990);

INSERT INTO producto (id_producto,descripcion,precio)
VALUES (2,'Silla mecedora',80990);