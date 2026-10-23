select schema_name from information_schema.schemata

-- para obtener todas las bases de datos --

show databases;

-- Si quieres obtener todas las tablas de una base de datos específica, puedes usar la siguiente consulta:

select table_name
from information_schema.tables
where table_schema = 'mi_base_de_datos';

--Como por ejemplo, para obtener todas las tablas de la base de datos 'empresa', puedes usar la siguiente consulta:

Select table_name
from information_schema.tables
where table_schema = 'empresa';

use empresa;
show tables;

select column_name
data_type
is_nullable
column_default
from information_schema.columns
where table_schema = 'mi_base_de_datos'
and table_name = 'mi_tabla';

-- por ejemplo, para obtener todas las columnas de la tabla 't_personal' en la base de datos 'empresa', puedes usar la siguiente consulta:

select column_name,
data_type,
is_nullable,
column_default
from information_schema.columns
where table_schema = 'empresa'
and table_name = 't_personal';

describe mi_base_de_datos.mi_tabla;

--por ejemplo, para obtener la estructura de la tabla 't_personal' en la base de datos 'empresa', puedes usar la siguiente consulta:

describe empresa.t_personal;

-- O

desc empresa.t_personal;