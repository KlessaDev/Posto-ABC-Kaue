CREATE DATABASE 'C:\Projetos\Delphi\Posto-ABC-Kaue\POSTO_ABC_DB2.FDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 4096;

CREATE TABLE IMPOSTO (
    ID_IMPOSTO INTEGER GENERATED BY DEFAULT AS IDENTITY,
    DESCRICAO VARCHAR(50),
    ALIQUOTA DECIMAL(10,3)
);

ALTER TABLE IMPOSTO ALTER ID_IMPOSTO restart WITH 1;

ALTER TABLE IMPOSTO ADD CONSTRAINT PK_IMPOSTO PRIMARY KEY (ID_IMPOSTO);

--**************************************************************************

CREATE TABLE IMOBILIZADO (
  ID_IMOBILIZADO INTEGER GENERATED BY DEFAULT AS IDENTITY,
  NUMERO INTEGER NOT NULL,
  STATUS SMALLINT DEFAULT 1 NOT NULL
);

ALTER TABLE IMOBILIZADO ALTER ID_IMOBILIZADO RESTART WITH 1;

ALTER TABLE IMOBILIZADO ADD CONSTRAINT PK_IMOBILIZADO PRIMARY KEY (ID_IMOBILIZADO);

--**************************************************************************

CREATE TABLE COMBUSTIVEL (
    ID_COMBUSTIVEL INTEGER GENERATED BY DEFAULT AS IDENTITY,
	ID_IMPOSTO INTEGER NOT NULL,
	VALOR_LITRO DECIMAL(10,3) NOT NULL,
    DESCRICAO VARCHAR(50) NOT NULL,
	TIPO_COMBUSTIVEL VARCHAR(50) NOT NULL
);

ALTER TABLE COMBUSTIVEL ALTER ID_COMBUSTIVEL RESTART WITH 1;

ALTER TABLE COMBUSTIVEL ADD CONSTRAINT PK_COMBUSTIVEL PRIMARY KEY (ID_COMBUSTIVEL);

ALTER TABLE COMBUSTIVEL ADD CONSTRAINT FK_COMBUSTIVEL_1 FOREIGN KEY (ID_IMPOSTO) 
REFERENCES IMPOSTO (ID_IMPOSTO);

--**************************************************************************

CREATE TABLE TANQUE (
    ID_TANQUE       INTEGER GENERATED BY DEFAULT AS IDENTITY,
    ID_COMBUSTIVEL  INTEGER NOT NULL,
	ID_IMOBILIZADO  INTEGER NOT NULL,
    VOLUME_TOTAL    DECIMAL(15,3) NOT NULL,
    VOLUME_ATUAL    DECIMAL(15,3) NOT NULL
);

ALTER TABLE TANQUE ALTER ID_TANQUE RESTART WITH 1;

ALTER TABLE TANQUE ADD CONSTRAINT PK_TANQUE PRIMARY KEY (ID_TANQUE);

ALTER TABLE TANQUE ADD CONSTRAINT FK_TANQUE_1 FOREIGN KEY (ID_COMBUSTIVEL) 
REFERENCES COMBUSTIVEL (ID_COMBUSTIVEL);

ALTER TABLE TANQUE ADD CONSTRAINT FK_TANQUE_2 FOREIGN KEY (ID_IMOBILIZADO)
REFERENCES IMOBILIZADO (ID_IMOBILIZADO);

--**************************************************************************

CREATE TABLE BOMBA (
    ID_BOMBA INTEGER GENERATED BY DEFAULT AS IDENTITY,
    ID_TANQUE INTEGER NOT NULL,
	ID_IMOBILIZADO  INTEGER NOT NULL,
    DESCRICAO VARCHAR(50)
);

ALTER TABLE BOMBA ALTER ID_BOMBA restart WITH 1;

ALTER TABLE BOMBA ADD CONSTRAINT PK_BOMBA PRIMARY KEY (ID_BOMBA);

ALTER TABLE BOMBA ADD CONSTRAINT FK_BOMBA_1 FOREIGN KEY (ID_TANQUE)
REFERENCES TANQUE (ID_TANQUE);

ALTER TABLE BOMBA ADD CONSTRAINT FK_BOMBA_2 FOREIGN KEY (ID_IMOBILIZADO)
REFERENCES IMOBILIZADO (ID_IMOBILIZADO);

--**************************************************************************

CREATE TABLE ABASTECIMENTO (
    ID_ABASTECIMENTO INTEGER GENERATED BY DEFAULT AS IDENTITY,
    ID_BOMBA INTEGER NOT NULL,
    DATA_HORA TIMESTAMP NOT NULL,
    LITROS DECIMAL(10,3),
    VALOR DECIMAL(10,3),
    VALOR_IMPOSTO DECIMAL(10,3)
);

ALTER TABLE ABASTECIMENTO ALTER ID_ABASTECIMENTO restart WITH 1;

ALTER TABLE ABASTECIMENTO ADD CONSTRAINT PK_ABASTECIMENTO PRIMARY KEY (ID_ABASTECIMENTO);

ALTER TABLE ABASTECIMENTO ADD CONSTRAINT FK_ABASTECIMENTO_1 FOREIGN KEY (ID_BOMBA)
REFERENCES BOMBA (ID_BOMBA);

--**************************************************************************

INSERT INTO IMPOSTO (DESCRICAO, ALIQUOTA) VALUES ('ICMS',13.0);

INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (1,1);
INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (2,1);
INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (3,1);
INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (4,1);
INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (1,1);
INSERT INTO IMOBILIZADO (NUMERO, STATUS) VALUES (2,1);

INSERT INTO COMBUSTIVEL (ID_IMPOSTO, VALOR_LITRO, DESCRICAO, TIPO_COMBUSTIVEL) 
VALUES (1,5.23,'GASOLINA','COMUM');
INSERT INTO COMBUSTIVEL (ID_IMPOSTO, VALOR_LITRO, DESCRICAO, TIPO_COMBUSTIVEL)
VALUES (1,6.47,'DIESEL','S10');

INSERT INTO TANQUE (ID_COMBUSTIVEL, ID_IMOBILIZADO, VOLUME_TOTAL, VOLUME_ATUAL) 
VALUES (1,5,50000,50000);
INSERT INTO TANQUE (ID_COMBUSTIVEL, ID_IMOBILIZADO, VOLUME_TOTAL, VOLUME_ATUAL) 
VALUES (2,6,50000,50000);

INSERT INTO BOMBA (ID_TANQUE, ID_IMOBILIZADO, DESCRICAO) VALUES (1,1,'BOMBA 1');
INSERT INTO BOMBA (ID_TANQUE, ID_IMOBILIZADO, DESCRICAO) VALUES (1,2,'BOMBA 2');
INSERT INTO BOMBA (ID_TANQUE, ID_IMOBILIZADO, DESCRICAO) VALUES (2,3,'BOMBA 3');
INSERT INTO BOMBA (ID_TANQUE, ID_IMOBILIZADO, DESCRICAO) VALUES (2,4,'BOMBA 4');