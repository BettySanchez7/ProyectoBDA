--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         SIMULACIÓN DE UN DÍA DE TRABAJO DE LA BASE DE DATOS EN EL MÓDULO DE BIBLIOTECAS
set serveroutput on;
whenever sqlerror exit rollback


---------------------------------------------------
-------- Redo para la tabla AUTOR -----------------
---------------------------------------------------
-- ¿ÉSTA TABLA GENERA REDO DE FORMA CONTINUA?
declare

begin
  -- INSERT
    
  -- UPDATE
  
  -- DELETE

end;
/


---------------------------------------------------
-------- Redo para la tabla EDITORIAL -------------
---------------------------------------------------
-- ¿ÉSTA TABLA GENERA REDO DE FORMA CONTINUA?
declare 

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
---- Redo para la tabla RECURSO_STATUS ------------
---------------------------------------------------
declare

begin
  -- INSERT

  -- UPDATE

  -- DELETE

end;
/


-----------------------------------------------------
---- Redo para las tablas RECURSO, LIBRO, REVISTA, --
-----------------------------------------------------
declare
    v_max_id number;
    v_count number;
    v_random_isbn pls_integer;
    v_random_editorial pls_integer;

    cursor cur_insert_libro is 
        select recurso_seq.nextval as recurso_id, titulo, clasificacion,
            fecha_adquisicion, fecha_status, tipo_recurso, area_id,
            recurso_status_id, biblioteca_id -- No usa recurso_nuevo_id para facilitar la simulación
        from recurso sample(60) where rownum <= 50 and recurso_nuevo_id is null and tipo_recurso = 1;
    cusor cur_update_libro is
        select recurso_id from recurso sample(100) where rownum <= 50 and recurso_nuevo_id is null and tipo_recurso = 1;
    cursor cur_delete_libro is 
        select recurso_id from recurso sample(100) where rownum <= 50 and recurso_nuevo_id is null and tipo_recurso = 1;
begin
  -- INSERT
    v_count := 0;
    for r in cur_insert loop 
        insert into recurso(
            recurso_id, titulo, clasificacion, fecha_adquisicion, 
            fecha_status, tipo_recurso, area_id, recurso_status_id,  -- recurso_nuevo_id,
            biblioteca_id
        )
        values (
            r.recurso_id, r.titulo, r.clasificacion, r.fecha_adquisicion,
            r.fecha_status, r.tipo_recurso, r.area_id, r.recurso_status_id, -- r.recurso_nuevo_id,
            r.bibliteca_id
        );
        -- En caso de que el recurso sea un libro, insertar en la tabla libro
        if r.tipo_recurso == 1 then
            v_random_isbn := dbms_random.value(1,9999999999999);
            v_random_editorial := dbms_random.value(1,60);
            insert into libro(
                recurso_id, isbn, editorial_id, pdf
            )
            values(                                                 -- Generar LOB aleatoriamente
                r.recurso_id, v_random_isbn, v_random_editorial, to_lob(hextoraw('ab9ef23123a'))
            );
        else if r.tipo_recurso == 2 then
            insert into tesis(
                recurso_id, tesista, carrera, universidad, fecha_publicacion, pdf
            )
            values(
                r.recurso_id, 
            );
        else if r.tipo_recurso == 3 then
        
        end if;

        v_count := v_count + sql%rowcount;
    end loop;
  -- UPDATE
    v_count := 0;

  -- DELETE

end;
/


---------------------------------------------------
---- Redo para la tabla HISTORICO_RECURSO_STATUS --
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
-------- Redo para la tabla LIBRO -----------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
------ Redo para la tabla LIBRO_AUTOR -------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
------ Redo para la tabla PALABRA_CLAVE -----------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
---- Redo para la tabla PALABRA_CLAVE_RECURSO -----
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
------ Redo para la tabla RECURSO_PRESTAMO --------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
------ Redo para la tabla REVISTA -----------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
------ Redo para la tabla TESIS -------------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


Prompt Confirmando Cambios
commit;

whenever sqlerror continue none