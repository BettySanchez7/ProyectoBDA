--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         SE HABILITA EL MODO COMPARTIDO EN LA BASE DE DATOS

-- Antes de ejecutar este script es necesario tener un spfile creado
-- create spfile from pfile;
alter system set db_domain='fi.unam' scope=spfile;
alter system set dispatchers='(dispatchers=3)(protocol=tcp)' scope=spfile;
alter system set shared_servers=20 scope=spfile;

Prompt ¡Ejecución exitosa!: 
Prompt      Para que los cambios se vean reflejados, reinicia la instancia