CREATE DATABASE ventas_tech_bd;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias( id_categoria INT PRIMARY KEY , nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR (200) ) ;

CREATE TABLE clientes ( id_cliente INT PRIMARY KEY, nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE, cuidad VARCHAR (50),fecha_registro DATE NOT NULL);

CREATE TABLE productos ( id_producto INT PRIMARY KEY , nombre_producto varchar(100) not null,
id_categoria int foreign key (id_categoria) references categorias (id_categoria) , precio decimal (10,2) not null, stock int default 0 ,
activo tinyint default 1);


CREATE TABLE ventas ( id_venta int primary key, id_cliente int foreign key (id_cliente) references clientes(id_cliente), id_producto int foreign key
(id_producto) references productos(id_producto),
cantidad int not null, precio_unitario decimal(10,2) not null, fecha_venta date not null);

INSERT INTO categorias VALUES (1,'COMPUTACION','LAPTOS,PCS Y MONITORES');
INSERT INTO categorias VALUES (2,'ACCESORIOS','PERIFERICOS Y COMPLEMENTOS');
INSERT INTO categorias VALUES (3,'AUDIO','AURICULARES Y PARLANTES');
INSERT INTO categorias VALUES (4,'ALMACENAMIENTO','DISCOS Y MEMORIAS');


INSERT INTO clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;




