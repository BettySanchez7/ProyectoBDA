--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--         activación del modo archivelog


create pfile from spfile;

alter system set log_archive_max_processes=5;

alter system set log_archive_dest_1='LOCATION=/u01/app/oracle/oradata/MOSAproy/disk_1 MANDATORY'

alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST';

alter system set log_archive_format=arch_mosaproy_%t_%s_%r.arc

alter system set log_archive_min_succeed_dest=1;

shutdown;

startup mount;

alter database archivelog;

alter database open;

create pfile from spfile;
