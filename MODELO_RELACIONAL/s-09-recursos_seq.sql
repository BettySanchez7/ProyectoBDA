--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         SECUENCIAS MODULO RECURSOS

create sequence autor_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence editorial_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence recurso_status_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence recurso_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence hist_recurso_status_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence libro_autor_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence palabra_clave_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;


create sequence pal_clave_recurso_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

create sequence recurso_prestamo_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

