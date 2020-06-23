--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 22 de junio de 2020
--@Descripción: 
--         DESHABILITA LA GENERACIÓN DE DATOS REDO

connect sys/systemproy as sysdba

alter tablespace bibliotecas_tbs nologging;
alter tablespace recursos_tbs nologging;
alter tablespace indx_tbs nologging;
alter tablespace lobs_tbs nologging;