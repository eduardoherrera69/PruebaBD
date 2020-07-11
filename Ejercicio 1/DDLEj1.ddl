-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-10 14:11:01 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE empleado (
    idempleado      INTEGER NOT NULL,
    nombreempleado  VARCHAR2(4000) NOT NULL,
    fechaingreso    DATE NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );


CREATE TABLE Empleado_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,idEmpleado INTEGER NOT NULL
 ,nombreEmpleado VARCHAR2 (4000) NOT NULL
 ,fechaIngreso DATE NOT NULL
 );

CREATE OR REPLACE TRIGGER Empleado_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Empleado for each row 
 Declare 
  rec Empleado_JN%ROWTYPE; 
  blank Empleado_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.idEmpleado := :NEW.idEmpleado; 
      rec.nombreEmpleado := :NEW.nombreEmpleado; 
      rec.fechaIngreso := :NEW.fechaIngreso; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.idEmpleado := :OLD.idEmpleado; 
      rec.nombreEmpleado := :OLD.nombreEmpleado; 
      rec.fechaIngreso := :OLD.fechaIngreso; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Empleado_JN VALUES rec; 
  END; 
  /CREATE TABLE prestacionservicio (
    idprestacionservicio  INTEGER NOT NULL,
    idservicio            INTEGER NOT NULL,
    idempleado            INTEGER NOT NULL,
    idvehiculo            INTEGER NOT NULL,
    fecha                 DATE NOT NULL,
    servicio_idservicio   INTEGER,
    empleado_idempleado   INTEGER,
    vehiculo_idvehiculo   INTEGER
);

ALTER TABLE prestacionservicio ADD CONSTRAINT prestacionservicio_pk PRIMARY KEY ( idprestacionservicio );


CREATE TABLE prestacionServicio_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,idPrestacionServicio INTEGER NOT NULL
 ,idServicio INTEGER NOT NULL
 ,idEmpleado INTEGER NOT NULL
 ,idVehiculo INTEGER NOT NULL
 ,fecha DATE NOT NULL
 ,Servicio_idServicio INTEGER
 ,Empleado_idEmpleado INTEGER
 ,Vehiculo_idVehiculo INTEGER
 );

CREATE OR REPLACE TRIGGER prestacionServicio_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON prestacionServicio for each row 
 Declare 
  rec prestacionServicio_JN%ROWTYPE; 
  blank prestacionServicio_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.idPrestacionServicio := :NEW.idPrestacionServicio; 
      rec.idServicio := :NEW.idServicio; 
      rec.idEmpleado := :NEW.idEmpleado; 
      rec.idVehiculo := :NEW.idVehiculo; 
      rec.fecha := :NEW.fecha; 
      rec.Servicio_idServicio := :NEW.Servicio_idServicio; 
      rec.Empleado_idEmpleado := :NEW.Empleado_idEmpleado; 
      rec.Vehiculo_idVehiculo := :NEW.Vehiculo_idVehiculo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.idPrestacionServicio := :OLD.idPrestacionServicio; 
      rec.idServicio := :OLD.idServicio; 
      rec.idEmpleado := :OLD.idEmpleado; 
      rec.idVehiculo := :OLD.idVehiculo; 
      rec.fecha := :OLD.fecha; 
      rec.Servicio_idServicio := :OLD.Servicio_idServicio; 
      rec.Empleado_idEmpleado := :OLD.Empleado_idEmpleado; 
      rec.Vehiculo_idVehiculo := :OLD.Vehiculo_idVehiculo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into prestacionServicio_JN VALUES rec; 
  END; 
  /CREATE TABLE servicio (
    idservicio      INTEGER NOT NULL,
    nombreservicio  VARCHAR2(4000) NOT NULL,
    valorservicio   FLOAT NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( idservicio );


CREATE TABLE Servicio_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,idServicio INTEGER NOT NULL
 ,nombreServicio VARCHAR2 (4000) NOT NULL
 ,valorServicio FLOAT NOT NULL
 );

CREATE OR REPLACE TRIGGER Servicio_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Servicio for each row 
 Declare 
  rec Servicio_JN%ROWTYPE; 
  blank Servicio_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.idServicio := :NEW.idServicio; 
      rec.nombreServicio := :NEW.nombreServicio; 
      rec.valorServicio := :NEW.valorServicio; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.idServicio := :OLD.idServicio; 
      rec.nombreServicio := :OLD.nombreServicio; 
      rec.valorServicio := :OLD.valorServicio; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Servicio_JN VALUES rec; 
  END; 
  /CREATE TABLE vehiculo (
    idvehiculo      INTEGER NOT NULL,
    marcavehiculo   VARCHAR2(4000) NOT NULL,
    modelovehiculo  VARCHAR2(4000) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( idvehiculo );


CREATE TABLE Vehiculo_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,idVehiculo INTEGER NOT NULL
 ,marcaVehiculo VARCHAR2 (4000) NOT NULL
 ,modeloVehiculo VARCHAR2 (4000) NOT NULL
 );

CREATE OR REPLACE TRIGGER Vehiculo_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Vehiculo for each row 
 Declare 
  rec Vehiculo_JN%ROWTYPE; 
  blank Vehiculo_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.idVehiculo := :NEW.idVehiculo; 
      rec.marcaVehiculo := :NEW.marcaVehiculo; 
      rec.modeloVehiculo := :NEW.modeloVehiculo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.idVehiculo := :OLD.idVehiculo; 
      rec.marcaVehiculo := :OLD.marcaVehiculo; 
      rec.modeloVehiculo := :OLD.modeloVehiculo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Vehiculo_JN VALUES rec; 
  END; 
  /ALTER TABLE prestacionservicio
    ADD CONSTRAINT prestacionservicio_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

ALTER TABLE prestacionservicio
    ADD CONSTRAINT prestacionservicio_servicio_fk FOREIGN KEY ( servicio_idservicio )
        REFERENCES servicio ( idservicio );

ALTER TABLE prestacionservicio
    ADD CONSTRAINT prestacionservicio_vehiculo_fk FOREIGN KEY ( vehiculo_idvehiculo )
        REFERENCES vehiculo ( idvehiculo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
