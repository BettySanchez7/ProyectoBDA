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
-------- Redo para la tabla AREA ------------------
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
-------- Redo para la tabla BIBLIOTECA ------------
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
---- Redo para la tabla AREA_BIBLIOTECA -----------
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
---- Redo para la tabla USUARIO -------------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/

------------------------------------------------------
---- Redo para la tabla PRESTAMO ---------------------
------------------------------------------------------
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