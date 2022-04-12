CREATE DATABASE AgroTech;

USE AgroTech;

CREATE TABLE tipoUsuario(
    idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR (20),
    CONSTRAINT ChkTipoUsuario CHECK(tipo IN('adminstrador', 'comum'))
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(150),
    numero VARCHAR(150),
    bairro VARCHAR(150),
    cidade VARCHAR(150)
);


CREATE TABLE fazenda (
	idFazenda INT PRIMARY KEY AUTO_INCREMENT,
    hectar DOUBLE,
    tipoPlantacao VARCHAR(15),
    fkEndereco INT,
    FOREIGN KEY (fkEndereco) REFERENCES	endereco(idEnredeco)
);

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    numSerie VARCHAR(150),
    dtInst DATE,
    fkEndereco INT,
    FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE dado_sensor(
	idDados INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DOUBLE,
    umidade DOUBLE,
    dtInfo DATETIME,
    fkSensor INT,
    FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor),
    fkFazenda INT,
    FOREIGN KEY (fkFazenda) REFERENCES fazenda(idFazenda),
    fkEndereco INT,
    FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE empresa(
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(100),
    CNPJ CHAR(11) UNIQUE,
    endereco VARCHAR(150),
    cidade VARCHAR(45),
    fkEndereco INT,
    FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
    fkFazenda INT,
    FOREIGN KEY (fkFazenda) REFERENCES fazenda(idFazenda)
);

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(65),
    CPF CHAR(11) UNIQUE,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100),
    fkTipoUsuario INT,
    FOREIGN KEY (fkTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario),
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

