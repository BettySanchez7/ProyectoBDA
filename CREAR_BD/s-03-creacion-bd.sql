--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 11 de junio de 2020
--@Descripción: 
--         Creación de la base de datos.

create database mosaproy
user sys identified by systemproy
user system identified by systemproy
logfile group 1 (
    '/u01/app/oracle/oradata/MOSAproy/disk_1/redo01a.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_2/redo01b.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_3/redo01c.log') size 50m blocksize 512,
group 2 (
    '/u01/app/oracle/oradata/MOSAproy/disk_1/redo02a.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_2/redo02b.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_3/redo02c.log') size 50m blocksize 512,
group 3 (
    '/u01/app/oracle/oradata/MOSAproy/disk_1/redo03a.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_2/redo03b.log',
    '/u01/app/oracle/oradata/MOSAproy/disk_3/redo03c.log') size 50m blocksize 512
maxloghistory 1
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local
datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited
sysaux datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited
default tablespace users
datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/users01.dbf'
size 500m reuse autoextend on maxsize unlimited
default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/MOSAproy/disk_1/temp01.dbf'
size 20m reuse autoextend on next 640k maxsize unlimited
undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/undotbs01.dbf'
size 200m reuse autoextend on next 5120k maxsize unlimited
user_data tablespace usertbs
datafile '/u01/app/oracle/oradata/MOSAproy/disk_1/usertbs01.dbf'
size 200m reuse autoextend on maxsize unlimited;
alter user sys identified by systemproy;
alter user system identified by systemproy;
-- Generando archivo de parámetros binario
create spfile from pfile;
