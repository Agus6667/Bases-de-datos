-- ejercicio 1
select id, concat(upper(trim(apellido)), ', ', lower(trim(nombre))) as cliente, lower(trim(email)) as email, upper(trim(ciudad)) as ciudad from t_cliente order by trim(apellido) asc;

-- ejercicio 2
select concat('VC', id, upper(left(trim(ciudad), 3))) as codigo_cliente from t_cliente where length(trim(email)) > 20;

-- ejercicio 3
select nombre, precio, (precio - costo) as ganancia, ceil(precio/3) as cuota_3, floor(precio * 0.93) as precio_convenio from t_producto where categoria in ('Armazón', 'Lente de sol');

-- ejercicio 4
select nombre, precio, ceil(precio/1.19) as valor_neto, ceil(precio - (precio/1.19)) as iva from t_producto where categoria = 'Accesorio';

-- ejercicio 5
select concat(lower(trim(nombre)), ' ', lower(trim(apellido))) as cliente, day(fecha_nacimiento) as dia, year(fecha_nacimiento) as anio_nacimiento from t_cliente where month(fecha_nacimiento) = 11 order by day(fecha_nacimiento);

-- ejercicio 6
select nombre, fecha_hora_ingreso, datediff('2026-11-13', fecha_hora_ingreso) as dias_bodega from t_producto where datediff('2026-11-13', fecha_hora_ingreso) > 365 order by dias_bodega desc;

-- ejercicio 7
select cast(nro_boleta as unsigned) as boleta, producto, cast(precio_txt as unsigned) * cast(cantidad_txt as unsigned) as total from t_venta_antigua where (cast(precio_txt as unsigned) * cast(cantidad_txt as unsigned)) > 100000;

-- ejercicio 8
select nro_boleta, producto, date(fecha_hora_txt) as fecha, time(fecha_hora_txt) as hora from t_venta_antigua where month(cast(fecha_hora_txt as datetime)) = 11 order by fecha;

-- ejercicio 9
select cast(nro_boleta as unsigned) as boleta, date_format(cast(fecha_hora_txt as datetime), '%d-%m-%Y') as fecha, (cast(precio_txt as unsigned) * cast(cantidad_txt as unsigned)) as total_bruto from t_venta_antigua where cast(descuento_txt as decimal(5,2)) > 0 order by cast(fecha_hora_txt as datetime) asc;

-- ejercicio 10 
select concat(upper(trim(nombre)), ' ', upper(trim(apellido))) as cliente, lower(trim(email)) as email, date_format(fecha_nacimiento, '%d-%m-%Y') as nacimiento, (year(curdate()) - year(fecha_nacimiento)) as edad_aproximada from t_cliente where upper(trim(ciudad)) = 'TEMUCO';