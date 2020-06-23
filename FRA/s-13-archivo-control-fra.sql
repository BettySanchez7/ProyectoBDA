--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--        Una copia del archivo de control a FRA

!mkdir -p /u01/app/oracle/oradata/MOSAproy/fast-reco-area/controlfile


create pfile from spfile;

shutdown immediate

--Mover una copia de un archivo de control a la ubicación de la fra
!mv /u01/app/oracle/oradata/MOSAproy/disk_3/control03.ctl /u01/app/oracle/oradata/MOSAproy/fast-reco-area/controlfile/control03.ctl

startup nomount;

alter system set control_files ='/u01/app/oracle/oradata/MOSAproy/disk_1/control01.ctl',
'/u01/app/oracle/oradata/MOSAproy/disk_2/control02.ctl',
'/u01/app/oracle/oradata/MOSAproy/fast-reco-area/controlfile/control03.ctl' scope=spfile;

shutdown immediate

startup
--startup nomount;

--alter database mount;

--alter database open;

