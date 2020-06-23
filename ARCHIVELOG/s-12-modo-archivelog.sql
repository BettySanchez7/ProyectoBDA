--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--         activación del modo archivelog

connect sys/systemproy as sysdba

--carpetas para archivelogs

!mkdir -p /u01/app/oracle/oradata/MOSAproy/archivelogs/disk_1
!mkdir -p /u01/app/oracle/oradata/MOSAproy/archivelogs/disk_2

-----------
create pfile from spfile;

alter system set log_archive_max_processes=5 scope=spfile;

--rutas
alter system set log_archive_dest_1='LOCATION=/u01/app/oracle/oradata/MOSAproy/archivelogs/disk_1 MANDATORY' scope=spfile;

alter system set log_archive_dest_2='LOCATION=/u01/app/oracle/oradata/MOSAproy/archivelogs/disk_2' scope=spfile;

alter system set log_archive_format='arch_mosaproy_%t_%s_%r.arc' scope=spfile;

alter system set log_archive_min_succeed_dest=1;

shutdown;

startup mount;

alter database archivelog;

alter database open;

create pfile from spfile;
