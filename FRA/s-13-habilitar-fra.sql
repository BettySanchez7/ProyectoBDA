--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--        Habilitar FRA


--CARPETA PARA FRA
!mkdir /u01/app/oracle/oradata/MOSAproy/fast-reco-area

--MODIFICAR TAMAÑO DE FRA CUANDO YA SE TENGAN LOS DATOS CALCULADOS
alter system set db_recovery_file_dest_size=1700m scope=both;

--ruta destino de la FRA
alter system set db_recovery_file_dest='/u01/app/oracle/oradata/MOSAproy/fast-reco-area' scope=both;


--Periodo de retención de un día
alter system set db_flashback_retention_target=1440 scope=both;

--segunda copia de los archive redo logs en la FRA
alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST' scope=both;
