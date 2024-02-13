DROP DATABASE IF EXISTS jardineria;
CREATE DATABASE jardineria;
GO
USE jardineria;
GO
CREATE TABLE oficina (
  codigo_oficina VARCHAR(10) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios TEXT,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25) NULL,
  proveedor VARCHAR(50) DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

---------------Crea un script ‘actualizaJardineria.sql’ que realice las siguientes acciones:-------------------
--1. Inserta una oficina con sede en Fuenlabrada
INSERT INTO oficina(codigo_oficina,ciudad,pais,region, codigo_postal,telefono,linea_direccion1) 
VALUES('001','Madrid','España','Fuenlabrada', '28942 ','915458665','Av. 8 de Marzo, 8');

Select * from oficina;

--2. Inserta un empleado para la oficina de Fuenlabrada que sea representante de ventas
INSERT INTO empleado (codigo_empleado,nombre,apellido1,apellido2,extension,email,codigo_oficina,puesto)
VALUES ('016','Luis','Ruiz','Gil','859645','luisruiz@gmail.com','001','Representante de ventas');

Select * from empleado;
--3. Inserta un cliente del representante de ventas insertado en el punto 2.

INSERT INTO cliente (codigo_cliente,nombre_cliente,telefono,fax,linea_direccion1,ciudad,codigo_empleado_rep_ventas)
VALUES ('0254','Laura Santos Perez','915846756','915587425','C. de Fernando VI, 9','Madrid','016');

SELECT * FROM cliente;

--4. Inserta un pedido del cliente anterior (con su detalle) de al menos 2 productos con una transacción
INSERT INTO gama_producto (gama) VALUES ('ALTA');
INSERT INTO gama_producto(gama) VALUES('MEDIA');
INSERT INTO gama_producto(gama) VALUES('ECONOMICA');

SELECT gama from gama_producto;

INSERT INTO producto(codigo_producto,nombre,gama,cantidad_en_stock,precio_venta)
VALUES ('A145','Bouquet de 50 Rosas','ALTA','30','40');
INSERT INTO producto(codigo_producto,nombre,gama,cantidad_en_stock,precio_venta)
VALUES ('B325','Bouquet de Flores','Media','15','15');

SELECT codigo_producto,nombre,gama,cantidad_en_stock,precio_venta FROM producto;

INSERT INTO pedido( codigo_pedido, fecha_pedido,fecha_esperada,fecha_entrega,estado,codigo_cliente)
VALUES ('4567','19-01-2023','19-01-2023','20-01-2023','enviado','0254');

select codigo_pedido, fecha_pedido,fecha_esperada,fecha_entrega,estado,codigo_cliente from pedido;

INSERT INTO detalle_pedido (codigo_pedido,codigo_producto,cantidad,precio_unidad, numero_linea)
VALUES ('4567','A145','2','40','1');
INSERT INTO detalle_pedido (codigo_pedido,codigo_producto,cantidad,precio_unidad, numero_linea)
VALUES ('4567','B325','3','15','2');
SELECT * FROM detalle_pedido;

BEGIN TRAN
INSERT INTO gama_producto (gama) VALUES ('ALTA');
INSERT INTO gama_producto(gama) VALUES('MEDIA');
INSERT INTO producto(codigo_producto,nombre,gama,cantidad_en_stock,precio_venta)
VALUES ('A145','Bouquet de 50 Rosas','ALTA','30','40');
INSERT INTO producto(codigo_producto,nombre,gama,cantidad_en_stock,precio_venta)
VALUES ('B325','Bouquet de Flores','Media','15','15');
INSERT INTO pedido( codigo_pedido, fecha_pedido,fecha_esperada,fecha_entrega,estado,codigo_cliente)
VALUES ('4567','19-01-2023','19-01-2023','20-01-2023','enviado','0254');
INSERT INTO detalle_pedido (codigo_pedido,codigo_producto,cantidad,precio_unidad, numero_linea)
VALUES ('4567','A145','2','40','1');
INSERT INTO detalle_pedido (codigo_pedido,codigo_producto,cantidad,precio_unidad, numero_linea)
VALUES ('4567','B325','3','15','2');
ROLLBACK TRAN;

--5. Actualiza el código del cliente insertado y averigua si hubo cambios en las tablas relacionadas.
select * from cliente
UPDATE cliente
SET codigo_cliente= 254
WHERE codigo_cliente=  201
--6. Borra el cliente y verifica si hubo cambios

--Realizamos la prueba de borrar un cliente con dos pagos pendientes:
--1. Creamos las tabla de pagos_pendientes con la cláusula ON DELETE NO ACTION e intentamos borrar el cliente o modificar su DNI 
 select * from cliente
 alter table cliente
 add  dni_cliente  varchar (10)
 alter table ¡¡¡¡¡¡¡¡¡¡¡
 alter table cliente 
 add constraint pk_dni primary key (dni_cliente)

CREATE TABLE pagos_pendientes (
    dni_cliente VARCHAR(10),
    cantidad DECIMAL(10, 2),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni_cliente) ON DELETE NO ACTION
);

INSERT INTO cliente VALUES ('5555672L', 'Pepe Cifuentes', 'C/Los Almendros 23');
INSERT INTO pagos_pendientes VALUES ('5555672L', 500);
INSERT INTO pagos_pendientes VALUES ('5555672L', 234.5);

DELETE FROM cliente WHERE dni_cliente = '5555672L';
--2. Después creamos la tabla pagos_pendientes con la cláusula ON DELETE CASCADE:
--1. Modificamos el DNI y comprobamos que se modifica en los pagos pendientes 
--2. Borramos el cliente y verificamos que se hayan borrado los pagos pendientes
--Registros a crear:
--Cliente: 5555672L, Pepe Cifuentes, C/Los Almendros 23 
--Pagos:	 5555672L, 500 
--5555672L, 234.5 











