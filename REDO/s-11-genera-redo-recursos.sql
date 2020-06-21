--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         SIMULACIÓN DE UN DÍA DE TRABAJO DE LA BASE DE DATOS EN EL MÓDULO DE BIBLIOTECAS
set serveroutput on;
whenever sqlerror exit rollback


--'DP', 'Disponible para prestamo'
--'P', 'En prestamo'
--'C', 'Solo de consulta'
--'D', 'Dañado'
--'R', 'En reparacion'
--'E','Extraviado'
--'PE', 'Prestamo expirado'


----------------------------------------------------------
--- Redo para las tablas RECURSO, LIBRO, TESIS, REVISTA --
----------------------------------------------------------
declare
    v_max_id number;
    v_count number;
    v_random_isbn number;
    v_random_editorial number;
    v_tesista varchar2(100);
    v_carrera varchar2(100);
    v_universidad varchar2(100);
    v_random_emision number;
    v_sinopsis varchar2(1024);

    cursor cur_insert is 
        select recurso_seq.nextval as recurso_id, titulo, 
            dbms_random.string('l',18) as clasificacion,
            sysdate as fecha_adquisicion, sysdate as fecha_status, 
            1 as tipo_recurso, area_id, recurso_status_id, 
            biblioteca_id 
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null 
        and tipo_recurso = 1;
    
    cursor cur_update is
        select recurso_id, round(dbms_random.value(1,7)) as recurso_status_id, 
            round(dbms_random.value(1,200)) as recurso_nuevo_id
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null;

    cursor cur_delete is 
        select recurso_id, tipo_recurso 
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null;


begin

  -- INSERT
    v_count := 0;
    for r in cur_insert loop 
        insert into recurso(
            recurso_id, titulo, clasificacion, fecha_adquisicion, 
            fecha_status, tipo_recurso, area_id, recurso_status_id,
            biblioteca_id
        )
        values (
            r.recurso_id, r.titulo, r.clasificacion, r.fecha_adquisicion,
            r.fecha_status, r.tipo_recurso, r.area_id, r.recurso_status_id, 
            r.biblioteca_id
        );
        if r.tipo_recurso = 1 then
            v_random_isbn := round(dbms_random.value(1,9999999999999));
            v_random_editorial := round(dbms_random.value(1,60));
            insert into libro(
              recurso_id, isbn, editorial_id, pdf
            )
            values(                                                 
               r.recurso_id, v_random_isbn, v_random_editorial, to_blob(hextoraw('ab9ef23123a'))
            );
        elsif r.tipo_recurso = 2 then

            select tesista into v_tesista 
            from (
                select tesista 
                from tesis sample(10)
                order by dbms_random.random
            ) 
            where rownum < 2;

            select carrera into v_carrera
            from (
                select carrera
                from tesis sample(10)
                order by dbms_random.random
            )
            where rownum < 2;

            select universidad into v_universidad
            from (
                select universidad
                from tesis sample(10)
                order by dbms_random.random
            )
            where rownum < 2;

            insert into tesis(recurso_id, tesista, carrera, universidad, fecha_publicacion, pdf)
            values (r.recurso_id, v_tesista, v_carrera, v_universidad, sysdate, to_blob(hextoraw('ab9ef23123a')));

        elsif r.tipo_recurso = 3 then

            select sinopsis into v_sinopsis
            from (
                select sinopsis 
                from revista sample(10)
                order by dbms_random.random
            )
            where rownum < 2;

            v_random_emision := round(dbms_random.value(1,250));
            v_random_editorial := round(dbms_random.value(1,60));

            insert into revista(recurso_id, sinopsis, fecha_publicacion, emision, editorial_id)
            values (r.recurso_id, v_sinopsis, sysdate, v_random_emision, v_random_editorial);

        end if;
        v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros insertados en RECURSO: ' || v_count);

  -- UPDATE
    v_count := 0;
    for r in cur_update loop
        update recurso set recurso_status_id = r.recurso_status_id, recurso_nuevo_id = r.recurso_nuevo_id
        where recurso_id = r.recurso_id;
        v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en RECURSO: ' || v_count);
  
    -- DELETE
    v_count := 0;
    for r in cur_delete loop
        if r.tipo_recurso = 1 then
            delete from libro where recurso_id = r.recurso_id;
        elsif r.tipo_recurso = 2 then
            delete from tesis where recurso_id = r.recurso_id;
        elsif r.tipo_recurso = 3 then
            delete from revista where recurso_id = r.recurso_id;
        end if;
        delete from recurso where recurso_id = r.recurso_id;
        v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros eliminados en RECURSO: ' || v_count);
end;
/


---------------------------------------------------
---- Redo para la tabla HISTORICO_RECURSO_STATUS --
---------------------------------------------------
--declare

--begin
  -- INSERT
  -- UPDATE
  -- DELETE
--end;
--/




---------------------------------------------------
------ Redo para la tabla PALABRA_CLAVE -----------
---------------------------------------------------
--declare

--begin
  -- INSERT
  -- UPDATE
  -- DELETE
--end;
--/


---------------------------------------------------
---- Redo para la tabla PALABRA_CLAVE_RECURSO -----
---------------------------------------------------
--declare

--begin
  -- INSERT
  -- UPDATE
  -- DELETE
--end;
--/


---------------------------------------------------
------ Redo para la tabla RECURSO_PRESTAMO --------
---------------------------------------------------
--declare

--begin
  -- INSERT
  -- UPDATE
  -- DELETE
--end;
--/


Prompt Confirmando Cambios
commit;

whenever sqlerror continue none