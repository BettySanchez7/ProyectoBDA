--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--         activación del modo archivelog


--carpetas para archivelogs

!mkdir /u01/app/oracle/oradata/MOSAproy/disk_1/archivelogs
!mkdir /u01/app/oracle/oradata/MOSAproy/disk_2/archivelogs

-----------
create pfile from spfile;

alter system set log_archive_max_processes=5 scope=spfile;

--rutas
alter system set log_archive_dest_1='LOCATION=/u01/app/oracle/oradata/MOSAproy/disk_1/archivelogs MANDATORY' scope=spfile;

alter system set log_archive_dest_2='LOCATION=/u01/app/oracle/oradata/MOSAproy/disk_2/archivelogs' scope=spfile;

alter system set log_archive_format=arch_mosaproy_%t_%s_%r.arc

alter system set log_archive_min_succeed_dest=1;

shutdown;

startup mount;

alter database archivelog;

alter database open;

create pfile from spfile;
