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
---- Redo para la tabla USUARIO -------------------
---------------------------------------------------
declare
  v_count number;

  cursor cur_insert is
    select usuario_seq.nextval as usuario_id, nombre, ap_materno as ap_paterno, 
      ap_paterno as ap_materno, dbms_random.string('x',18) as matricula, 
      (dbms_random.string('l',8)|| substr(email, instr(email,'@',1), length(email))) as email, 
      semestre, dbms_random.string('l',8) as username, 
      password, con_prestamo, con_prestamo_vencido, foto
    from usuario sample(60) where rownum <= 50;

  cursor cur_update is
    select usuario_id, (dbms_random.string('l',8)|| substr(email, instr(email,'@',1), length(email))) as email, 
      dbms_random.string('l',8) as password, 
      round(dbms_random.value(0,1)) as con_prestamo, round(dbms_random.value(0,1)) as con_prestamo_vencido 
    from usuario sample(60) where rownum <= 50;

  cursor cur_delete is
    select usuario_id from usuario sample(60) where rownum <= 50;

begin
  -- INSERT
    v_count := 0;
    for r in cur_insert loop
      insert into usuario(usuario_id, nombre, ap_paterno, ap_materno, matricula, email, semestre, username, password, con_prestamo, con_prestamo_vencido, foto)
      values(r.usuario_id, r.nombre, r.ap_paterno, r.ap_materno, r.matricula, r.email, r.semestre, r.username, r.password, r.con_prestamo, r.con_prestamo_vencido, r.foto);
      v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros insertados en USUARIO: ' || v_count);

  -- UPDATE
    v_count := 0;
    for r in cur_update loop
      update usuario set email = r.email, password = r.password, con_prestamo = r.con_prestamo, con_prestamo_vencido = r.con_prestamo_vencido
      where usuario_id = r.usuario_id;
      v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en USUARIO: ' || v_count);

  -- DELETE
    v_count := 0;
    for r in cur_delete loop
      delete from usuario where usuario_id = r.usuario_id;
      v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros eliminados en USUARIO: ' || v_count);
end;
/

------------------------------------------------------
---- Redo para la tabla PRESTAMO ---------------------
------------------------------------------------------
declare
  v_count number;
  cursor cur_insert is
    select prestamo_seq.nextval as prestamo_id, usuario_id, sysdate as fecha_prestamo, sysdate + 30 as vigencia
    from prestamo sample(60) where rownum <= 50;

  cursor cur_update is
    select prestamo_id, usuario_id, sysdate as fecha_entrega, trunc(dbms_random.value(1,1000),2) as importe_multa
    from prestamo sample(60) where rownum <= 50;
  
begin
  -- INSERT
  v_count := 0;
  for r in cur_insert loop
    insert into prestamo(prestamo_id, usuario_id, fecha_prestamo, vigencia)
    values(r.prestamo_id, r.usuario_id, r.fecha_prestamo, r.vigencia);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en PRESTAMO: ' || v_count);
  -- UPDATE
  v_count := 0;
  for r in cur_update loop
    update prestamo set fecha_entrega = r.fecha_entrega, importe_multa = r.importe_multa
    where prestamo_id = r.prestamo_id and usuario_id = r.usuario_id;
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en PRESTAMO: ' || v_count);

end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none