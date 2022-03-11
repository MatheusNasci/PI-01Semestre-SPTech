CREATE DATABASE SmartParking;

USE SmartParking;

CREATE TABLE Administrador (
	IdADM INT PRIMARY KEY auto_increment,
    nome VARCHAR (60),
    email VARCHAR (60),
    nomeEstabelecimento VARCHAR(60)

);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY auto_increment,
    nome VARCHAR(30),
	hrEntrada DATETIME,
    hrSaida DATETIME,
	ocupacao BOOLEAN
);


SELECT * FROM Administrador;
SELECT * FROM Sensor;