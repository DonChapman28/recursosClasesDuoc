drop table cliente cascade constraint;
drop table ejecutivo cascade constraint;
drop table comuna cascade constraint;
drop table credito cascade constraint;
drop table credito_registros cascade constraint;
drop table cuenta_registros cascade constraint;
drop table cuenta cascade constraint;
drop table tipo_credito cascade constraint;
drop table tipo_cuenta cascade constraint;

drop sequence seq_cliente;
drop sequence seq_ejecutivo;
drop sequence seq_cuenta;
drop sequence seq_credito;
drop sequence seq_cuenta_reg;

CREATE SEQUENCE seq_cliente
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_ejecutivo
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_cuenta
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_cuenta_reg
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_credito
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

CREATE TABLE cliente
(id_cliente NUMBER(10) NOT NULL,
 rut_cliente VARCHAR(12) NOT NULL,
 nombre VARCHAR(30) NOT NULL,
 apellido_p VARCHAR(30) NOT NULL,
 apellido_m VARCHAR(30) NOT NULL,
 sexo CHAR(1) NOT NULL,
 fecha_nac DATE NOT NULL,
 fecha_alta DATE,
 fecha_baja DATE,
 clave VARCHAR(30) NOT NULL,
 domicilio VARCHAR(50),
 telefono VARCHAR(15) NOT NULL,
 id_comuna NUMBER(3),
 rut_ejecutivo VARCHAR(12),
 CONSTRAINT pk_cliente PRIMARY KEY (rut_cliente));
 
CREATE TABLE ejecutivo
(id_ejecutivo NUMBER(10) NOT NULL,
 rut_ejecutivo VARCHAR(12) NOT NULL,
 nombre VARCHAR(30) NOT NULL,
 apellido_p VARCHAR(30) NOT NULL,
 apellido_m VARCHAR(30) NOT NULL,
 usuario VARCHAR(50),
 telefono VARCHAR(15) NOT NULL,
 nivel NUMBER(1) NOT NULL,
 fecha_contrato DATE,
 dir_sucursal VARCHAR(100),
 CONSTRAINT pk_ejecutivo PRIMARY KEY (rut_ejecutivo));
 
CREATE TABLE cuenta
(id_cuenta NUMBER(10) NOT NULL,
 nro_cuenta VARCHAR2(10) NOT NULL,
 fecha_alta DATE,
 rut_cliente VARCHAR(12),
 id_tipo_cuenta NUMBER(1),
 CONSTRAINT pk_cuenta PRIMARY KEY (nro_cuenta));

CREATE TABLE tipo_cuenta
(id_tipo_cuenta NUMBER(1) NOT NULL,
 descripcion VARCHAR(30) NOT NULL,
 CONSTRAINT pk_tipo_cuenta PRIMARY KEY (id_tipo_cuenta));

CREATE TABLE cuenta_registros
(id_cuenta_registros NUMBER(10) NOT NULL,
 abono NUMBER(10),
 cargo NUMBER(10),
 fecha DATE,
 nro_cuenta VARCHAR2(10),
 CONSTRAINT pk_cuenta_registros PRIMARY KEY (id_cuenta_registros));
 
CREATE TABLE credito
(id_credito VARCHAR(10) NOT NULL,
 fecha_alta DATE,
 rut_cliente VARCHAR(12),
 monto NUMBER(10) NOT NULL,
 cuotas NUMBER(2) NOT NULL,
 interes_mensual NUMBER(2,2) NOT NULL,
 id_tipo_credito NUMBER(1) NOT NULL,
 CONSTRAINT pk_credito PRIMARY KEY (id_credito));

CREATE TABLE tipo_credito
(id_tipo_credito NUMBER(1) NOT NULL,
 descripcion VARCHAR(30) NOT NULL,
 interes NUMBER(1,2) NOT NULL,
 CONSTRAINT pk_tipo_credito PRIMARY KEY (id_tipo_credito));

CREATE TABLE credito_registros
(id_credito_registros NUMBER(10) NOT NULL,
 abono NUMBER(10),
 fecha DATE,
 rut_cliente VARCHAR(12),
 CONSTRAINT pk_credito_registros PRIMARY KEY (id_credito_registros));

CREATE TABLE comuna
(id_comuna NUMBER(3) NOT NULL,
 nombre VARCHAR(30) NOT NULL,
 CONSTRAINT pk_comuna PRIMARY KEY (id_comuna));

-- creacion de llaves foraneas 
ALTER TABLE cliente
   ADD CONSTRAINT fk_cliente_comuna FOREIGN KEY (id_comuna)
   REFERENCES comuna (id_comuna);

ALTER TABLE cliente
   ADD CONSTRAINT fk_cliente_ejecutivo FOREIGN KEY (rut_ejecutivo)
   REFERENCES ejecutivo (rut_ejecutivo);

ALTER TABLE cuenta
   ADD CONSTRAINT fk_cuenta_cliente FOREIGN KEY (rut_cliente)
   REFERENCES cliente (rut_cliente);

ALTER TABLE cuenta
   ADD CONSTRAINT fk_cuenta_tipo_cuenta FOREIGN KEY (id_tipo_cuenta)
   REFERENCES tipo_cuenta (id_tipo_cuenta);

ALTER TABLE cuenta_registros
   ADD CONSTRAINT fk_cuenta_registros_cuenta FOREIGN KEY (nro_cuenta)
   REFERENCES cuenta (nro_cuenta);

ALTER TABLE credito
   ADD CONSTRAINT fk_credito_tipo_credito FOREIGN KEY (id_tipo_credito)
   REFERENCES tipo_credito (id_tipo_credito);

ALTER TABLE credito
   ADD CONSTRAINT fk_credito_cliente FOREIGN KEY (rut_cliente)
   REFERENCES cliente (rut_cliente);

ALTER TABLE credito_registros
   ADD CONSTRAINT fk_credito_registros_cliente FOREIGN KEY (rut_cliente)
   REFERENCES cliente (rut_cliente);

--POBLADO DE TABLAS
INSERT INTO comuna VALUES (1,'Maipú');
INSERT INTO comuna VALUES (2,'Estación Central');
INSERT INTO comuna VALUES (3,'San Bernardo');
INSERT INTO comuna VALUES (4,'La Cisterna');
INSERT INTO comuna VALUES (5,'Cerrillos');
INSERT INTO comuna VALUES (6,'Lo Espejo');
INSERT INTO comuna VALUES (7,'Pedro Aguirre Cerda');
INSERT INTO comuna VALUES (8,'Talagante');
INSERT INTO comuna VALUES (9,'Buin');
INSERT INTO comuna VALUES (10,'Peñaflor');

INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'16.446.851-2','RAMON','SERRANO','OLTRA',NULL,'56(9)647-74-850',2,'02/05/2005','El Cedrón #1122, Peñaflor');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'12.842.129-7','FERNANDA', 'ORREGO', 'ALMAGRO',NULL,'56(9)036-14-155',1,'01/04/2007','Las Caléndulas #2233, Buín');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'18.093.185-0','OLGA', 'ROJAS', 'MORA',NULL,'56(9)552-48-680',2,'08/09/2001','Llantén #2211, Cerrillos');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'15.991.967-6','DAVID', 'MORENO', 'CRUZ',NULL,'56(9)924-78-846',3,'13/10/2003','Calle Manzanilla #7899, Pedro Aguirre Cerda');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'17.261.393-4','SARA', 'SERRA', 'MACIA',NULL,'56(9)713-72-743',2,'21/11/2002','Los Boldos #5544, Cerrillos');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'16.130.191-4','MANUEL', 'PEREZ', 'FERNANDEZ',NULL,'56(9)596-15-333',3,'27/12/2004','Los Rooibos #4431, Cerrillos');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'14.526.168-6','CARMEN', 'DIAZ', 'RIQUELME',NULL,'56(9)674-77-614',1,'16/02/2010','Hibisco #1199, La Cisterna');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'19.911.895-1','VICTOR', 'MARTINEZ', 'CELEDON',NULL,'56(9)091-32-269',2,'07/06/2008','El Bailahuén #3385, San Bernardo');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'14.522.473-K','TAMARA', 'OLMOS', 'LILLO',NULL,'56(9)848-50-721',3,'23/01/2012','Avda. Rosa Mosqueta #2876, Estación Central');
INSERT INTO ejecutivo VALUES (seq_ejecutivo.nextval,'13.119.902-3','DANIELA', 'TELLO', 'ROBLES',NULL,'56(9)956-58-811',2,'03/10/2009','Los Jazmines #321, Maipú');
 
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'13.874.084-6','Daniela','Rojas','Fuentes','F','10/08/2000','23/08/2022',NULL,'7454009764','Los Manzanos #1234','229381236',1,'15.991.967-6');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'16.303.048-9','Jorge','Loaiza','Jiménez','M','02/07/1999','11/03/2021',NULL,'8285328134','Los Alerces #5678','992108276',1,NULL);
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'18.622.835-9','Ana','Mora','Llanos','F','22/01/1995','04/10/2021',NULL,'6908757018',NULL,'232109690',NULL,'12.842.129-7');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'9.171.035-8','Felipe','Silva','Ponce','M','11/06/1992','10/12/2020','02/03/2022','3500589935','Los Ciruelos #7874','232106678',2,'12.842.129-7');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'6.378.485-0','Marta','Mora','Villegas','F','28/04/1990','01/07/2020',NULL,'5180368097','Los Alamos #9175','972109602',3,'18.093.185-0');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'21.511.880-0','Roberto','Pino','Astorga','M','25/10/1997','28/04/2022',NULL,'1568302279','Los Naranjos #5561','229589885',3,NULL);
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'17.981.139-1','Nancy','Quezada','Soto','F','01/02/1985','01/01/2014',NULL,'7190016363','Los Olivos #4566','964453321',4,'15.991.967-6');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'8.278.209-5','Hugo','Avilés','Moraga','M','08/11/1989','19/05/2022',NULL,'6644737633',NULL,'232109582',NULL,'15.991.967-6');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'14.882.705-2','Esteban','Morales','Alamos','M','09/02/1986','11/09/2020',NULL,'2458932688','Los Zapallos #911','229644796',5,'17.261.393-4');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'7.350.972-6','Joaquín','Pinto','Villa','M','25/12/1988','10/01/2020','10/07/2021','3916667980','Las Lentejas #092','997589891',5,'17.261.393-4');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'7.867.607-8','Tiare','Uribe','Lagos','F','03/03/1981','12/08/2016',NULL,'1190459232',NULL,'229455739',NULL,'16.130.191-4');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'14.209.479-7','Fabiola','Bueno','Parra','F','21/07/1982','17/02/2016',NULL,'5219779563','Calle Nueva #111','959589846',6,'16.130.191-4');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'21.747.986-K','Olga','Plaza','Albornoz','F','05/02/1997','15/01/2017',NULL,'9190459232','Las Delicias #5464','229644796',7,'14.526.168-6');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'20.345.485-6','Paula','Echeverría','Ramírez','F','07/09/2000','20/07/2021',NULL,'6219779563',NULL,'229381236',1,'14.526.168-6');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'22.717.529-K','Pedro','Tamayo','Ávila','M','15/09/2001','02/08/2022',NULL,'8190459232','Huasco #034900','232106604',8,NULL);
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'7.967.607-K','Osvaldo','González','Villanueva','M','07/07/1985','11/11/2013',NULL,'7281559277',NULL,'229455739',5,NULL);
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'8.830.366-0','Ramón','Cáceres','Donoso','M','23/12/2005','05/02/2017','01-10-2021','6219779563',NULL,'982106682',8,'14.522.473-K');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'17.592.245-8','Olivia','Urrutia','Castillo','F','03/03/2007','08/04/2022',NULL,'7190459232','Linares #83579','229589885',9,'14.522.473-K');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'15.824.721-6','Mirna','Norambuena','Pavez','F','23/12/2005','05/02/2022',NULL,'6219779563',NULL,'962109602',5,'13.119.902-3');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'22.070.697-4','Úrsula','Dávalos','Henríquez','F','20/06/1999','06/06/2007','01/05/2015','7190459232','Calle Océano #83579','229455724',10,'13.119.902-3');
INSERT INTO cliente VALUES (SEQ_CLIENTE.nextval,'20.194.262-4','Marta','Guerra','Linderos','F','21/10/2002','18/05/2001','22/01/2012','6219779563','Mar Rojo #5733','229589887',10,'14.526.168-6');

INSERT INTO tipo_cuenta VALUES (1, 'CUENTA CORRIENTE');
INSERT INTO tipo_cuenta VALUES (2, 'CUENTA VISTA');
INSERT INTO tipo_cuenta VALUES (3, 'CUENTA DE AHORRO');

INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111111','10/12/19','16.303.048-9',1);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111112','02/06/20','6.378.485-0',2);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111113','19/05/18','14.882.705-2',1);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111114','08/11/19','17.592.245-8',2);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111116','03/07/19','14.882.705-2',3);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111117','03/01/20','8.830.366-0',1);
INSERT INTO cuenta VALUES (seq_cuenta.nextval,'1111111118','21/09/19','18.622.835-9',1);

INSERT INTO tipo_credito VALUES (1, 'CONSUMO', 0.02);
INSERT INTO tipo_credito VALUES (2, 'HIPOTECARIO', 0.04);

INSERT INTO credito VALUES ('0000001','20/03/20','8.830.366-0',4000000,24,0.023,1);
INSERT INTO credito VALUES ('0000002','21/09/19','18.622.835-9',7000000,36,0.027,1);
INSERT INTO credito VALUES ('0000003','01/06/19','17.981.139-1',6000000,36,0.022,1);
INSERT INTO credito VALUES ('0000004','08/10/19','15.824.721-6',5000000,24,0.02,1);

INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '05/04/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '04/05/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '03/06/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '05/07/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '04/08/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '06/09/2022', '8.830.366-0');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 100000, '05/10/2022', '8.830.366-0');

INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '02/10/2021', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '03/11/2021', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '02/12/2021', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '02/01/2022', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '03/02/2022', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '02/03/2022', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '03/04/2022', '18.622.835-9');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 135000, '02/05/2022', '18.622.835-9');

INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 114500, '04/07/2021', '17.981.139-1');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 114500, '04/08/2021', '17.981.139-1');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 114500, '06/09/2021', '17.981.139-1');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 114500, '04/10/2021', '17.981.139-1');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 114500, '06/11/2021', '18.622.835-9');

INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '07/11/2021', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '05/12/2021', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '06/01/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '04/02/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '07/03/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '07/04/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '06/05/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '07/06/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '05/07/2022', '15.824.721-6');
INSERT INTO credito_registros VALUES (seq_cuenta_reg.nextval, 124000, '07/08/2022', '15.824.721-6');

INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 100000, NULL, '01/02/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 20000, NULL, '05/02/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 300000, NULL, '27/02/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 10000, '01/03/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 10000, '02/03/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 50000, '05/03/2021', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 10000, NULL, '20/07/2022', '1111111111');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 120000, NULL, '04/08/2022', '1111111111');

INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 50000, '21/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 100000, '23/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 450000, '25/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 30000, NULL, '27/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 25000, NULL, '27/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, NULL, 250000, '29/04/2022', '1111111112');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 350000, NULL, '07/09/2020', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 1000000, NULL, '22/05/2021', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 500000, NULL, '27/11/2021', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 200000, NULL, '05/02/2022', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 100000, NULL, '06/06/2022', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 30000, NULL, '23/08/2022', '1111111113');
INSERT INTO cuenta_registros VALUES (seq_cuenta_reg.nextval, 150000, NULL, '02/09/2022', '1111111113');

COMMIT;