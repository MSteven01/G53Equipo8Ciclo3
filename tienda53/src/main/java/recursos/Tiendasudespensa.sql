CREATE DATABASE tiendasudespensa;

USE tiendasudespensa;

CREATE TABLE usuarios(
	cedula_usuario BIGINT PRIMARY KEY,
    email_usuario VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR (255) NOT NULL,
    PASSWORD VARCHAR (255) NOT NULL,
    usuario VARCHAR (255) NOT NULL
);

CREATE TABLE clientes(
	cedula_cliente BIGINT PRIMARY KEY,
    email_cliente VARCHAR(255) NOT NULL,
    nombre_cliente VARCHAR (255) NOT NULL,
    direccion_cliente VARCHAR (255) NOT NULL,
    telefono_cliente VARCHAR (255) NOT NULL
);

CREATE TABLE proveedores(
	nit_proveedor BIGINT PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL,
    direccion_proveedor VARCHAR(255) NOT NULL,
    telefono_proveedor VARCHAR (255) NOT NULL,
	ciudad_proveedor VARCHAR (255) NOT NULL
);

INSERT INTO usuarios VALUES (001,'lolo123@gmail.com','Lolo Perez','admin123456','admininicial');
INSERT INTO usuarios VALUES (002,'lolo123@gmail.com','Lolo Perez','pass','user');
INSERT INTO usuarios VALUES (003,'lolo123@gmail.com','Lolo Perez','pass2','user2');

CREATE UNIQUE INDEX usuario_unico ON usuarios(usuario);

drop table usuarios