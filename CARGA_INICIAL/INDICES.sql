--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 16 de junio de 2020
--@Descripción: 
--         INDICES



create index biblioteca_folio_uk 
    on biblioteca(folio_uk)
tablespace indx_tbs;

create index recurso_titulo_uk 
    on recurso(lower(titulo))
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

create index hrs_recurso_status_id_ix 
    on historico_recurso_status(recurso_status_id) 
tablespace indx_tbs;

create index hrs_recurso_id_ix 
    on historico_recurso_status(recurso_id) 
tablespace indx_tbs;

create index libro_editorial_id_ix 
    on libro(editorial_id) 
tablespace indx_tbs;

create index libro_autor_autor_id_ix 
    on libro_autor(autor_id) 
tablespace indx_tbs;

create index libro_autor_recurso_id_ix 
    on libro_autor(recurso_id) 
tablespace indx_tbs;

create index pcr_palabra_clave_id_ix 
    on palabra_clave_recurso(palabra_clave_id) 
tablespace indx_tbs;

create index pcr_recurso_id_ix 
    on palabra_clave_recurso(recurso_id) 
tablespace indx_tbs;

create index recurso_area_id_ix 
    on recurso(area_id) 
tablespace indx_tbs;

create index recurso_recurso_status_id_ix 
    on recurso(recurso_status_id) 
tablespace indx_tbs;

create index recurso_recurso_nuevo_id_ix 
    on recurso(recurso_nuevo_id) 
tablespace indx_tbs;

create index recurso_biblioteca_id_ix 
    on recurso(bilioteca_id) 
tablespace indx_tbs;

create index rp_recurso_id_ix 
    on recurso_prestamo(recurso_id) 
tablespace indx_tbs;

create index rp_prestamo_id_ix 
    on recurso_prestamo(prestamo_id) 
tablespace indx_tbs;

create index rp_usuario_id_ix 
    on recurso_prestamo(usuario_id) 
tablespace indx_tbs;

create index revista_editorial_id_ix 
    on revista(editorial_id) 
tablespace indx_tbs;
---
create index libro_libro_pdf_id_ix 
    on libro(libro_pdf_id) 
tablespace indx_tbs;

create index tesis_tesis_pdf_id_ix 
    on tesis(tesis_pdf_id) 
tablespace indx_tbs;


create index usuario_usuario_foto_id_ix 
    on usuario(usuario_foto_id) 
tablespace indx_tbs;