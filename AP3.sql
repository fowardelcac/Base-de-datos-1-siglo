CREATE DATABASE siglo;

USE siglo;

CREATE TABLE redactores (
	personas_id INT,
    fecha DATE,
    organizacion VARCHAR(45) NOT NULL,
    PRIMARY KEY(personas_id, fecha)
);

CREATE TABLE personas (
    id_personas INT PRIMARY KEY,
    apellido VARCHAR(45) NOT NULL,
    nombres VARCHAR(45) NOT NULL,
    fec_nacimiento DATE NOT NULL,
    ciudad_origen VARCHAR(45)
);

CREATE TABLE particpantes (
	id_personas_participante INT,
    fecha DATE,
    apodo VARCHAR(45),
    PRIMARY KEY(id_personas_participante, fecha)
);

CREATE TABLE preguntas (
    id_preguntas INT PRIMARY KEY,
    texto VARCHAR(60) NOT NULL,
    temas_id INT,
    id_personas_redactor INT,
    res VARCHAR(45) NOT NULL,
    FOREIGN KEY(temas_id) REFERENCES temas(id_temas),
    FOREIGN KEY(id_personas_redactor) REFERENCES redactores(personas_id)
);

CREATE TABLE temas (
    id_temas INT PRIMARY KEY,
    descripcion VARCHAR(45),
    id_temas_padre INT,
    FOREIGN KEY(id_temas_padre) REFERENCES temas(id_temas)
);
SELECT * FROM composicion_cuestionario;

CREATE TABLE composicion_cuestionario(
    id_pregunta INT,
    id_cuestionario INT,
    puesto INT NOT NULL,
    premio INT,
    PRIMARY KEY(id_pregunta, id_cuestionario)
);

CREATE TABLE cuestionarios (
    id_cuestionarios INT PRIMARY KEY,
    fecha_creacion DATE NOT NULL,
    fecha_asignacion DATE,
    fecha_resp DATE,
    id_personas_participante INT,
    FOREIGN KEY(id_personas_participante) REFERENCES participantes(id_personas_participante)
);

RENAME TABLE particpantes TO participantes;

INSERT INTO personas VALUES (1,'Perez','Juan Jose', '1980-01-01', 'Cordoba');
INSERT INTO personas VALUES (2,'Suarez','Jose', '1981-03-01', 'Villa María');
INSERT INTO personas VALUES (3, 'Lopez','Jorge', '1980-05-01', 'Rosario');
INSERT INTO personas VALUES (4, 'Gomez','Victoria', '1980-08-01', 'Mendoza');
INSERT INTO personas VALUES (5, 'Borges','Jorge Luis', '1980-09-01', 'Buenos Aires');
SELECT * FROM temas;

ALTER TABLE redactores ADD COLUMN personas_id INT;
ALTER TABLE redactores ADD CONSTRAINT personas_id FOREIGN KEY(personas_id) REFERENCES personas(id_personas);
INSERT INTO redactores VALUES(5, '2020-05-08', 'Editorial El Aleph');

INSERT INTO temas VALUES (1,'Deportes', null);
INSERT INTO temas VALUES (5,'Mundiales de Futbol','1');
INSERT INTO temas VALUES (2,'Historia',null);
INSERT INTO temas VALUES (3,'Geografia',null);
INSERT INTO temas VALUES (4,'Geografia Argentina',3);

ALTER TABLE preguntas MODIFY texto VARCHAR(200);
INSERT INTO preguntas VALUES (1,' ¿En qué batalla Napoleón fue derrotado por los ingleses?',2,5,'Waterloo');
INSERT INTO preguntas VALUES (2,' ¿Qué evento importante de la Revolución de mayo se desarrolló en
    Rosario?',2,5,'Creación de la bandera nacional');
INSERT INTO preguntas VALUES  (3,' ¿Cómo se llama a nuestro primer Gobierno patrio?',2,5,'Primera Junta');
INSERT INTO preguntas VALUES (4,' ¿En qué año se jura la primera Constitución Nacional?',2,5,'1853');
INSERT INTO preguntas VALUES (5,' ¿En qué año se da la última invasión inglesa al puerto de Bs. As.?',2,5,'1807');
INSERT INTO preguntas VALUES (6,' ¿Cuál fue el cargo más importante que alcanzó Domingo F.
    Sarmiento?',2,5,'Presidente de la nación');
INSERT INTO preguntas VALUES  (7,' ¿Cuántas veces fue elegido presidente Hipólito Yrigoyen?',2,5, 'dos veces');
INSERT INTO preguntas VALUES (8,' ¿Quiénes son los autores del Himno Nacional Argentino?',2,5, 'Blas Parera y Vicente
López y Planes');
INSERT INTO preguntas VALUES (9,' ¿Cuántos miembros integraban a los triunviratos de Gobierno después de la
    Revolución de mayo?',2,5, 'tres miembros');
INSERT INTO preguntas VALUES (10,' ¿Quién dirigió el ejército en la campaña a Chile y Perú cruzando los
Andes?',2,5,'José de San Martin');
INSERT INTO preguntas VALUES(11,' ¿Cuál fue la primera batalla contra los españoles después de la Revolución de
Mayo?',2,5,'La batalla de San Lorenzo');
INSERT INTO preguntas VALUES(12,' ¿Manuel Belgrano, en qué batallas triunfó con el Ejercito del Norte?',2,5, 'Salta y
Tucumán');
INSERT INTO preguntas VALUES(13,' ¿Que provincia gobernó Juan Manuel de Rosas?',2,5,'Provincia de Buenos Aires');
INSERT INTO preguntas VALUES(14,'¿Cuál es el país más extenso del planeta?',3,5, 'La Federación Rusa');
INSERT INTO preguntas VALUES(15,'¿Cuál es la provincia más extensa de Argentina?',4,5, 'La provincia de Buenos Aires');
SELECT * FROM cuestionarios;

-- ALTER TABLE cuestionarios ADD COLUMN fecha_asignacion DATE;
-- ALTER TABLE cuestionarios ADD COLUMN fecha_respuesta DATE;
-- ALTER TABLE cuestionarios ADD COLUMN id_personas_partcipante INT;

INSERT INTO cuestionarios(id_cuestionarios, fecha_creacion, fecha_asignacion, fecha_resp, id_personas_participante) VALUES (1,'2019-04-01','2020-04-20','2020-04-02', 1);
INSERT INTO cuestionarios VALUES (2,'2019-04-03', ' 2020-04-20',' 2020-04-09',2);
INSERT INTO cuestionarios VALUES (3, '2019-04-08', '2020-04-20',' 2020-04-16',3);
INSERT INTO cuestionarios VALUES (4, '2019-04-03',' 2020-04-20',' 2020-04-23',2);
INSERT INTO cuestionarios VALUES(5, '2019-04-03',' 2020-04-20',' 2020-04-30',4);
INSERT INTO cuestionarios VALUES (6, '2019-04-03',' 2020-04-20',' 2020-05-07',3);

INSERT INTO composicion_cuestionario VALUES (1,1,1,1000);
INSERT INTO composicion_cuestionario VALUES (2,1,2,2000);
INSERT INTO composicion_cuestionario VALUES (3,1,3,3000);
INSERT INTO composicion_cuestionario VALUES (4,2,1,1000);
INSERT INTO composicion_cuestionario VALUES (5,2,2,2000);
INSERT INTO composicion_cuestionario VALUES (6,2,3,3000);
INSERT INTO composicion_cuestionario VALUES (7,3,1,1000);
INSERT INTO composicion_cuestionario VALUES (8,3,2,2000);
INSERT INTO composicion_cuestionario VALUES (9,3,3,3000);
INSERT INTO composicion_cuestionario VALUES (10,4,1,1000);
INSERT INTO composicion_cuestionario VALUES (11,4,2,2000);
INSERT INTO composicion_cuestionario VALUES (12,4,3,3000);
INSERT INTO composicion_cuestionario VALUES (13,5,3,1000);
INSERT INTO composicion_cuestionario VALUES (14,5,2,2000);
INSERT INTO composicion_cuestionario VALUES (15,5,3,3000);
INSERT INTO composicion_cuestionario VALUES (14,6,1,1000);
INSERT INTO composicion_cuestionario VALUES (15,6,2,2000);

DELIMITER //
CREATE PROCEDURE procedimiento11(IN id_personas_participante INT)
BEGIN
	SELECT apellido FROM personas
    WHERE id_personas_participante = id_personas_participante;
END// 
DELIMITER ;

INSERT INTO participantes VALUES (1, '2020-04-01', 'Juanse');
INSERT INTO participantes VALUES (2, '2020-04-01','Chema');
INSERT INTO participantes VALUES (3, '2020-04-08','Chipi');
INSERT INTO participantes VALUES (4, '2020-04-08','Viky');

SELECT * FROM PREGUNTAS;
CALL procedimiento11(1);

-- Procedimiento2 que permita mostrar la respuesta correcta de una pregunta cuyo ID se le pasa como parámetro de entrada

DELIMITER //
CREATE PROCEDURE procedimiento222(IN id_pregunta INT)
BEGIN
	SELECT RES FROM preguntas WHERE id_preguntas = id_pregunta;

END//
DELIMITER ;

SELECT RES FROM preguntas WHERE id_preguntas = 2;
CALL procedimiento222(2);

-- Función1 que muestre en un SELECT las respuestas correctas de las filas de cada 
-- pregunta consultada en el SELECT que las liste.


