-- Esta es una linea de comentario debe ir si o si con un espacio al inicio sino da error

/* Hola
Este es un comentario de multiples lineas
*/
CREATE DATABASE empresa;
USE empresa; 

-- DROP DATABASE empresa;

/* TIPOS DE FECHA Y HORA
DATE:  'YYYY-MM-DD'  (2023-01-01)
TIME:  'HH:MM:SS' (12:00:00)
DATETIME: 'YYYY-MM-DD HH:MM:SS' (2023-01-01 12:00:00)
TIMESTAMP: 'YYYY-MM-DD HH:MM:SS' (2023-01-01 12:00:00)
YEAR: 'YYYY' (2023)
*/
CREATE TABLE t_personal (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(100),
    salario INT,
    departamento VARCHAR(50),
    fecharegistro DATE
);
create table t_producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT default 0,
    fechacreacion DATETIME default CURRENT_TIMESTAMP
);

alter table t_personal
    add telefono VARCHAR(20);

alter table t_personal
    drop column fecharegistro;

-- drop table t_producto;

drop table if exists t_personal;

create table t_personal (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(100),
    salario INT,
    departamento VARCHAR(50),
    fecharegistro DATE
);

drop table if exists t_producto;

create table t_producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT default 0,
    fechacreacion DATETIME default CURRENT_TIMESTAMP
);

-- Insertar un registro en la tabla t_personal

insert into t_personal (id, nombre, apellido,salario, departamento) values
(1, 'Juan', 'Perez', 700000, 'Ventas');

-- Insertar varios registros en la tabla t_personal

insert into t_personal (id, nombre, apellido,salario, departamento) values
(2, 'Maria', 'Garcia', 650000, 'Marketing'),
(3, 'Carlos', 'Lopez', 680000, 'IT'),
(4, 'Ana', 'Martin', 620000, 'Ventas');

-- Insertar sin especificar las columnas, se debe respetar el orden de la tabla

insert into t_personal
values (5, 'Ana', 'Santos', 'as@gmail.com', 'Temuco', 900000, 'Gerencia', '2025-08-21');

insert into t_producto
values (1, 'Cuaderno', 4500, 20, '2025-08-21'),
(2, 'Lapiz', 2800, 35, '2025-09-11'),
(3, 'Goma', 1200, 15, '2025-10-31');

update t_personal
set salario = 750000
where id = 1;

update t_personal
set salario = salario * 1.10,
    departamento = 'Ventas Senior'
where departamento = 'Ventas' AND
salario > 700000;

UPDATE t_producto
SET precio = precio * 1.05;

-- eliminar un registro de la tabla t_personal

delete from t_personal
where id = 3;

-- eliminar varios registros de la tabla t_personal

delete from t_personal
where salario > 600000 
and departamento = 'Marketing';

-- eliminar todos los registros de la tabla t_personal

delete from t_personal;

select * from t_personal where ciudad = 'Temuco';

select * from t_personal where nombre like 'A%';

select * from t_personal where ciudad in ('Temuco', 'Concepcion');

select * from t_personal order by nombre asc;

select * from t_personal order by nombre desc;

select distinct ciudad from t_personal;