--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 22 de junio de 2020
--@Descripción: 
--         HABILITA LA GENERACIÓN DE DATOS REDO

connect sys/systemproy as sysdba

alter tablespace bibliotecas_tbs logging;
alter tablespace recursos_tbs logging;
alter tablespace indx_tbs logging;
alter tablespace lobs_tbs logging;