--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 16 de junio de 2020
--@Descripción: 
--         Creación de los usuarios para cada módulo


create user mosaproy_recursos
    identified by mosaproy_recursos
    quota unlimited on recursos_tbs;

create user mosaproy_bibliotecas
    identified by mosaproy_bibliotecas
    quota unlimited on bibliotecas_tbs;


