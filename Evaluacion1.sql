create database if not exists farmavida;
use farmavida;

create table if not exists t_cliente(
    id_cliente int primary key auto_increment,
    rut varchar(12) not null unique,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    email varchar(100) not null unique,
    telefono varchar(15) not null,
    comuna varchar(100) not null,
    fecha_nacimiento datetime not null,
    cliente_frecuente boolean default false,
    fecha_registro timestamp default current_timestamp,
    observaciones text(65000)
);

create table if not exists t_medicamento(
    id_medicamento int primary key auto_increment,
    nombre varchar(100) not null,
    laboratorio varchar(100) not null,
    codigo_barras varchar(20) not null unique,
    categoria text not null,
    requiere_receta boolean default false,
    stock int(5) not null default 0,
    precio_unitario decimal(10,2) not null,
    porcentaje_descuento decimal(12,5) not null,
    descripcion text not null,
    fecha_vencimiento datetime not null,
    fecha_ingreso datetime default current_timestamp
);

create table if not exists t_venta(
    id_venta int primary key auto_increment,
    id_cliente int not null,
    id_medicamento int not null,
    tipo_pago varchar(50) not null,
    fecha_venta datetime default current_timestamp,
    hora_venta datetime default (current_time),
    cantidad int not null,
    numero_boleta bigint not null unique,
    monto_total decimal(10,2) not null,
    fecha_registro datetime default current_timestamp,
    venta_anulada boolean default false,
    detalle_venta text not null
);

alter table t_cliente 
add region varchar(50) not null;

alter table t_medicamento
add es_generico boolean default false;

insert into t_cliente (rut, nombres, apellidos, email, telefono, comuna, fecha_nacimiento, observaciones, region) values
('12345678-9', 'Juan', 'Pérez', 'juan.perez@email.com', '123456789', 'Santiago', '1990-01-01','Cliente nuevo', 'Región Metropolitana'),
('98765432-1', 'María', 'González', 'maria.gonzales@email.com', '987654321', 'Valparaíso', '1985-05-15','Cliente nuevo', 'Región de Valparaíso'),
('45678912-3', 'Pedro', 'Ramírez', 'pedro.ramirez@email.com', '456789123', 'Concepción', '1992-12-10','Cliente nuevo', 'Región del Biobío');

insert into t_medicamento (id_medicamento, nombre, laboratorio, codigo_barras, categoria, precio_unitario, porcentaje_descuento, descripcion, fecha_vencimiento) values
(1, 'Paracetamol', 'Laboratorio A', '1234567890123', 'Analgésico', 500.00, 0.10, 'Medicamento para el dolor y la fiebre.', '2025-12-31'),
(2, 'Ibuprofeno', 'Laboratorio B', '9876543210987', 'Antiinflamatorio', 800.00, 0.15, 'Medicamento para la inflamación y el dolor.', '2024-06-30'),
(3, 'Amoxicilina', 'Laboratorio C', '4567891234567', 'Antibiótico', 1200.00, 0.20, 'Antibiótico para infecciones bacterianas.', '2023-11-30');

insert into t_venta (id_cliente, id_medicamento, tipo_pago, cantidad, numero_boleta, monto_total, detalle_venta) values
(1, 1, 'Efectivo', 2, 1001, 900.00, 'Compra de Paracetamol'),
(2, 2, 'Tarjeta de Crédito', 1, 1002, 800.00, 'Compra de Ibuprofeno'),
(3, 3, 'Transferencia Bancaria', 3, 1003, 3600.00, 'Compra de Amoxicilina');

update t_medicamento
set stock = 20
where id_medicamento = 1;

update t_medicamento
set precio_unitario = precio_unitario * 1.10
where categoria = 'Analgésico';

delete from t_venta
where id_venta = 2;

select * from t_medicamento where stock < 20;

select * from t_cliente where nombres like '%C%';

select * from t_cliente order by nombres asc;

select * from t_cliente order by apellidos asc; 