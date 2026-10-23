-- Crea BD, tabla y datos.

DROP DATABASE IF EXISTS funciones_de_una_sola_fila;

CREATE DATABASE funciones_de_una_sola_fila;

USE funciones_de_una_sola_fila;

CREATE TABLE t_empleado
    (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE
    );

INSERT INTO t_empleado VALUES
    (1, '   ana   ', 'Gómez', 1500000.19, '2022-01-15'),
    (2, 'juan', 'pérez', 1200000.28, '2021-06-20'),
    (3, '   MARIA', 'lópez', 1850000.37, '2023-03-10'),
    (4, 'Marcela', 'Latorre', 1750000.46, '2026-03-10'),
    (5, 'aNDRES', 'gARRIDO', 950000.55, '2023-03-10'),
    (6, '  Carlos', 'Muñoz', 1350000.64, '2020-03-02'),
    (7, 'LUIS   ', 'rojas', 1100000.73, '2019-11-05'),
    (8, '   sofía   ', 'Vásquez', 2100000.82, '2026-09-18'),
    (9, 'pAULA', 'fUENTES', 1650000.91, '2022-09-01'),
    (10, 'Javier', 'Tapia', 2450000.00, '2018-04-23'),
    (11, '  DIEGO  ', 'araya', 1000000.09, '2025-03-03'),
    (12, 'camila', 'sepúlveda', 1900000.18, '2024-07-08'),
    (13, '   Valentina', 'Núñez', 1450000.27, '2020-12-14'),
    (14, 'fELIPE', 'cONTRERAS', 1250000.36, '2023-08-21'),
    (15, 'ROBERTO', 'González', 2800000.45, '2019-03-25'),
    (16, 'daniela   ', 'Peña', 1050000.54, '2026-09-22'),
    (17, '  Ignacio  ', 'hernández', 1950000.63, '2022-10-17'),
    (18, '   CLAUDIA', 'silva', 1400000.72, '2018-08-06'),
    (19, 'Matías', 'Cáceres', 1700000.81, '2023-12-11'),
    (20, 'fRANCISCA  ', 'vARGAS', 1150000.90, '2025-01-27');

-- Unidad 3

--funciones de fecha y hora
now() -- devuelve la fecha y hora actual ejemplo: now() devuelve '2023-01-01 12:00:00'
curdate() -- devuelve la fecha actual ejemplo: curdate() devuelve '2023-01-01'
year() -- extrae el año de una fecha ejemplo: year('2023-01-01') devuelve 2023
month() -- extrae el mes de una fecha ejemplo: month('2023-01-01') devuelve 1
day() -- extrae el día de una fecha ejemplo: day('2023-01-01') devuelve 1
datediff() -- calcula la diferencia entre dos fechas ejemplo: datediff('2023-01-01', '2022-12-31') devuelve 1

-- funciones numericas
abs() -- devuelve el valor absoluto de un número ejemplo: abs(-5) devuelve 5
round() -- redondea un número a un número específico de decimales ejemplo: round(3.14159, 2) devuelve 3.14


select nombre, YEAR(fecha_contratacion) as ano_contratacion from t_empleado; 

select nombre, round(salario, 2) as salario_redondeado from t_empleado;

select * from t_empleado where month(fecha_contratacion) = 3;

select concat(nombre, ' ', apellido) as nombre_completo from t_empleado;

select concat(id, upper(substring(trim(nombre), 1, 1)), upper(substring(trim(apellido), 1, 1))) as codigo from t_empleado;