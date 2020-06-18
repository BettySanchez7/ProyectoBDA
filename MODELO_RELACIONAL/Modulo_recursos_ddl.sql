--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 12 de junio de 2020
--@Descripción: 
--         DDL RECURSOS



-- 
-- TABLE: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE      VARCHAR2(100)    NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX AUTOR_PK ON AUTOR(AUTOR_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;


-- 
-- TABLE: EDITORIAL 
--

CREATE TABLE EDITORIAL(
    EDITORIAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE           VARCHAR2(40)     NOT NULL,
    NOMBRE          VARCHAR2(100)    NOT NULL,
    DESCRIPCION     VARCHAR2(500)    NOT NULL,
    CONSTRAINT EDITORIAL_PK PRIMARY KEY (EDITORIAL_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX EDITORIAL_PK ON EDITORIAL(EDITORIAL_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;

-- 
-- TABLE: RECURSO_STATUS 
--

CREATE TABLE RECURSO_STATUS(
    RECURSO_STATUS_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                VARCHAR2(40)     NOT NULL,
    DESCRIPCION          VARCHAR2(500)    NOT NULL,
    CONSTRAINT RECURSO_STATUS_PK PRIMARY KEY (RECURSO_STATUS_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX RECURSO_STATUS_PK ON RECURSO_STATUS(RECURSO_STATUS_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;


-- 
-- TABLE: RECURSO 
--

CREATE TABLE RECURSO(
    RECURSO_ID           NUMBER(10, 0)    NOT NULL,
    TITULO               VARCHAR2(150)    NOT NULL,
    CLASIFICACION        VARCHAR2(18)     NOT NULL,
    FECHA_ADQUISICION    DATE             NOT NULL,
    FECHA_STATUS         DATE             NOT NULL,
    TIPO_RECURSO         NUMBER(1, 0)     NOT NULL,
    AREA_ID              NUMBER(10, 0)    NOT NULL,
    RECURSO_STATUS_ID    NUMBER(10, 0)    NOT NULL,
    RECURSO_NUEVO_ID     NUMBER(10, 0),
    BIBLIOTECA_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT RECURSO_RECURSO_STATUS_ID_FK FOREIGN KEY (RECURSO_STATUS_ID)
    REFERENCES RECURSO_STATUS(RECURSO_STATUS_ID),
    CONSTRAINT RECURSO_AREA_ID_FK FOREIGN KEY (AREA_ID)
    REFERENCES MOSAPROY_BIBLIOTECAS.AREA(AREA_ID),
    CONSTRAINT RECURSO_RECURSO_NUEVO_ID_FK FOREIGN KEY (RECURSO_NUEVO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT RECURSO_BIBLIOTECA_ID_FK FOREIGN KEY (BIBLIOTECA_ID)
    REFERENCES MOSAPROY_BIBLIOTECAS.BIBLIOTECA(BIBLIOTECA_ID),
    CONSTRAINT RECURSO_PK PRIMARY KEY (RECURSO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX RECURSO_PK ON RECURSO(RECURSO_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;


-- 
-- TABLE: HISTORICO_RECURSO_STATUS 
--

CREATE TABLE HISTORICO_RECURSO_STATUS(
    HISTORICO_RECURSO_STATUS_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                   DATE             NOT NULL,
    RECURSO_STATUS_ID              NUMBER(10, 0)    NOT NULL,
    RECURSO_ID                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HISTORICO_RS_RECURSO_STATUS_ID_FK FOREIGN KEY (RECURSO_STATUS_ID)
    REFERENCES RECURSO_STATUS(RECURSO_STATUS_ID),
    CONSTRAINT HISTORICO_RS_RECURSO_ID FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT HISTORICO_RECURSO_STATUS_PK PRIMARY KEY (HISTORICO_RECURSO_STATUS_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX HISTORICO_RECURSO_STATUS_PK ON HISTORICO_RECURSO_STATUS(HISTORICO_RECURSO_STATUS_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;


-- 
-- TABLE: LIBRO 
--

CREATE TABLE LIBRO(
    RECURSO_ID      NUMBER(10, 0)    NOT NULL,
    ISBN            NUMBER(13, 0)    NOT NULL,
    EDITORIAL_ID    NUMBER(10, 0)    NOT NULL,
    PDF             BLOB             NOT NULL,
    CONSTRAINT LIBRO_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT LIBRO_EDITORIAL_ID_FK FOREIGN KEY (EDITORIAL_ID)
    REFERENCES EDITORIAL(EDITORIAL_ID),
    CONSTRAINT LIBRO_PK PRIMARY KEY (RECURSO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX LIBRO_PK ON LIBRO(LIBRO_ID)
        TABLESPACE INDX_TBS)

) TABLESPACE RECURSOS_TBS
  LOB (PDF) STORE AS SECUREFILE (TABLESPACE LOBS_TBS);


-- 
-- TABLE: LIBRO_AUTOR 
--

CREATE TABLE LIBRO_AUTOR(
    LIBRO_AUTOR_ID    NUMBER(10, 0)    NOT NULL,
    AUTOR_ID          NUMBER(10, 0)    NOT NULL,
    RECURSO_ID        NUMBER(10, 0)    NOT NULL, 
    CONSTRAINT LIBRO_AUTOR_AUTOR_ID_FK FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID),
    CONSTRAINT LIBRO_AUTOR_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES LIBRO(RECURSO_ID),
    CONSTRAINT LIBRO_AUTOR_PK PRIMARY KEY (LIBRO_AUTOR_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX LIBRO_AUTOR_PK ON LIBRO_AUTOR(LIBRO_AUTOR_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;

-- 
-- TABLE: PALABRA_CLAVE 
--

CREATE TABLE PALABRA_CLAVE(
    PALABRA_CLAVE_ID    NUMBER(10, 0)    NOT NULL,
    SUSTANTIVO_UK       VARCHAR2(40)     NOT NULL,
    CONSTRAINT PALABRA_CLAVE_PK PRIMARY KEY (PALABRA_CLAVE_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX PALABRA_CLAVE_PK ON PALABRA_CLAVE(PALABRA_CLAVE_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;



-- 
-- TABLE: PALABRA_CLAVE_RECURSO 
--

CREATE TABLE PALABRA_CLAVE_RECURSO(
    PALABRA_CLAVE_RECURSO_ID    NUMBER(10, 0)    NOT NULL,
    PALABRA_CLAVE_ID            NUMBER(10, 0)    NOT NULL,
    RECURSO_ID                  NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PALABRA_CR_PALABRA_CLAVE_ID_FK FOREIGN KEY (PALABRA_CLAVE_ID)
    REFERENCES PALABRA_CLAVE(PALABRA_CLAVE_ID),
    CONSTRAINT PALABRA_CR_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT PALABRA_CLAVE_RECURSO_ID_FK PRIMARY KEY (PALABRA_CLAVE_RECURSO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX PALABRA_CLAVE_RECURSO_ID_PK ON PALABRA_CLAVE_RECURSO(PALABRA_CLAVE_RECURSO_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;



-- 
-- TABLE: RECURSO_PRESTAMO 
--

CREATE TABLE RECURSO_PRESTAMO(
    RECURSO_PRESTAMO_ID    NUMBER(10, 0)    NOT NULL,
    RECURSO_ID             NUMBER(10, 0)    NOT NULL,
    PRESTAMO_ID            NUMBER(10, 0)    NOT NULL,
    USUARIO_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT RECURSO_PRESTAMO_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT RECURSO_PRESTAMO_ID_USUARIO_ID_FK FOREIGN KEY (PRESTAMO_ID, USUARIO_ID)
    REFERENCES MOSAPROY_BIBLIOTECAS.PRESTAMO(PRESTAMO_ID, USUARIO_ID),
    CONSTRAINT RECURSO_PRESTAMO_PK PRIMARY KEY (RECURSO_PRESTAMO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX RECURSO_PRESTAMO_PK ON RECURSO_PRESTAMO(RECURSO_PRESTAMO_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;



-- 
-- TABLE: REVISTA 
--

CREATE TABLE REVISTA(
    RECURSO_ID           NUMBER(10, 0)     NOT NULL,
    SINOPSIS             VARCHAR2(1024)    NOT NULL,
    FECHA_PUBLICACION    DATE              NOT NULL,
    EMISION              NUMBER(10, 0)     NOT NULL,
    EDITORIAL_ID         NUMBER(10, 0)     NOT NULL,
    CONSTRAINT REVISTA_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT REVISTA_EDITORIAL_ID_FK FOREIGN KEY (EDITORIAL_ID)
    REFERENCES EDITORIAL(EDITORIAL_ID),
    CONSTRAINT REVISTA_PK PRIMARY KEY (RECURSO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX REVISTA_PK ON REVISTA(REVISTA_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS;


-- 
-- TABLE: TESIS 
--

CREATE TABLE TESIS(
    RECURSO_ID           NUMBER(10, 0)    NOT NULL,
    TESISTA              VARCHAR2(100)    NOT NULL,
    CARRERA              VARCHAR2(100)    NOT NULL,
    UNIVERSIDAD          VARCHAR2(100)    NOT NULL,
    FECHA_PUBLICACION    DATE             NOT NULL,
    PDF                  BLOB             NOT NULL,
    CONSTRAINT TESIS_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT TESIS_PK PRIMARY KEY (RECURSO_ID)
    USING INDEX (     
        CREATE UNIQUE INDEX TESIS_PK ON TESIS(RECURSO_ID)
        TABLESPACE INDX_TBS)
) TABLESPACE RECURSOS_TBS
  LOB (PDF) STORE AS SECUREFILE (TABLESPACE LOBS_TBS);
