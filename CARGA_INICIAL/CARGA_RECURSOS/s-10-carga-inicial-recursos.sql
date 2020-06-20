--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 12 de junio de 2020
--@Descripción: 
--         CARGA INICIAL RECURSOS
whenever sqlerror exit rollback
set define off
Prompt realizando la carga de datos
@@s-10-autor.sql
@@s-10-editorial.sql
@@s-10-recurso-status.sql
set define on
Prompt confirmando cambios 3 primeras tablas


whenever sqlerror exit rollback
set define off
Prompt realizando la carga de datos
@@s-10-recurso.sql
Prompt confirmando cambios recurso

whenever sqlerror exit rollback
set define off
Prompt realizando la carga de datos
@@s-10-historico-recurso-status.sql
@@s-10-libro.sql
@@s-10-libro-autor.sql
@@s-10-palabra-clave.sql
@@s-10-palabra-clave-recurso.sql
@@s-10-recurso-prestamo.sql
@@s-10-revista.sql
@@s-10-tesis.sql
set define on
Prompt confirmando cambios segunda parte

commit;

