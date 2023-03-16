CREATE DATABASE monitorHealth1;

USE monitorHealth1;

CREATE TABLE tbEmpresa (
idEmpresa INT PRIMARY KEY auto_increment,
  nomeEmpresa varchar(60) NOT NULL,
  cnpj char(14) NOT NULL,
  segmento varchar(20) NOT NULL,
  tel char(10) NOT NULL,
  email varchar(30) NOT NULL,
  cep char(7) NOT NULL,
  numero varchar(5) NOT NULL,
  complemento varchar(20)
) auto_increment = 100;

CREATE TABLE tbUsuario (
  idUsuario INT PRIMARY KEY auto_increment,
  nomeUsuario varchar(60) NOT NULL,
  senha varchar(60) NOT NULL,
  -- Permissão basica: Apenas visualização dos dados;
  -- Permissão intermediario: Visualização dos dados, permissão para alterar algumas configurações;
  -- Permissão total: Permissão para realizar todas as ações dentro do sistema, incluindo criar novos usuarios dentro da empresa.
  permissoes varchar(30), CONSTRAINT chkPermissao CHECK (permissoes IN('Básico', 'Intermediário', 'Total')),
  idEmpresa INT
) auto_increment = 1000;


CREATE TABLE tbSensor (
  idSensor INT PRIMARY KEY auto_increment,
  tipoSensor varchar(30), CONSTRAINT chkTipo CHECK (tipoSensor IN('Presença', 'Temperatura')),
  dtInstalacao DATE NOT NULL,
  localInstalacao varchar(60) NOT NULL
);

CREATE TABLE tbEntradaSensor (
  idEntrada INT PRIMARY KEY auto_increment,
  valorEntrada FLOAT NOT NULL, -- No caso do sensor de presença será 0 ou 1
  dtEntrada DATETIME NOT NULL,
  idSensor INT
) auto_increment = 10000;

DESC tbUsuario;

INSERT INTO tbEmpresa VALUES
	(null, 'Vaccines', '12345678912456', 'Saúde', '1192345888', 'contato@vacinnes.com.br', '1234567', '23', null),
    (null, 'Nayra Belarmino', '23435678435674', 'Saúde', '1192345222', 'contato@belarmino.com.br', '1234222', '55', null),
    (null, 'Fisnack', '12345678912', 'Saúde', '1192345111', 'contato@fisnack.com.br', '1234000', '434', null),
    (null, 'VacSoluções', '12346473218912', 'Saúde', '1192345886', 'contato@vacsolucoes.com.br', '1223467', '01', null);
    
SELECT * FROM tbEmpresa;

INSERT INTO tbUsuario VALUES 
	(null, 'adm_vaccines', '238473245efa', 'Total', 100),
    (null, 'usuario 01 (Vaccines)', 'udhwggr33322', 'Intermediário', 100),
    (null, 'usuario 02 (Vaccines)', 'akenefi33121', 'Básico', 100),
    (null, 'adm_belarmino', 'a3534fdgds', 'Total', 101),
    (null, 'usuario 01 (Belarmino)', 'a34h3he3s', 'Básico', 101),
	(null, 'adm_fisnack', 'fisnack23323', 'Total', 102),
	(null, 'usuario 01 (Fisnack)', 'a33413221', 'Intermediário', 101),
	(null, 'adm_vacsolucoes', 'k243fhdaasa', 'Total', 103),
    (null, 'usuario 01 (VacSoluções)', 'rgerhrtuj455', 'Básico', 103);

SELECT * FROM tbUsuario;

INSERT INTO tbSensor VALUES
	(null, 'Presença', current_date(), 'Geladeira01'),
    (null, 'Temperatura', current_date(), 'Geradeira02'),
    (null, 'Presença', current_date(), 'Geladeira01'),
    (null, 'Temperatura', current_date(), 'Geradeira02'),
	(null, 'Presença', current_date(), 'Geladeira01'),
    (null, 'Temperatura', current_date(), 'Geradeira02'),
    (null, 'Presença', current_date(), 'Geladeira01'),
    (null, 'Temperatura', current_date(), 'Geradeira02');
    
SELECT * FROM tbSensor;
