CREATE DATABASE monitorHealth;

USE monitorHealth;

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
  permissoes varchar(30) CONSTRAINT chkPermissao CHECK (permissoes IN('Básico', 'Intermediário', 'Total')),
  idEmpresa INT
) auto_increment = 1000;

CREATE TABLE tbSensor (
  idSensor INT PRIMARY KEY auto_increment,
  tipoSensor varchar(30) CONSTRAINT chkTipo CHECK (tipoSensor IN('Presença', 'Temperatura')),
  dtInstalacao DATE NOT NULL,
  localInstalacao varchar(60) NOT NULL,
  idEmpresa INT
);

CREATE TABLE tbEntradaSensor (
  idEntrada INT PRIMARY KEY auto_increment,
  valorEntrada FLOAT NOT NULL, -- No caso do sensor de presença será 0 ou 1
  dtEntrada DATETIME NOT NULL,
  idSensor INT
) auto_increment = 10000;

DESC tbUsuario;

INSERT INTO tbEmpresa VALUES
	(null, 'Vaccines', '12345678912', 'Saúde', '1192345888', 'contato@vacinnes.com.br', '1234567', '23', null);
    
SELECT * FROM tbEmpresa;

INSERT INTO tbUsuario VALUES 
	(null, 'adm_vaccines', '238473245efa', 'Total', 100),
    (null, 'usuario 01', 'udhwggr33322', 'Intermediário', 100),
    (null, 'usuario 02', 'akenefi33121', 'Básico', 100);

SELECT * FROM tbUsuario;

INSERT INTO tbSensor VALUES
	(null, 'Presença', current_date(), 'Geladeira01', 100),
    (null, 'Temperatura', current_date(), 'Geradeira02', 100);

SELECT * FROM tbSensor WHERE idEmpresa = 100;
