CREATE DATABASE siglo;

CREATE TABLE redactores (
    fecha DATE PRIMARY KEY,
    organizacion VARCHAR(45) NOT NULL
);

CREATE TABLE personas (
    id_personas INT PRIMARY KEY,
    apellido VARCHAR(45) NOT NULL,
    nombres VARCHAR(45) NOT NULL,
    fec_nacimiento DATE NOT NULL,
    ciudad_origen VARCHAR(45)
);

CREATE TABLE particpantes (
    fecha DATE PRIMARY KEY,
    apodo VARCHAR(45)
);

CREATE TABLE preguntas (
    id_preguntas INT PRIMARY KEY,
    texto VARCHAR(60) NOT NULL,
    temas_id INT,
    id_personas_redactor INT,
    res VARCHAR(45) NOT NULL
);

CREATE TABLE temas (
    id_temas INT PRIMARY KEY,
    descripcion VARCHAR(45),
    id_temas_padre INT 
);
SELECT * FROM composicion_cuestionario;

CREATE TABLE composicion_cuestionario(
    id_pregunta INT,
    id_cuestionario INT,
    puesto INT NOT NULL,
    permio INT NOT NULL,
    FOREIGN KEY(id_pregunta) REFERENCES preguntas(id_preguntas),
    FOREIGN KEY (id_cuestionario) REFERENCES cuestionarios(id_cuestionarios)
);

CREATE TABLE cuestionarios (
    id_cuestionarios INT PRIMARY KEY,
    fecha_creacion DATE NOT NULL,
    fecha_resp DATE,
    id_personas_participante INT
);

DROP TABLE composicion_cuestionario;

INSERT INTO personas VALUES (1,'Perez','Juan Jose', '1980-01-01', 'Cordoba');
INSERT INTO personas VALUES (2,'Suarez','Jose', '1981-03-01', 'Villa María');
INSERT INTO personas VALUES (3, 'Lopez','Jorge', '1980-05-01', 'Rosario');
INSERT INTO personas VALUES (4, 'Gomez','Victoria', '1980-08-01', 'Mendoza');
INSERT INTO personas VALUES (5, 'Borges','Jorge Luis', '1980-09-01', 'Buenos Aires');
SELECT * FROM PREGUNTAS;

ALTER TABLE redactores ADD COLUMN personas_id INT;
ALTER TABLE redactores ADD CONSTRAINT personas_id FOREIGN KEY(personas_id) REFERENCES personas(id_personas);
INSERT INTO redactores VALUES('2020-05-08', 'Editorial El Aleph', 5);

INSERT INTO temas VALUES (1,'Deportes',null);
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

ALTER TABLE cuestionarios ADD COLUMN fecha_asignacion DATE;
ALTER TABLE cuestionarios ADD COLUMN fecha_respuesta DATE;
ALTER TABLE cuestionarios ADD COLUMN id_personas_partcipante INT;

INSERT INTO cuestionarios VALUES (1,'2019-04-01','2020-03-20','2020-04-20','2020-04-02',1);
INSERT INTO cuestionarios VALUES (2,'2019-04-03',' 2020-03-20',' 2020-04-20',' 2020-04-09',2);
INSERT INTO cuestionarios VALUES (3, '2019-04-08',' 2020-03-20',' 2020-04-20',' 2020-04-16',3);
INSERT INTO cuestionarios VALUES (4, '2019-04-03',' 2020-03-20',' 2020-04-20',' 2020-04-23',2);
INSERT INTO cuestionarios VALUES(5, '2019-04-03',' 2020-03-20',' 2020-04-20',' 2020-04-30',4);
INSERT INTO cuestionarios VALUES (6, '2019-04-03',' 2020-03-20',' 2020-04-20',' 2020-05-07',3);

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
