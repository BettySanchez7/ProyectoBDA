--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 11 de junio de 2020
--@Descripción: 
--         Creación del diccionario de datos

connect sys/systemproy as sysdba
@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql
connect system/system2
@?/sqlplus/admin/pupbld.sql
disconnect
