--convertir un string a un numero entero 
-- no puede haber espacio entre el cast y el (
select cast("123" as signed) as numero;
--convertir un string a un numero decimal
select cast("45.67" as decimal(10,2)) as precio;
--numero a string
select cast("12345" as char) as codigo;
--con longitud fija
select cast("789")as char(5) as codigo_fijo;
--string a fecha
select cast("2024-06-15" as date) as fecha;
--fecha a string
select cast(now() as char) as fecha_string;
--extraer solo la fecha de un datetime
select cast("2024-06-15 10:30:00" as date) as solo_fecha;