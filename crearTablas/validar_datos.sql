use mydb;
SELECT * FROM vivienda;
SELECT * FROM hogar;
SELECT * FROM hogarcombustible;

delete from hogarcombustible;
delete from hogar;
delete from vivienda;
DELETE FROM ciudad WHERE idCiudad = 190352; 
INSERT INTO ciudad values (190352,'NUEVO PARAISO');

SELECT * FROM ciudad WHERE nombre='Nuevo paraiso';
SELECT count(idhogar) from hogar;
SELECT count(idvivienda) from vivienda;