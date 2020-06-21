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
    v_count_historico number;
    v_count number;
    v_random_isbn number;
    v_random_editorial number;
    v_tesista varchar2(100);
    v_carrera varchar2(100);
    v_universidad varchar2(100);
    v_random_emision number;
    v_sinopsis varchar2(1024);
    v_recurso_nuevo_id number;

    cursor cur_insert is 
        select recurso_seq.nextval as recurso_id, titulo, 
            dbms_random.string('l',18) as clasificacion,
            sysdate as fecha_adquisicion, sysdate as fecha_status, 
            tipo_recurso, area_id, recurso_status_id, 
            biblioteca_id 
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null;
    
    cursor cur_update is
        select recurso_id, round(dbms_random.value(1,7)) as recurso_status_id
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null;

    cursor cur_delete is 
        select recurso_id, tipo_recurso 
        from recurso sample(60) 
        where rownum <= 50 
        and recurso_nuevo_id is null;


begin
    v_count_historico := 0;
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

        insert into historico_recurso_status(historico_recurso_status_id, fecha_status, recurso_status_id, recurso_id)
        values(hist_recurso_status_seq.nextval, sysdate, r.recurso_status_id, r.recurso_id);

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
    v_count_historico := v_count_historico + v_count;
  -- UPDATE
    v_count := 0;
    for r in cur_update loop
        
        select recurso_id into v_recurso_nuevo_id
        from (
          select recurso_id 
          from recurso sample(10)
          order by dbms_random.random
        )
        where rownum < 2;

        update recurso set recurso_status_id = r.recurso_status_id, recurso_nuevo_id = v_recurso_nuevo_id
        where recurso_id = r.recurso_id;
        insert into historico_recurso_status(historico_recurso_status_id, fecha_status, recurso_status_id, recurso_id)
        values(hist_recurso_status_seq.nextval, sysdate, r.recurso_status_id, r.recurso_id);
        v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en RECURSO: ' || v_count);
    v_count_historico := v_count_historico + v_count;
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

    dbms_output.put_line('Registros insertados en HISTORICO_RECURSO_STATUS: ' || v_count_historico);
end;
/



---------------------------------------------------
---- Redo para la tabla PALABRA_CLAVE_RECURSO -----
---------------------------------------------------
declare
  v_count number;
  v_palabra_clave_id number;
  v_recurso_id number;
  v_palabra_clave_recurso_id number;
  v_eliminar number;
  v_insertar number;
  v_actualizar number;
begin
  v_count := 0;
  v_insertar := round(dbms_random.value(500,1000));
  -- INSERT
  for r in 1..v_insertar loop
      select palabra_clave_id into v_palabra_clave_id
      from (
          select palabra_clave_id
          from palabra_clave sample(10)
          order by dbms_random.random
      ) 
      where rownum < 2;
      select recurso_id into v_recurso_id
      from (
          select recurso_id
          from recurso sample(10)
          order by dbms_random.random
      )
      where rownum < 2;
      insert into palabra_clave_recurso(palabra_clave_recurso_id, palabra_clave_id, recurso_id)
      values(pal_clave_recurso_seq.nextval, v_palabra_clave_id, v_recurso_id);
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en PALABRA_CLAVE_RECURSO: ' || v_count);

  v_count := 0;
  v_actualizar := round(dbms_random.value(50,100));
  -- UPDATE
  for r in 1..v_actualizar loop
      select palabra_clave_recurso_id into v_palabra_clave_recurso_id
      from (
        select palabra_clave_recurso_id
        from palabra_clave_recurso sample(10)
        order by dbms_random.random
      )
      where rownum < 2;
      select palabra_clave_id into v_palabra_clave_id
      from (
          select palabra_clave_id
          from palabra_clave sample(10)
          order by dbms_random.random
      ) 
      where rownum < 2;
      select recurso_id into v_recurso_id
      from (
          select recurso_id
          from recurso sample(10)
          order by dbms_random.random
      )
      where rownum < 2;
      update palabra_clave_recurso set palabra_clave_id = v_palabra_clave_id, recurso_id = v_recurso_id 
      where palabra_clave_recurso_id = v_palabra_clave_recurso_id;
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en PALABRA_CLAVE_RECURSO: ' || v_count);

  v_count := 0;
  v_eliminar := round(dbms_random.value(50,100));
  -- DELETE
  for r in 1..v_eliminar loop
    select palabra_clave_recurso_id into v_palabra_clave_recurso_id
    from (
        select palabra_clave_recurso_id
        from palabra_clave_recurso sample(10)
        order by dbms_random.random
    )
    where rownum < 2;
    delete from palabra_clave_recurso where palabra_clave_recurso_id = v_palabra_clave_recurso_id;
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros eliminados en PALABRA_CLAVE_RECURSO: ' || v_count);
end;
/


---------------------------------------------------
------ Redo para la tabla RECURSO_PRESTAMO --------
---------------------------------------------------
declare
  v_count number;
  v_insertar number;
  v_actualizar number;
  v_eliminar number;
  v_recurso_prestamo_id number;
  v_recurso_id number;
  v_prestamo_id number;
  v_usuario_id number;

begin
  v_count := 0;
  v_insertar := round(dbms_random.value(500,1000));
  -- INSERT
  for r in 1..v_insertar loop
      select prestamo_id, usuario_id into v_prestamo_id, v_usuario_id
      from (
          select prestamo_id, usuario_id
          from mosaproy_bibliotecas.prestamo sample(10)
          order by dbms_random.random
      )
      where rownum < 2;
      select recurso_id into v_recurso_id
      from (
        select recurso_id
        from recurso sample(10)
        order by dbms_random.random
      )
      where rownum < 2;
      insert into recurso_prestamo(recurso_prestamo_id, recurso_id, prestamo_id,usuario_id)
      values(recurso_prestamo_seq.nextval, v_recurso_id, v_prestamo_id, v_usuario_id);
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en RECURSO_PRESTAMO: ' || v_count);

  v_count := 0;
  v_actualizar := round(dbms_random.value(50,100));
  -- UPDATE
  for r in 1..v_actualizar loop
      select recurso_prestamo_id into v_recurso_prestamo_id
      from (
        select recurso_prestamo_id
        from recurso_prestamo sample(10)
        order by dbms_random.random
      )
      where rownum < 2;
      select recurso_id into v_recurso_id
      from (
          select recurso_id
          from recurso sample(10)
          order by dbms_random.random
      )
      where rownum < 2;
      select prestamo_id, usuario_id into v_prestamo_id, v_usuario_id
      from (
          select prestamo_id, usuario_id
          from mosaproy_bibliotecas.prestamo sample(10)
          order by dbms_random.random
      )
      where rownum < 2;
      update recurso_prestamo set recurso_id = v_recurso_id, prestamo_id = v_prestamo_id, usuario_id = v_usuario_id
      where recurso_prestamo_id = v_recurso_prestamo_id;
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en RECURSO_PRESTAMO: ' || v_count);

  v_count := 0;
  v_eliminar := round(dbms_random.value(50,100));
  -- DELETE
  for r in 1..v_eliminar loop
      select recurso_prestamo_id into v_recurso_prestamo_id
      from (
        select recurso_prestamo_id
        from recurso_prestamo sample(10)
        order by dbms_random.random
      )
      where rownum < 2;
      delete from recurso_prestamo where recurso_prestamo_id = v_recurso_prestamo_id;
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros eliminados en RECURSO_PRESTAMO: ' || v_count);
end;
/


Prompt Confirmando Cambios
commit;

whenever sqlerror continue none