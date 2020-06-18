--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 16 de junio de 2020
--@Descripción: 
--         INDICES MODULO_BIBLIOTECAS

connect mosaproy_bibliotecas/mosaproy_bibliotecas


create index biblioteca_folio_uk 
    on biblioteca(folio_uk)
tablespace indx_tbs;

create index usuario_matricula_nombre_ux 
    on usuario(matricula, nombre)
tablespace indx_tbs;


--INDICES DE LLAVES FORANEAS
create index area_biblioteca_id_ix 
    on area_biblioteca(biblioteca_id) 
tablespace indx_tbs; 

create index area_area_id_ix 
    on area_biblioteca(area_id) 
tablespace indx_tbs;
--INDICES BLOB

create index usuario_usuario_foto_id_ix 
    on usuario(usuario_foto_id) 
tablespace indx_tbs;
