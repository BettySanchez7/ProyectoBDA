--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--         grupo 3 de redo logs a FRA


--Elegí grupo 3 para ubicar en la FRA

--CARPETAS PARA MULTIPLEXADO DE ARCHIVOS DEL GRUPO DE ONLINE REDO LOGS
!mkdir /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_a
!mkdir /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_b
!mkdir /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_c

shutdown immediate
--COPIANDO LOG FILES A SU NUEVA UBICACION
!mv /u01/app/oracle/oradata/MOSAproy/disk_1/redo03a.log /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_a/redo03a.log
!mv /u01/app/oracle/oradata/MOSAproy/disk_2/redo03b.log /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_b/redo03b.log
!mv /u01/app/oracle/oradata/MOSAproy/disk_3/redo03c.log /u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_c/redo03c.log

startup mount

alter database
rename file
'/u01/app/oracle/oradata/MOSAproy/disk_1/redo03a.log',
'/u01/app/oracle/oradata/MOSAproy/disk_2/redo03b.log',
'/u01/app/oracle/oradata/MOSAproy/disk_3/redo03c.log'
to
'/u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_a/redo03a.log',
'/u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_b/redo03b.log',
'/u01/app/oracle/oradata/MOSAproy/fast-reco-area/disk_c/redo03c.log';

alter database open;

