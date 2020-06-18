--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 16 de junio de 2020
--@Descripción: 
--         Creación de la base de datos.


create tablespace recursos_tbs
    datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/recursos_tbs_01.dbf' size 100m, 
             '/u01/app/oracle/oradata/MOSAproy/disk_2/recursos_tbs_02.dbf' size 100m, 
             '/u01/app/oracle/oradata/MOSAproy/disk_3/recursos_tbs_03.dbf' size 100m
    autoextent on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace bibliotecas_tbs
    datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/bibliotecas_tbs_01.dbf' size 100m, 
             '/u01/app/oracle/oradata/MOSAproy/disk_2/bibliotecas_tbs_02.dbf' size 100m,
             '/u01/app/oracle/oradata/MOSAproy/disk_3/bibliotecas_tbs_03.dbf' size 100m
    autoextent on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;


create tablespace indx_tbs logging
    datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/indx01.dbf' size 100m,
             '/u01/app/oracle/oradata/MOSAproy/disk_2/indx02.dbf' size 100m,
             '/u01/app/oracle/oradata/MOSAproy/disk_3/indx03.dbf' size 100m
    autoextend on next 1280k maxsize unlimited
    extent management local
;

create tablespace lobs_tbs
    datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/lobs_tbs01.dbf' size 1000m, 
             '/u02/app/oracle/oradata/MOSAproy/disk_2/lobs_tbs02.dbf' size 1000m,
             '/u03/app/oracle/oradata/MOSAproy/disk_3/lobs_tbs03.dbf' size 1000m
    autoextent on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;