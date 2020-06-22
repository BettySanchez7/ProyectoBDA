--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         Script para automatizar la generación del modelo

conn mosaproy_bibliotecas/mosaproy_bibliotecas
@@s-09-modulo_bibliotecas_ddl.sql
@@s-09-indices_modulo_bibliotecas.sql
@@s-09-bibliotecas_seq.sql

conn mosaproy_recursos/mosaproy_recursos
@@s-09-modulo_recursos_ddl.sql
@@s-09-indices_modulo_recursos.sql
@@s-09-recursos_seq.sql
