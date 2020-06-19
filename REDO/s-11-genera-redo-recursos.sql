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
-- ¿ÉSTA TABLA GENERA REDO DE FORMA CONTINUA?
declare

begin
  -- INSERT
  -- UPDATE
  -- DELETE
end;
/


---------------------------------------------------
---- Redo para la tabla RECURSO -------------------
---------------------------------------------------
declare

begin
  -- INSERT
  -- UPDATE
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