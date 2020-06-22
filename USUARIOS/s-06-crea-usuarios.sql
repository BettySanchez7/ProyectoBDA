--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 16 de junio de 2020
--@Descripción: 
--         Creación de los usuarios para cada módulo


create user mosaproy_bibliotecas identified by mosaproy_bibliotecas
  default tablespace bibliotecas_tbs
  quota unlimited on bibliotecas_tbs
  quota unlimited on indx_tbs
  quota unlimited on lobs_tbs;

grant create table, create session, create procedure, 
	create sequence to mosaproy_bibliotecas;


create user mosaproy_recursos identified by mosaproy_recursos
  default tablespace recursos_tbs
  quota unlimited on recursos_tbs
  quota unlimited on indx_tbs
  quota unlimited on lobs_tbs;

grant create table, create session, create procedure, 
	create sequence to mosaproy_recursos;
