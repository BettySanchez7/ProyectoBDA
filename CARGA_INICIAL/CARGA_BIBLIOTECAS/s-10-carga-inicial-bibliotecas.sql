--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 12 de junio de 2020
--@Descripción: 
--         CARGA INICIAL BIBLIOTECA

whenever sqlerror exit rollback
set define off
Prompt realizando la carga de datos
@@s-10-area.sql
@@s-10-biblioteca.sql
@@s-10-area-biblioteca.sql
@@s-10-usuario.sql
@@s-10-prestamo.sql
set define on
Prompt confirmando cambios
commit;
